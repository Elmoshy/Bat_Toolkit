# =====================================================================
# Debloat.ps1  -  scan and remove built-in / promoted UWP apps
# =====================================================================

function Find-BatBloat {
    param([object[]]$Entries)
    Write-BatLog 'Reading installed Appx packages' 'INFO'
    $pk = @(Get-AppxPackage -AllUsers -ErrorAction SilentlyContinue)
    foreach ($e in $Entries) {
        $hits = @($pk | Where-Object { $_.Name -like $e.pattern } | Sort-Object Name -Unique)
        foreach ($h in $hits) {
            [pscustomobject]@{ Name = $e.name; Id = $h.Name; Version = "$($h.Version)"; Risk = $e.risk; Desc = $e.desc }
        }
    }
}

function Remove-BatAppx {
    param([object[]]$Items)
    # Hard protection list - never removed even if selected
    $never = @(
        'Microsoft.WindowsStore', 'Microsoft.StorePurchaseApp', 'Microsoft.DesktopAppInstaller',
        'Microsoft.Windows.ShellExperienceHost', 'Microsoft.Windows.StartMenuExperienceHost',
        'Microsoft.WindowsTerminal', 'Microsoft.SecHealthUI', 'Microsoft.UI.Xaml*', 'Microsoft.VCLibs*',
        'Microsoft.NET.Native*', 'windows.immersivecontrolpanel', 'Microsoft.AAD.BrokerPlugin',
        'Microsoft.Windows.CloudExperienceHost', 'Microsoft.WindowsAppRuntime*'
    )
    $ok = 0
    $bad = 0
    foreach ($it in $Items) {
        $blocked = $false
        foreach ($n in $never) { if ($it.Id -like $n) { $blocked = $true } }
        if ($blocked) { Write-BatLog "Protected, skipped: $($it.Id)" 'WARN'; continue }
        Write-BatLog "Removing: $($it.Name) ($($it.Id))" 'STEP'
        try {
            Get-AppxPackage -AllUsers -Name $it.Id -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction Stop
            Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue |
                Where-Object { $_.DisplayName -eq $it.Id } |
                Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null
            Write-BatLog "Removed $($it.Name)" 'OK'
            $ok++
        }
        catch { Write-BatLog "Failed $($it.Name): $($_.Exception.Message)" 'ERR'; $bad++ }
    }
    Write-BatLog "Summary: $ok removed and $bad failed" 'INFO'
}
