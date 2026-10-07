# =====================================================================
# Clean.ps1  -  data driven cleanup engine (operations live in
#               Data\cleanup.json: explicit paths or named handlers)
# =====================================================================

function Test-BatSafePath {
    param([string]$Path)
    try { $full = [IO.Path]::GetFullPath($Path).TrimEnd('\') } catch { return $false }
    if ($full.Length -le 10) { return $false }
    if ($full -match '^[A-Za-z]:$') { return $false }
    $deny = @(
        $env:SystemRoot, "$env:SystemRoot\System32", "$env:SystemRoot\WinSxS", "$env:SystemRoot\SysWOW64",
        $env:USERPROFILE, $env:ProgramFiles, ${env:ProgramFiles(x86)}, $env:ProgramData,
        $env:LOCALAPPDATA, $env:APPDATA, "$env:SystemDrive\Users"
    ) | Where-Object { $_ } | ForEach-Object { $_.TrimEnd('\') }
    foreach ($d in $deny) { if ($full -ieq $d) { return $false } }
    $true
}

function Get-BatItemSize {
    param([string]$Path)
    $i = Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    if (-not $i) { return [long]0 }
    if (-not $i.PSIsContainer) { return [long]$i.Length }
    $m = Get-ChildItem -LiteralPath $Path -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
    if ($m.Sum) { return [long]$m.Sum }
    [long]0
}

function Resolve-BatPattern {
    param([string]$Pattern)
    $expanded = [Environment]::ExpandEnvironmentVariables($Pattern)
    if ($expanded -match '[\*\?]') {
        return @(Resolve-Path -Path $expanded -ErrorAction SilentlyContinue | ForEach-Object { $_.ProviderPath })
    }
    if (Test-Path -LiteralPath $expanded) { return @($expanded) }
    @()
}

function Get-BatPatternSize {
    param([string]$Pattern)
    [long]$sum = 0
    foreach ($t in (Resolve-BatPattern $Pattern)) {
        if (Test-BatSafePath $t) { $sum += Get-BatItemSize $t }
    }
    $sum
}

# Deletes the CONTENTS of folders (or the matching files) and returns bytes freed
function Clear-BatPath {
    param([string]$Pattern)
    [long]$freed = 0
    foreach ($t in (Resolve-BatPattern $Pattern)) {
        if (-not (Test-BatSafePath $t)) { Write-BatLog "Skipped protected path: $t" 'WARN'; continue }
        $item = Get-Item -LiteralPath $t -Force -ErrorAction SilentlyContinue
        if (-not $item) { continue }
        $before = Get-BatItemSize $t
        Write-BatLog "Remove-Item -Recurse -Force  $t" 'CMD'
        if ($item.PSIsContainer) {
            Get-ChildItem -LiteralPath $t -Force -ErrorAction SilentlyContinue |
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
        }
        else {
            Remove-Item -LiteralPath $t -Force -ErrorAction SilentlyContinue
        }
        $after = Get-BatItemSize $t
        $gain = $before - $after
        if ($gain -gt 0) { $freed += $gain }
        Write-BatLog ("  {0}  ({1})" -f $t, (Format-BatBytes $gain)) 'INFO'
    }
    $freed
}

function Invoke-BatSpecial {
    param([string]$Name)
    switch ($Name) {
        'RecycleBin' {
            Write-BatLog 'Clear-RecycleBin -Force' 'CMD'
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Write-BatLog 'Recycle Bin emptied' 'INFO'
        }
        'FlushDns' { Invoke-BatCmd 'ipconfig' '/flushdns' | Out-Null }
        'ComponentCleanup' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup' | Out-Null }
        'ResetBase' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup /ResetBase' | Out-Null }
        'HibernateOff' { Invoke-BatCmd 'powercfg.exe' '-h off' | Out-Null }
        'EventLogs' {
            $logs = & wevtutil.exe el 2>$null
            $n = 0
            foreach ($l in $logs) { & wevtutil.exe cl $l 2>$null; $n++ }
            Write-BatLog "Cleared $n event log(s)" 'INFO'
        }
        'WindowsOld' {
            $d = Join-Path $env:SystemDrive 'Windows.old'
            if (Test-Path -LiteralPath $d) {
                Invoke-BatCmd 'takeown.exe' "/F `"$d`" /R /A /D Y" -Silent | Out-Null
                Invoke-BatCmd 'icacls.exe' "`"$d`" /grant *S-1-5-32-544:F /T /C /Q" -Silent | Out-Null
                Remove-Item -LiteralPath $d -Recurse -Force -ErrorAction SilentlyContinue
                if (Test-Path -LiteralPath $d) { Write-BatLog 'Windows.old partly removed (some files locked)' 'WARN' }
                else { Write-BatLog 'Windows.old removed' 'INFO' }
            }
            else { Write-BatLog 'Windows.old not found' 'INFO' }
        }
        'OptimizeDrive' {
            $letter = $env:SystemDrive.TrimEnd(':')
            $media = 'Unspecified'
            try { $media = [string](Get-Partition -DriveLetter $letter -ErrorAction Stop | Get-Disk -ErrorAction Stop | Get-PhysicalDisk -ErrorAction Stop | Select-Object -First 1).MediaType } catch { }
            try {
                if ($media -eq 'HDD') {
                    Write-BatLog "Optimize-Volume -DriveLetter $letter -Defrag  (HDD)" 'CMD'
                    Optimize-Volume -DriveLetter $letter -Defrag -ErrorAction Stop
                }
                else {
                    Write-BatLog "Optimize-Volume -DriveLetter $letter -ReTrim  ($media)" 'CMD'
                    Optimize-Volume -DriveLetter $letter -ReTrim -ErrorAction Stop
                }
                Write-BatLog "Drive $letter optimized" 'OK'
            }
            catch { Write-BatLog "Optimize drive failed: $($_.Exception.Message)" 'ERR' }
        }
        'ShadowOldest' {
            Invoke-BatCmd 'vssadmin.exe' "delete shadows /for=$($env:SystemDrive) /oldest /quiet" | Out-Null
        }
        'OldLogs' {
            $cut = (Get-Date).AddDays(-30)
            [long]$bytes = 0; $n = 0
            foreach ($r in @("$env:SystemRoot\Logs", "$env:SystemRoot\Temp")) {
                if (-not (Test-Path -LiteralPath $r)) { continue }
                Write-BatLog "Scanning $r for .log/.etl older than 30 days" 'CMD'
                $files = Get-ChildItem -LiteralPath $r -Recurse -Force -File -ErrorAction SilentlyContinue |
                    Where-Object { ($_.Extension -eq '.log' -or $_.Extension -eq '.etl') -and $_.LastWriteTime -lt $cut }
                foreach ($f in $files) {
                    $len = $f.Length
                    Remove-Item -LiteralPath $f.FullName -Force -ErrorAction SilentlyContinue
                    if (-not (Test-Path -LiteralPath $f.FullName)) { $bytes += $len; $n++ }
                }
            }
            Write-BatLog ("Removed {0} old log file(s) ({1})" -f $n, (Format-BatBytes $bytes)) 'OK'
        }
        'BrokenShortcuts' {
            $roots = @(
                [Environment]::GetFolderPath('Desktop'),
                [Environment]::GetFolderPath('CommonDesktopDirectory'),
                (Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'),
                (Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs')
            )
            $sh = New-Object -ComObject WScript.Shell
            $n = 0
            foreach ($r in $roots) {
                if (-not $r -or -not (Test-Path -LiteralPath $r)) { continue }
                Write-BatLog "Checking shortcuts in $r" 'CMD'
                foreach ($f in (Get-ChildItem -LiteralPath $r -Filter '*.lnk' -Recurse -Force -File -ErrorAction SilentlyContinue)) {
                    $target = $null
                    try { $target = $sh.CreateShortcut($f.FullName).TargetPath } catch { continue }
                    if (-not $target -or $target -match '^(shell:|\\\\)') { continue }
                    $drive = Split-Path -Path $target -Qualifier -ErrorAction SilentlyContinue
                    if (-not $drive -or -not (Test-Path -LiteralPath $drive)) { continue }
                    if (-not (Test-Path -LiteralPath $target)) {
                        Write-BatLog ("  broken: {0}  ->  {1}" -f $f.FullName, $target) 'INFO'
                        Remove-Item -LiteralPath $f.FullName -Force -ErrorAction SilentlyContinue
                        $n++
                    }
                }
            }
            Write-BatLog "Removed $n broken shortcut(s)" 'OK'
        }
        default { Write-BatLog "Unknown handler: $Name" 'WARN' }
    }
}

function Measure-BatOps {
    param([object[]]$Ops)
    foreach ($op in $Ops) {
        [long]$bytes = 0
        $paths = @($op.paths | Where-Object { $_ })
        foreach ($p in $paths) { $bytes += Get-BatPatternSize $p }
        Write-BatLog ('{0}: {1}' -f $op.name, (Format-BatBytes $bytes)) 'INFO'
        [pscustomobject]@{ Id = $op.id; Bytes = $bytes; Measurable = ($paths.Count -gt 0) }
    }
}

function Invoke-BatCleanOps {
    param([object[]]$Ops)
    [long]$total = 0
    foreach ($op in $Ops) {
        Write-BatLog "Cleaning: $($op.name)" 'STEP'
        [long]$freed = 0
        $stopped = @()
        foreach ($s in @($op.services)) {
            if (-not $s) { continue }
            $svc = Get-Service -Name $s -ErrorAction SilentlyContinue
            if ($svc -and $svc.Status -eq 'Running') {
                Write-BatLog "Stop-Service -Name $s -Force" 'CMD'
                Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
                $stopped += $s
                Write-BatLog "  stopped service $s" 'INFO'
            }
        }
        foreach ($p in @($op.paths)) {
            if ($p) { $freed += (Clear-BatPath -Pattern $p) }
        }
        if ($op.special) { Invoke-BatSpecial -Name $op.special }
        foreach ($s in $stopped) {
            Write-BatLog "Start-Service -Name $s" 'CMD'
            Start-Service -Name $s -ErrorAction SilentlyContinue
            Write-BatLog "  started service $s" 'INFO'
        }
        $total += $freed
        if ($freed -gt 0) { Write-BatLog ('  freed {0}' -f (Format-BatBytes $freed)) 'OK' }
    }
    Write-BatLog ('Total freed (measured paths): {0}' -f (Format-BatBytes $total)) 'OK'
}
