# =====================================================================
# Tweaks.ps1  -  data driven Windows tweaks (WinUtil compatible schema)
# Reads Data\tweaks.json. Every entry can hold:
#   registry[]      Path, Name, Type, Value, OriginalValue ("<RemoveEntry>" = delete on undo)
#   service[]       Name, StartupType, OriginalType
#   ScheduledTask[] Name, State, OriginalState
#   InvokeScript[]  / UndoScript[]   PowerShell text
# Extra fields (all optional): risk, minBuild, maxBuild, check, restartExplorer
# Before a tweak is applied the CURRENT values are saved to
# %APPDATA%\BatToolkit\tweaks-backup.json and Undo restores from there.
# =====================================================================

function Get-BatWindowsBuild {
    try { return [int](Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -ErrorAction Stop).CurrentBuildNumber }
    catch { return [int][Environment]::OSVersion.Version.Build }
}

function Get-BatTweakBackupPath { Join-Path $env:APPDATA 'BatToolkit\tweaks-backup.json' }

function Initialize-BatHive {
    if (-not (Test-Path 'HKU:\')) { try { [void](New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS -Scope Global) } catch { } }
}

# ----------------------------------------------------------- list
# Extra knowledge layered over the official WinUtil file: build guards, risk levels,
# state checks for script-only tweaks and scripts for the buttons that WinUtil
# implements inside its own code.
function Get-BatTweakOverrides {
    $ultAdd = @'
$out = powercfg /duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>&1 | Out-String
if ($out -match '([0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12})') { powercfg /setactive $Matches[1] | Out-Null; "Ultimate Performance active: $($Matches[1])" } else { throw "Could not create the plan: $out" }
'@
    $ultRemove = @'
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e | Out-Null
$list = powercfg /list | Out-String
foreach ($m in [regex]::Matches($list, '([0-9a-fA-F]{8}-([0-9a-fA-F]{4}-){3}[0-9a-fA-F]{12})\s+\(Ultimate Performance\)')) { powercfg /delete $m.Groups[1].Value | Out-Null }
'@
    $oosu = @'
$dir = Join-Path $env:LOCALAPPDATA 'winutil'
New-Item -ItemType Directory -Path $dir -Force | Out-Null
$exe = Join-Path $dir 'OOSU10.exe'
$ProgressPreference = 'SilentlyContinue'
Write-Host 'Downloading O&O ShutUp10++ (about 82 MB)'
Invoke-WebRequest -Uri 'https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe' -OutFile $exe -UseBasicParsing
Start-Process -FilePath $exe
'@
    @{
        WPFTweaksHiber            = @{ risk = 'Careful'; check = "(Get-BatRegEntry -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'HibernateEnabled').Value -eq 0" }
        WPFTweaksRightClickMenu   = @{ minBuild = 22000; check = "Test-Path -LiteralPath 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32'" }
        WPFTweaksWidget           = @{ minBuild = 22000 }
        WPFTweaksEndTaskOnTaskbar = @{ minBuild = 22621 }
        WPFTweaksWindowsAI        = @{ minBuild = 22621; risk = 'Careful' }
        WPFToggleStartMenuRecommendations = @{ minBuild = 22000 }
        WPFToggleTaskbarAlignment = @{ minBuild = 22000 }
        WPFTweaksServices         = @{ risk = 'Moderate' }
        WPFTweaksDiskCleanup      = @{ risk = 'Moderate' }
        WPFTweaksDeleteTempFiles  = @{ risk = 'Moderate' }
        WPFTweaksRevertStartMenu  = @{ risk = 'Moderate' }
        WPFTweaksWPBT             = @{ risk = 'Moderate' }
        WPFTweaksDeliveryOptimization = @{ risk = 'Moderate' }
        WPFTweaksDisableExplorerAutoDiscovery = @{ risk = 'Moderate' }
        WPFTweaksDisableBitLocker = @{ risk = 'Careful' }
        WPFAddUltPerf             = @{ risk = 'Moderate'; check = "(powercfg /getactivescheme | Out-String) -match 'Ultimate Performance'"; InvokeScript = @($ultAdd); UndoScript = @($ultRemove) }
        WPFRemoveUltPerf          = @{ risk = 'Moderate'; InvokeScript = @($ultRemove) }
        WPFOOSUbutton             = @{ risk = 'Careful'; InvokeScript = @($oosu) }
    }
}

function Get-BatCategoryName {
    param([string]$Raw)
    if ([string]::IsNullOrEmpty($Raw)) { return 'Other' }
    return ($Raw -replace '^z__', '')
}

function New-BatTweakObject {
    param($Id, $Name, $Desc, $Cat, $Type, $Risk, $Min, $Max, $Raw)
    [pscustomobject]@{
        Id = $Id; Name = $Name; Desc = $Desc; Category = $Cat; Type = $Type
        Risk = $Risk; MinBuild = $Min; MaxBuild = $Max; Raw = $Raw
    }
}

function Get-BatTweakList {
    $json = Get-BatResource 'tweaks.json' | ConvertFrom-Json
    $over = Get-BatTweakOverrides
    foreach ($p in $json.PSObject.Properties) {
        $t = $p.Value
        if ($null -eq $t -or $p.Name.StartsWith('_')) { continue }
        $id = [string]$p.Name
        # Covered elsewhere in BatToolkit: DNS page, Clean C:, and the Ultimate Performance undo
        if (@('WPFchangedns', 'WPFOOSUbutton', 'WPFTweaksDiskCleanup', 'WPFTweaksDeleteTempFiles', 'WPFRemoveUltPerf') -contains $id) { continue }
        $o = $over[$id]
        if (-not $o) { $o = @{} }
        $cat = Get-BatCategoryName ([string]$t.category)
        $type = 'Checkbox'
        if ($t.Type) { $type = [string]$t.Type }
        $title = [string]$t.Content
        $desc = [string]$t.Description

        $risk = 'Moderate'
        if ($o.risk) { $risk = [string]$o.risk }
        elseif ($cat -match 'CAUTION') { $risk = 'Careful' }
        elseif ($cat -match 'Essential') { $risk = 'Safe' }
        $min = 0
        $max = 0
        if ($o.minBuild) { $min = [int]$o.minBuild }
        if ($o.maxBuild) { $max = [int]$o.maxBuild }

        # Combobox with per option registry values (for example Multiplane Overlay):
        # every option except the first (the Windows default) becomes its own tweak
        if ($type -eq 'Combobox' -and $t.ComboItems -and @($t.registry).Count -gt 0 -and $t.registry[0].Values) {
            $opts = @(([string]$t.ComboItems) -split '\|')
            for ($k = 1; $k -lt $opts.Count; $k++) {
                $opt = $opts[$k]
                $regs = @()
                foreach ($r in @($t.registry)) {
                    $v = $r.Values.PSObject.Properties[$opt]
                    $d0 = $r.Values.PSObject.Properties[$opts[0]]
                    if (-not $v) { continue }
                    $orig = '<RemoveEntry>'
                    if ($d0) { $orig = [string]$d0.Value }
                    $regs += [pscustomobject]@{ Path = [string]$r.Path; Name = [string]$r.Name; Type = [string]$r.Type; Value = [string]$v.Value; OriginalValue = $orig }
                }
                $od = ''
                if ($t.ComboDescriptions) { $dp = $t.ComboDescriptions.PSObject.Properties[$opt]; if ($dp) { $od = [string]$dp.Value } }
                $raw = [pscustomobject]@{ registry = $regs; service = @(); ScheduledTask = @(); InvokeScript = @(); UndoScript = @(); check = ''; restartExplorer = $false }
                New-BatTweakObject -Id "$id::$opt" -Name "${title}: $opt" -Desc $od -Cat $cat -Type 'Checkbox' -Risk $risk -Min $min -Max $max -Raw $raw
            }
            continue
        }

        $regs = @()
        if ($type -ne 'Combobox') {
            foreach ($r in @($t.registry)) {
                if ($null -eq $r) { continue }
                $regs += [pscustomobject]@{ Path = [string]$r.Path; Name = [string]$r.Name; Type = [string]$r.Type; Value = [string]$r.Value; OriginalValue = [string]$r.OriginalValue; DefaultState = [string]$r.DefaultState }
            }
        }
        $svc = @()
        foreach ($s in @($t.service)) {
            if ($null -eq $s) { continue }
            $svc += [pscustomobject]@{ Name = [string]$s.Name; StartupType = [string]$s.StartupType; OriginalType = [string]$s.OriginalType }
        }
        $inv = @($t.InvokeScript | Where-Object { $_ })
        $und = @($t.UndoScript | Where-Object { $_ })
        if ($o.InvokeScript) { $inv = @($o.InvokeScript) }
        if ($o.UndoScript) { $und = @($o.UndoScript) }
        $chk = ''
        if ($o.check) { $chk = [string]$o.check } elseif ($t.check) { $chk = [string]$t.check }

        # WinUtil toggles store the value for the switch being ON. When ON is the Windows default
        # (DefaultState true) the useful tweak is turning it OFF, so Value and OriginalValue swap.
        if ($type -eq 'Toggle' -and $regs.Count -gt 0) {
            $allDefault = (@($regs | Where-Object { $_.DefaultState -ne 'true' }).Count -eq 0)
            if ($allDefault) {
                foreach ($r in $regs) { $tmp = $r.Value; $r.Value = $r.OriginalValue; $r.OriginalValue = $tmp }
                $tmpS = $inv; $inv = $und; $und = $tmpS
                $title = "$title - turn off"
            }
            else { $title = "$title - turn on" }
        }

        $raw = [pscustomobject]@{ registry = $regs; service = $svc; ScheduledTask = @(); InvokeScript = $inv; UndoScript = $und; check = $chk; restartExplorer = $false }
        New-BatTweakObject -Id $id -Name $title -Desc $desc -Cat $cat -Type $type -Risk $risk -Min $min -Max $max -Raw $raw
    }
}

# Returns '' when the tweak can run here, otherwise a short reason
function Get-BatTweakBlock {
    param($Tweak, [int]$Build)
    if ($Tweak.Type -eq 'Combobox') { return 'Use Fixes and DNS page' }
    if ($Tweak.MinBuild -gt 0 -and $Build -lt $Tweak.MinBuild) { return ('Needs build {0}+' -f $Tweak.MinBuild) }
    if ($Tweak.MaxBuild -gt 0 -and $Build -gt $Tweak.MaxBuild) { return ('Not for build above {0}' -f $Tweak.MaxBuild) }
    return ''
}

# ------------------------------------------------------- registry
function Get-BatRegEntry {
    param([string]$Path, [string]$Name)
    $r = [pscustomobject]@{ Exists = $false; Value = $null; Kind = '' }
    try {
        $k = Get-Item -LiteralPath $Path -ErrorAction Stop
        $n = $Name
        if ($Name -ieq '(default)') { $n = '' }
        if (@($k.GetValueNames()) -contains $n) {
            $r.Exists = $true
            $r.Value = $k.GetValue($n, $null, [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)
            $r.Kind = [string]$k.GetValueKind($n)
        }
        $k.Close()
    }
    catch { }
    $r
}

function ConvertTo-BatRegData {
    param([string]$Type, $Value)
    if ($Type -ieq 'DWord') {
        $n = [int64]$Value
        if ($n -gt 2147483647) { $n = $n - 4294967296 }
        return [int]$n
    }
    if ($Type -ieq 'QWord') { return [int64]$Value }
    return [string]$Value
}

function Test-BatRegMatch {
    param($Entry, [string]$Type, $Want)
    if ($Want -eq '<RemoveEntry>') { return (-not $Entry.Exists) }
    if (-not $Entry.Exists) { return $false }
    $w = ConvertTo-BatRegData -Type $Type -Value $Want
    return ([string]$Entry.Value -eq [string]$w)
}

function Set-BatRegValue {
    param([string]$Path, [string]$Name, [string]$Type, $Value)
    if (-not (Test-Path -LiteralPath $Path)) { [void](New-Item -Path $Path -Force -ErrorAction Stop) }
    $data = ConvertTo-BatRegData -Type $Type -Value $Value
    if ($Name -ieq '(default)') { Set-Item -LiteralPath $Path -Value $data -ErrorAction Stop; return }
    $pt = 'String'
    if ($Type -ieq 'DWord') { $pt = 'DWord' }
    elseif ($Type -ieq 'QWord') { $pt = 'QWord' }
    elseif ($Type -ieq 'ExpandString') { $pt = 'ExpandString' }
    [void](New-ItemProperty -LiteralPath $Path -Name $Name -Value $data -PropertyType $pt -Force -ErrorAction Stop)
}

function Remove-BatRegValue {
    param([string]$Path, [string]$Name)
    if (Test-Path -LiteralPath $Path) { Remove-ItemProperty -LiteralPath $Path -Name $Name -Force -ErrorAction SilentlyContinue }
}

# --------------------------------------------------- services/tasks
function Get-BatServiceEntry {
    param([string]$Name)
    $s = Get-Service -Name $Name -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($s) { return [pscustomobject]@{ Exists = $true; StartType = [string]$s.StartType } }
    [pscustomobject]@{ Exists = $false; StartType = '' }
}

function Set-BatServiceStart {
    param([string]$Name, [string]$Type)
    $s = Get-Service -Name $Name -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $s) { Write-BatLog "Service not found, skipped: $Name" 'WARN'; return }
    if ($Type -match 'Delayed') {
        [void](Invoke-BatCmd -File 'sc.exe' -Arguments ('config "{0}" start= delayed-auto' -f $Name) -Silent)
        return
    }
    Set-Service -Name $Name -StartupType $Type -ErrorAction Stop
    if ($Type -eq 'Disabled') { Stop-Service -Name $Name -Force -ErrorAction SilentlyContinue }
}

function Get-BatTaskEntry {
    param([string]$FullName)
    $leaf = Split-Path -Path $FullName -Leaf
    $parent = Split-Path -Path $FullName -Parent
    if (-not $parent.EndsWith('\')) { $parent = $parent + '\' }
    $t = Get-ScheduledTask -TaskPath $parent -TaskName $leaf -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($t) {
        $st = 'Enabled'
        if ([string]$t.State -eq 'Disabled') { $st = 'Disabled' }
        return [pscustomobject]@{ Exists = $true; State = $st; Leaf = $leaf; Parent = $parent }
    }
    [pscustomobject]@{ Exists = $false; State = ''; Leaf = $leaf; Parent = $parent }
}

function Set-BatTaskState {
    param([string]$FullName, [string]$State)
    $e = Get-BatTaskEntry -FullName $FullName
    if (-not $e.Exists) { Write-BatLog "Task not found, skipped: $FullName" 'WARN'; return }
    if ($State -eq 'Disabled') { [void](Disable-ScheduledTask -TaskPath $e.Parent -TaskName $e.Leaf -ErrorAction Stop) }
    else { [void](Enable-ScheduledTask -TaskPath $e.Parent -TaskName $e.Leaf -ErrorAction Stop) }
}

# --------------------------------------------------- live state
# Applied / Partial / Off / Unknown
function Get-BatTweakState {
    param($Tweak)
    $raw = $Tweak.Raw
    $checks = New-Object 'System.Collections.Generic.List[bool]'
    foreach ($r in @($raw.registry)) {
        if ($null -eq $r) { continue }
        $e = Get-BatRegEntry -Path ([string]$r.Path) -Name ([string]$r.Name)
        $checks.Add((Test-BatRegMatch -Entry $e -Type ([string]$r.Type) -Want ([string]$r.Value)))
    }
    foreach ($s in @($raw.service)) {
        if ($null -eq $s) { continue }
        $e = Get-BatServiceEntry -Name ([string]$s.Name)
        if ($e.Exists) { $checks.Add(($e.StartType -eq [string]$s.StartupType)) }
    }
    foreach ($tk in @($raw.ScheduledTask)) {
        if ($null -eq $tk) { continue }
        $e = Get-BatTaskEntry -FullName ([string]$tk.Name)
        if ($e.Exists) { $checks.Add(($e.State -eq [string]$tk.State)) }
    }
    if ($raw.check) {
        try { $checks.Add([bool](& ([scriptblock]::Create([string]$raw.check)))) } catch { $checks.Add($false) }
    }
    if ($checks.Count -eq 0) { return 'Unknown' }
    $on = 0
    foreach ($c in $checks) { if ($c) { $on++ } }
    if ($on -eq $checks.Count) { return 'Applied' }
    if ($on -eq 0) { return 'Off' }
    return 'Partial'
}

function Get-BatTweakStates {
    param([object[]]$Tweaks)
    Initialize-BatHive
    Write-BatLog ("Checking {0} tweak(s) against this PC" -f @($Tweaks).Count) 'INFO'
    foreach ($t in $Tweaks) {
        $st = 'Unknown'
        try { $st = Get-BatTweakState -Tweak $t } catch { Write-BatLog "State check failed for $($t.Name): $($_.Exception.Message)" 'WARN' }
        [pscustomobject]@{ Id = $t.Id; State = $st }
    }
}

# ---------------------------------------------------------- backup
function Read-BatTweakBackup {
    $p = Get-BatTweakBackupPath
    if (Test-Path -LiteralPath $p) {
        try { return (Get-Content -LiteralPath $p -Raw -Encoding UTF8 | ConvertFrom-Json) } catch { }
    }
    return $null
}

function Write-BatTweakBackup {
    param($Table)
    $p = Get-BatTweakBackupPath
    $dir = Split-Path -Path $p -Parent
    if (-not (Test-Path -LiteralPath $dir)) { [void](New-Item -ItemType Directory -Path $dir -Force) }
    ConvertTo-Json -InputObject $Table -Depth 8 | Set-Content -LiteralPath $p -Encoding UTF8
}

function Save-BatTweakBackup {
    param($Tweak)
    $all = @{}
    $old = Read-BatTweakBackup
    if ($old) { foreach ($p in $old.PSObject.Properties) { $all[$p.Name] = $p.Value } }
    $state = Get-BatTweakState -Tweak $Tweak
    # Already applied: the current values are the tweaked ones, never overwrite the real originals
    if ($state -eq 'Applied') { return }
    $raw = $Tweak.Raw
    $reg = @()
    foreach ($r in @($raw.registry)) {
        if ($null -eq $r) { continue }
        $e = Get-BatRegEntry -Path ([string]$r.Path) -Name ([string]$r.Name)
        $val = $e.Value
        if ($e.Kind -eq 'Binary' -or $e.Kind -eq 'MultiString') { $val = $null }
        $reg += @{ Path = [string]$r.Path; Name = [string]$r.Name; Exists = $e.Exists; Kind = $e.Kind; Value = $val }
    }
    $svc = @()
    foreach ($s in @($raw.service)) {
        if ($null -eq $s) { continue }
        $e = Get-BatServiceEntry -Name ([string]$s.Name)
        $svc += @{ Name = [string]$s.Name; Exists = $e.Exists; StartType = $e.StartType }
    }
    $tsk = @()
    foreach ($tk in @($raw.ScheduledTask)) {
        if ($null -eq $tk) { continue }
        $e = Get-BatTaskEntry -FullName ([string]$tk.Name)
        $tsk += @{ Name = [string]$tk.Name; Exists = $e.Exists; State = $e.State }
    }
    $all[$Tweak.Id] = @{ time = (Get-Date -Format 's'); name = $Tweak.Name; registry = $reg; service = $svc; task = $tsk }
    Write-BatTweakBackup -Table $all
    Write-BatLog "Backed up current values for: $($Tweak.Name)" 'INFO'
}

function Remove-BatTweakBackupEntry {
    param([string]$Id)
    $old = Read-BatTweakBackup
    if (-not $old) { return }
    $all = @{}
    foreach ($p in $old.PSObject.Properties) { if ($p.Name -ne $Id) { $all[$p.Name] = $p.Value } }
    Write-BatTweakBackup -Table $all
}

# ------------------------------------------------ WinUtil shims
# Official WinUtil entries call a few of its own helper functions inside InvokeScript.
# These are best effort stand-ins so imported entries do not crash.
function Register-BatWinUtilShims {
    function global:Write-WinUtilLog { Write-BatLog ((@($args) | ForEach-Object { "$_" }) -join ' ') 'INFO' }
    function global:Invoke-WinUtilExplorerUpdate {
        param([string]$action = 'restart')
        if ($action -eq 'restart') { Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue }
        else { Start-Process -FilePath 'rundll32.exe' -ArgumentList 'user32.dll,UpdatePerUserSystemParameters' -WindowStyle Hidden }
    }
    function global:Invoke-WinutilThemeChange {
        param([string]$theme = 'Dark')
        $v = 1
        if ($theme -match 'Dark') { $v = 0 }
        $k = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'
        Set-BatRegValue -Path $k -Name 'AppsUseLightTheme' -Type 'DWord' -Value $v
        Set-BatRegValue -Path $k -Name 'SystemUsesLightTheme' -Type 'DWord' -Value $v
    }
}

function Invoke-BatTweakScript {
    param([string]$Text, [string]$Label)
    try {
        $sb = [scriptblock]::Create($Text)
        & $sb *>&1 | ForEach-Object { $line = "$_".Trim(); if ($line) { Write-BatLog $line 'OUT' } }
    }
    catch { Write-BatLog "Script failed ($Label): $($_.Exception.Message)" 'ERR'; throw }
}

# ------------------------------------------------------------ apply
function Invoke-BatTweaks {
    param([object[]]$Tweaks)
    Initialize-BatHive
    Register-BatWinUtilShims
    $ok = 0
    $bad = 0
    $restartExplorer = $false
    foreach ($t in $Tweaks) {
        Write-BatLog "Applying: $($t.Name)" 'STEP'
        $raw = $t.Raw
        $failed = $false
        try { Save-BatTweakBackup -Tweak $t } catch { Write-BatLog "Backup problem: $($_.Exception.Message)" 'WARN' }
        foreach ($r in @($raw.registry)) {
            if ($null -eq $r) { continue }
            try {
                if ([string]$r.Value -eq '<RemoveEntry>') { Remove-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) }
                else { Set-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) -Type ([string]$r.Type) -Value ([string]$r.Value) }
                Write-BatLog ("  reg  {0}\{1} = {2}" -f $r.Path, $r.Name, $r.Value) 'OUT'
            }
            catch { Write-BatLog "  reg failed $($r.Path)\$($r.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($s in @($raw.service)) {
            if ($null -eq $s) { continue }
            try { Set-BatServiceStart -Name ([string]$s.Name) -Type ([string]$s.StartupType); Write-BatLog ("  svc  {0} -> {1}" -f $s.Name, $s.StartupType) 'OUT' }
            catch { Write-BatLog "  service failed $($s.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($tk in @($raw.ScheduledTask)) {
            if ($null -eq $tk) { continue }
            try { Set-BatTaskState -FullName ([string]$tk.Name) -State ([string]$tk.State); Write-BatLog ("  task {0} -> {1}" -f $tk.Name, $tk.State) 'OUT' }
            catch { Write-BatLog "  task failed $($tk.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($sc in @($raw.InvokeScript)) {
            if ([string]::IsNullOrWhiteSpace([string]$sc)) { continue }
            try { Invoke-BatTweakScript -Text ([string]$sc) -Label $t.Name } catch { $failed = $true }
        }
        if ($raw.restartExplorer) { $restartExplorer = $true }
        if ($failed) { $bad++ } else { $ok++; Write-BatLog "Applied: $($t.Name)" 'OK' }
    }
    if ($restartExplorer) { Write-BatLog 'Restarting Explorer so the changes show' 'INFO'; Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue }
    Write-BatLog "Tweaks summary: $ok applied, $bad with errors" 'INFO'
}

# ------------------------------------------------------------- undo
function Undo-BatTweaks {
    param([object[]]$Tweaks)
    Initialize-BatHive
    Register-BatWinUtilShims
    $bk = Read-BatTweakBackup
    $ok = 0
    $bad = 0
    $restartExplorer = $false
    foreach ($t in $Tweaks) {
        Write-BatLog "Undoing: $($t.Name)" 'STEP'
        $raw = $t.Raw
        $entry = $null
        if ($bk) { $prop = $bk.PSObject.Properties[$t.Id]; if ($prop) { $entry = $prop.Value } }
        if ($entry) { Write-BatLog "  using the values saved on $($entry.time)" 'INFO' }
        else { Write-BatLog '  no saved backup for this tweak, using the default original values' 'WARN' }
        $failed = $false
        foreach ($r in @($raw.registry)) {
            if ($null -eq $r) { continue }
            try {
                $saved = $null
                if ($entry) { $saved = @($entry.registry) | Where-Object { $_.Path -eq [string]$r.Path -and $_.Name -eq [string]$r.Name } | Select-Object -First 1 }
                if ($saved -and $saved.Exists -and $null -ne $saved.Value) {
                    $ty = [string]$saved.Kind
                    if (-not $ty) { $ty = [string]$r.Type }
                    Set-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) -Type $ty -Value ([string]$saved.Value)
                }
                elseif ($saved -and -not $saved.Exists) { Remove-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) }
                else {
                    $o = [string]$r.OriginalValue
                    if ([string]::IsNullOrEmpty($o) -or $o -eq '<RemoveEntry>') { Remove-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) }
                    else { Set-BatRegValue -Path ([string]$r.Path) -Name ([string]$r.Name) -Type ([string]$r.Type) -Value $o }
                }
                Write-BatLog ("  reg  restored {0}\{1}" -f $r.Path, $r.Name) 'OUT'
            }
            catch { Write-BatLog "  reg failed $($r.Path)\$($r.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($s in @($raw.service)) {
            if ($null -eq $s) { continue }
            try {
                $type = [string]$s.OriginalType
                if ($entry) { $sv = @($entry.service) | Where-Object { $_.Name -eq [string]$s.Name } | Select-Object -First 1; if ($sv -and $sv.Exists -and $sv.StartType) { $type = [string]$sv.StartType } }
                if ($type) { Set-BatServiceStart -Name ([string]$s.Name) -Type $type; Write-BatLog ("  svc  {0} -> {1}" -f $s.Name, $type) 'OUT' }
            }
            catch { Write-BatLog "  service failed $($s.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($tk in @($raw.ScheduledTask)) {
            if ($null -eq $tk) { continue }
            try {
                $st = [string]$tk.OriginalState
                if ($entry) { $tv = @($entry.task) | Where-Object { $_.Name -eq [string]$tk.Name } | Select-Object -First 1; if ($tv -and $tv.Exists -and $tv.State) { $st = [string]$tv.State } }
                if ($st) { Set-BatTaskState -FullName ([string]$tk.Name) -State $st; Write-BatLog ("  task {0} -> {1}" -f $tk.Name, $st) 'OUT' }
            }
            catch { Write-BatLog "  task failed $($tk.Name): $($_.Exception.Message)" 'ERR'; $failed = $true }
        }
        foreach ($sc in @($raw.UndoScript)) {
            if ([string]::IsNullOrWhiteSpace([string]$sc)) { continue }
            try { Invoke-BatTweakScript -Text ([string]$sc) -Label $t.Name } catch { $failed = $true }
        }
        if ($raw.restartExplorer) { $restartExplorer = $true }
        if ($failed) { $bad++ }
        else { $ok++; Write-BatLog "Undone: $($t.Name)" 'OK'; try { Remove-BatTweakBackupEntry -Id $t.Id } catch { } }
    }
    if ($restartExplorer) { Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue }
    Write-BatLog "Undo summary: $ok restored, $bad with errors" 'INFO'
}

# ---------------------------------------------------- restore point
function New-BatRestorePoint {
    param([string]$Description = 'BAT TOOLKIT')
    $key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore'
    $name = 'SystemRestorePointCreationFrequency'
    $old = Get-BatRegEntry -Path $key -Name $name
    try {
        Write-BatLog 'Creating a system restore point' 'STEP'
        Enable-ComputerRestore -Drive ($env:SystemDrive + '\') -ErrorAction SilentlyContinue
        # Windows normally allows one restore point per 24 hours; lift that for this call only
        Set-BatRegValue -Path $key -Name $name -Type 'DWord' -Value 0
        Checkpoint-Computer -Description $Description -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
        Write-BatLog "Restore point created: $Description" 'OK'
    }
    catch { Write-BatLog "Restore point failed: $($_.Exception.Message)" 'ERR' }
    finally {
        try {
            if ($old.Exists) { Set-BatRegValue -Path $key -Name $name -Type 'DWord' -Value ([string]$old.Value) }
            else { Remove-BatRegValue -Path $key -Name $name }
        }
        catch { }
    }
}
