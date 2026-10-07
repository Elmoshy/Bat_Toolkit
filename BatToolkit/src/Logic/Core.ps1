# =====================================================================
# Core.ps1  -  logging, process runner, async runner, resources
# Every function is named *-Bat* so it can be copied into runspaces
# =====================================================================

function Test-BatAdmin {
    $id = [Security.Principal.WindowsIdentity]::GetCurrent()
    (New-Object Security.Principal.WindowsPrincipal $id).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Test-BatCommand {
    param([string]$Name)
    [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Update-BatPath {
    $m = [Environment]::GetEnvironmentVariable('Path', 'Machine')
    $u = [Environment]::GetEnvironmentVariable('Path', 'User')
    $env:Path = (@($m, $u, $env:Path) | Where-Object { $_ }) -join ';'
}

function Format-BatBytes {
    param([double]$Bytes)
    if ($Bytes -ge 1GB) { return ('{0:N2} GB' -f ($Bytes / 1GB)) }
    if ($Bytes -ge 1MB) { return ('{0:N1} MB' -f ($Bytes / 1MB)) }
    if ($Bytes -ge 1KB) { return ('{0:N0} KB' -f ($Bytes / 1KB)) }
    return ('{0:N0} B' -f $Bytes)
}

function Get-BatResource {
    param([Parameter(Mandatory)][string]$Name)
    if ($global:BatEmbedded -and $global:BatEmbedded.ContainsKey($Name)) { return $global:BatEmbedded[$Name] }
    $file = Get-ChildItem -Path $global:BatRoot -Recurse -Filter $Name -File -ErrorAction SilentlyContinue | Select-Object -First 1
    if (-not $file) { throw "Resource not found: $Name" }
    [IO.File]::ReadAllText($file.FullName, [Text.Encoding]::UTF8)
}

function Initialize-BatCore {
    $dir = Join-Path $env:LOCALAPPDATA 'BatToolkit\logs'
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    $logFile = Join-Path $dir ('session-{0}.log' -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
    [IO.File]::WriteAllText($logFile, '', [Text.Encoding]::UTF8)
    $global:Sync = [hashtable]::Synchronized(@{
        Log     = New-Object 'System.Collections.Concurrent.ConcurrentQueue[string]'
        LogFile = $logFile
    })
    $global:Bat = @{
        Busy         = $false
        Collapsed    = $false
        CatalogBoxes = New-Object System.Collections.ArrayList
        Version      = '0.2.0'
    }
    $global:BatUI = @{}
}

# ---------------------------------------------------------------- LOG
function Write-BatLog {
    param([string]$Message, [ValidateSet('INFO', 'OK', 'WARN', 'ERR', 'CMD', 'STEP', 'OUT')][string]$Level = 'INFO')
    if ($null -eq $Message) { return }
    $Sync.Log.Enqueue(('[{0}] [{1,-4}] {2}' -f (Get-Date -Format 'HH:mm:ss'), $Level, $Message))
}

function Start-BatLogPump {
    $timer = New-Object System.Windows.Threading.DispatcherTimer
    $timer.Interval = [TimeSpan]::FromMilliseconds(200)
    $timer.Add_Tick({
        $sb = New-Object System.Text.StringBuilder
        $line = $null
        while ($Sync.Log.TryDequeue([ref]$line)) { [void]$sb.AppendLine($line) }
        if ($sb.Length -gt 0) {
            $box = $global:BatUI.LogBox
            $box.AppendText($sb.ToString())
            if ($box.Text.Length -gt 300000) { $box.Text = $box.Text.Substring($box.Text.Length - 200000) }
            $box.ScrollToEnd()
            try { [IO.File]::AppendAllText($Sync.LogFile, $sb.ToString(), [Text.Encoding]::UTF8) } catch { }
        }
    })
    $timer.Start()
    $global:Bat.LogTimer = $timer
}

# ------------------------------------------------------ PROCESS RUNNER
# Runs a command line through cmd.exe so stdout and stderr arrive together,
# logs every output line live, and returns ExitCode + Lines.
function Invoke-BatCmd {
    param(
        [Parameter(Mandatory)][string]$File,
        [string]$Arguments = '',
        [switch]$Unicode,
        [switch]$Silent
    )
    Write-BatLog "$File $Arguments" 'CMD'
    $psi = New-Object System.Diagnostics.ProcessStartInfo
    $psi.FileName = $env:ComSpec
    $psi.Arguments = '/d /c "{0} {1} 2>&1"' -f $File, $Arguments
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.CreateNoWindow = $true
    $psi.StandardOutputEncoding = if ($Unicode) { [Text.Encoding]::Unicode } else { [Text.Encoding]::UTF8 }
    $lines = New-Object 'System.Collections.Generic.List[string]'
    try {
        $p = [System.Diagnostics.Process]::Start($psi)
        while ($null -ne ($raw = $p.StandardOutput.ReadLine())) {
            $clean = ($raw -replace "`r", '' -replace '\x1b\[[0-9;?]*[A-Za-z]', '' -replace '\x00', '').TrimEnd()
            if ($clean -match '^[\s\-\\|/]*$') { continue }
            if ($clean -match '[\u2580-\u259F]') { continue }
            if ($clean -match '^\s*\d+(\.\d+)?\s*[KMG]B\s*/') { continue }
            $lines.Add($clean)
            if (-not $Silent) { Write-BatLog $clean 'OUT' }
        }
        $p.WaitForExit()
        $code = $p.ExitCode
    }
    catch {
        Write-BatLog "Failed to run $File : $($_.Exception.Message)" 'ERR'
        $code = -1
    }
    [pscustomobject]@{ ExitCode = $code; Lines = $lines.ToArray() }
}

# ------------------------------------------------------- ASYNC RUNNER
# Runs $Work in a background runspace that already contains every *-Bat*
# function. $OnDone runs back on the UI thread with the output array.
function Set-BatBusy {
    param([bool]$State)
    $global:Bat.Busy = $State
    if ($global:BatUI.BusyBar) { $global:BatUI.BusyBar.IsIndeterminate = $State }
}

function Invoke-BatAsync {
    param(
        [Parameter(Mandatory)][scriptblock]$Work,
        [object[]]$ArgumentList = @(),
        [scriptblock]$OnDone,
        [string]$Title = 'Task'
    )
    if ($global:Bat.Busy) { Write-BatLog 'Another operation is still running - please wait' 'WARN'; return }
    Set-BatBusy $true
    Write-BatLog "=== $Title ===" 'STEP'

    $iss = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    foreach ($f in (Get-Command -CommandType Function -Name '*-Bat*')) {
        $iss.Commands.Add((New-Object System.Management.Automation.Runspaces.SessionStateFunctionEntry($f.Name, $f.Definition)))
    }
    $rs = [runspacefactory]::CreateRunspace($iss)
    $rs.ApartmentState = 'STA'
    $rs.Open()
    $rs.SessionStateProxy.SetVariable('Sync', $global:Sync)
    $ps = [powershell]::Create()
    $ps.Runspace = $rs
    [void]$ps.AddScript($Work.ToString())
    foreach ($a in $ArgumentList) { [void]$ps.AddArgument($a) }
    $handle = $ps.BeginInvoke()

    $job = @{ PS = $ps; RS = $rs; Handle = $handle; OnDone = $OnDone }
    $timer = New-Object System.Windows.Threading.DispatcherTimer
    $timer.Interval = [TimeSpan]::FromMilliseconds(250)
    $tick = {
        if (-not $job.Handle.IsCompleted) { return }
        $timer.Stop()
        $result = $null
        $failure = $null
        try { $result = $job.PS.EndInvoke($job.Handle) } catch { $failure = $_ }
        foreach ($e in $job.PS.Streams.Error) { Write-BatLog $e.ToString() 'ERR' }
        $job.PS.Dispose()
        $job.RS.Close()
        $job.RS.Dispose()
        Set-BatBusy $false
        if ($failure) { Write-BatLog $failure.ToString() 'ERR' }
        else {
            Write-BatLog 'Finished' 'OK'
            if ($job.OnDone) {
                try { & $job.OnDone @($result) } catch { Write-BatLog "UI update failed: $($_.Exception.Message)" 'ERR' }
            }
        }
    }.GetNewClosure()
    $timer.Add_Tick($tick)
    $timer.Start()
}
