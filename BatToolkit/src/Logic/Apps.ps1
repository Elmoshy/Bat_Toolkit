# =====================================================================
# Apps.ps1  -  Winget / Chocolatey: setup, search, list, install, remove
# =====================================================================

function Install-BatWinget {
    Write-BatLog 'Installing winget (App Installer)...' 'STEP'
    try {
        Add-AppxPackage -RegisterByFamilyName -MainPackage 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe' -ErrorAction Stop
    }
    catch { Write-BatLog "Register step: $($_.Exception.Message)" 'WARN' }
    if (-not (Test-BatCommand winget)) {
        try {
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            $tmp = Join-Path $env:TEMP 'bat-winget'
            New-Item -ItemType Directory -Force -Path $tmp | Out-Null
            $bundle = Join-Path $tmp 'AppInstaller.msixbundle'
            Write-BatLog 'Downloading App Installer bundle' 'INFO'
            Invoke-WebRequest -UseBasicParsing -Uri 'https://aka.ms/getwinget' -OutFile $bundle
            Add-AppxPackage -Path $bundle -ErrorAction Stop
        }
        catch { Write-BatLog "Winget install failed: $($_.Exception.Message)" 'ERR' }
    }
    Update-BatPath
    if (Test-BatCommand winget) { Write-BatLog 'winget is ready' 'OK' } else { Write-BatLog 'winget still not found - sign out and in or reboot then retry' 'ERR' }
}

function Install-BatChoco {
    Write-BatLog 'Installing Chocolatey...' 'STEP'
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) 2>&1 | Out-Null
    }
    catch { Write-BatLog "Chocolatey install failed: $($_.Exception.Message)" 'ERR' }
    Update-BatPath
    if (Test-BatCommand choco) { Write-BatLog 'Chocolatey is ready' 'OK' } else { Write-BatLog 'Chocolatey still not found' 'ERR' }
}

# Parses the fixed width table printed by winget (search / list / upgrade)
function ConvertFrom-BatWingetTable {
    param([string[]]$Lines)
    $idx = -1
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match '^Name\s+Id\s+Version') { $idx = $i; break }
    }
    if ($idx -lt 0) { return @() }
    $hdr = $Lines[$idx]
    $cols = [regex]::Matches($hdr, '\S+')
    $names = @($cols | ForEach-Object { $_.Value })
    $starts = @($cols | ForEach-Object { $_.Index })
    $rows = New-Object System.Collections.ArrayList
    for ($i = $idx + 1; $i -lt $Lines.Count; $i++) {
        $ln = $Lines[$i]
        if ($ln -match 'upgrades? available' -or $ln -match 'following packages') { break }
        if ($ln.Length -le $starts[1]) { continue }
        $o = [ordered]@{}
        for ($c = 0; $c -lt $names.Count; $c++) {
            $s = $starts[$c]
            $e = if ($c -lt $names.Count - 1) { $starts[$c + 1] } else { $ln.Length }
            if ($s -ge $ln.Length) { $o[$names[$c]] = ''; continue }
            if ($e -gt $ln.Length) { $e = $ln.Length }
            $o[$names[$c]] = $ln.Substring($s, $e - $s).Trim()
        }
        if ($o['Id']) { [void]$rows.Add([pscustomobject]$o) }
    }
    $rows.ToArray()
}

function Search-BatPackages {
    param([string]$Query, [string]$Mode = 'both')
    $out = @()
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        $r = Invoke-BatCmd 'winget' "search `"$Query`" --accept-source-agreements" -Silent
        $rows = @(ConvertFrom-BatWingetTable $r.Lines)
        Write-BatLog "winget: $($rows.Count) result(s)" 'INFO'
        foreach ($x in $rows) { $out += [pscustomobject]@{ Name = $x.Name; Id = $x.Id; Version = $x.Version; Available = ''; Source = 'winget' } }
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        $r = Invoke-BatCmd 'choco' "search `"$Query`" --limit-output" -Silent
        $n = 0
        foreach ($l in $r.Lines) {
            $p = $l -split '\|'
            if ($p.Count -ge 2) { $n++; $out += [pscustomobject]@{ Name = $p[0]; Id = $p[0]; Version = $p[1]; Available = ''; Source = 'choco' } }
        }
        Write-BatLog "choco: $n result(s)" 'INFO'
    }
    $out
}

# Installed packages (+ Available column when an update exists)
function Get-BatInstalled {
    param([string]$Mode = 'both')
    $out = @()
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        $r = Invoke-BatCmd 'winget' 'list --accept-source-agreements' -Silent
        $rows = @(ConvertFrom-BatWingetTable $r.Lines)
        Write-BatLog "winget: $($rows.Count) installed item(s)" 'INFO'
        foreach ($x in $rows) {
            $out += [pscustomobject]@{ Name = $x.Name; Id = $x.Id; Version = $x.Version; Available = "$($x.Available)"; Source = 'winget' }
        }
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        $r = Invoke-BatCmd 'choco' 'list --limit-output' -Silent
        $o = Invoke-BatCmd 'choco' 'outdated --limit-output' -Silent
        $avail = @{}
        foreach ($l in $o.Lines) { $p = $l -split '\|'; if ($p.Count -ge 3) { $avail[$p[0]] = $p[2] } }
        $n = 0
        foreach ($l in $r.Lines) {
            $p = $l -split '\|'
            if ($p.Count -ge 2) {
                $n++
                $a = ''
                if ($avail.ContainsKey($p[0])) { $a = $avail[$p[0]] }
                $out += [pscustomobject]@{ Name = $p[0]; Id = $p[0]; Version = $p[1]; Available = $a; Source = 'choco' }
            }
        }
        Write-BatLog "choco: $n installed item(s)" 'INFO'
    }
    $out
}

function Get-BatPkgCommand {
    param([string]$Action, [string]$Source, [string]$Id)
    if ($Source -eq 'winget') {
        $common = '--silent --accept-source-agreements'
        switch ($Action) {
            'install'   { return @('winget', "install --id `"$Id`" -e --accept-package-agreements $common") }
            'uninstall' { return @('winget', "uninstall --id `"$Id`" -e $common") }
            'upgrade'   { return @('winget', "upgrade --id `"$Id`" -e --accept-package-agreements $common") }
        }
    }
    else {
        switch ($Action) {
            'install'   { return @('choco', "install $Id -y --no-progress") }
            'uninstall' { return @('choco', "uninstall $Id -y --no-progress") }
            'upgrade'   { return @('choco', "upgrade $Id -y --no-progress") }
        }
    }
}

# Items: objects with Name, Source (winget|choco), Id
function Invoke-BatPackageOps {
    param([object[]]$Items, [string]$Action)
    $ok = 0
    $bad = 0
    foreach ($it in $Items) {
        Write-BatLog ('{0}: {1} [{2}]' -f $Action.ToUpper(), $it.Name, $it.Source) 'STEP'
        $cmd = Get-BatPkgCommand -Action $Action -Source $it.Source -Id $it.Id
        $r = Invoke-BatCmd $cmd[0] $cmd[1]
        if ($r.ExitCode -eq 0) { Write-BatLog "Success: $($it.Name)" 'OK'; $ok++ }
        else { Write-BatLog "Exit code $($r.ExitCode): $($it.Name)" 'ERR'; $bad++ }
    }
    Write-BatLog "Summary: $ok succeeded and $bad failed" 'INFO'
}
