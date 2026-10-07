# =====================================================================
# Fixes.ps1  -  Windows repairs and DNS
# =====================================================================

function Reset-BatWindowsUpdate {
    $svcs = 'wuauserv', 'cryptSvc', 'bits', 'msiserver'
    Write-BatLog 'Stopping Windows Update services' 'STEP'
    foreach ($s in $svcs) {
        Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
        Write-BatLog "  stopped $s" 'INFO'
    }
    Start-Sleep -Seconds 2
    Write-BatLog 'Resetting update and download caches' 'STEP'
    foreach ($d in @("$env:SystemRoot\SoftwareDistribution", "$env:SystemRoot\System32\catroot2")) {
        if (Test-Path -LiteralPath $d) {
            $bak = "$d.bak"
            if (Test-Path -LiteralPath $bak) { Remove-Item -LiteralPath $bak -Recurse -Force -ErrorAction SilentlyContinue }
            try {
                Rename-Item -LiteralPath $d -NewName ((Split-Path $d -Leaf) + '.bak') -ErrorAction Stop
                Write-BatLog "  renamed $d to .bak" 'OK'
            }
            catch { Write-BatLog "  could not rename ${d}: $($_.Exception.Message)" 'ERR' }
        }
    }
    Write-BatLog 'Clearing stuck BITS downloads' 'STEP'
    Get-ChildItem -Path "$env:ALLUSERSPROFILE\Microsoft\Network\Downloader" -Filter 'qmgr*.dat' -Force -ErrorAction SilentlyContinue |
        Remove-Item -Force -ErrorAction SilentlyContinue
    Write-BatLog 'Starting services again' 'STEP'
    foreach ($s in $svcs) {
        Start-Service -Name $s -ErrorAction SilentlyContinue
        Write-BatLog "  started $s" 'INFO'
    }
    Write-BatLog 'Windows Update reset complete - restart Windows then check for updates' 'OK'
}

function Reset-BatNetwork {
    Write-BatLog 'Resetting network stack' 'STEP'
    Invoke-BatCmd 'ipconfig' '/flushdns' | Out-Null
    Invoke-BatCmd 'ipconfig' '/registerdns' | Out-Null
    Invoke-BatCmd 'netsh' 'winsock reset' | Out-Null
    Invoke-BatCmd 'netsh' 'int ip reset' | Out-Null
    Invoke-BatCmd 'netsh' 'int ipv6 reset' | Out-Null
    Write-BatLog 'Network reset complete - restart Windows to finish' 'OK'
}

function Repair-BatSystemFiles {
    Write-BatLog 'Step 1 of 2: DISM RestoreHealth (can take a while)' 'STEP'
    Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /RestoreHealth' | Out-Null
    Write-BatLog 'Step 2 of 2: SFC scan' 'STEP'
    Invoke-BatCmd 'sfc.exe' '/scannow' -Unicode | Out-Null
}

function Set-BatDns {
    param([string]$Name, [string[]]$IPv4 = @(), [string[]]$IPv6 = @())
    $adapters = @(Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object { $_.Status -eq 'Up' })
    if ($adapters.Count -eq 0) { Write-BatLog 'No active physical network adapter found' 'ERR'; return }
    foreach ($a in $adapters) {
        try {
            if (@($IPv4).Count -eq 0) {
                Set-DnsClientServerAddress -InterfaceIndex $a.ifIndex -ResetServerAddresses -ErrorAction Stop
                Write-BatLog "  $($a.Name): DNS set to automatic" 'OK'
            }
            else {
                $all = @($IPv4) + @($IPv6)
                Set-DnsClientServerAddress -InterfaceIndex $a.ifIndex -ServerAddresses $all -ErrorAction Stop
                Write-BatLog "  $($a.Name): $($all -join ', ')" 'OK'
            }
        }
        catch { Write-BatLog "  $($a.Name): $($_.Exception.Message)" 'ERR' }
    }
    Clear-DnsClientCache -ErrorAction SilentlyContinue
    Write-BatLog "DNS provider applied: $Name" 'OK'
}
