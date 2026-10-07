# =====================================================================
# Update.ps1  -  bulk update helpers (single package updates reuse
#                Invoke-BatPackageOps with -Action upgrade)
# =====================================================================

function Update-BatAll {
    param([string]$Mode = 'both')
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        Write-BatLog 'Updating all winget packages' 'STEP'
        Invoke-BatCmd 'winget' 'upgrade --all --silent --accept-package-agreements --accept-source-agreements' | Out-Null
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        Write-BatLog 'Updating all Chocolatey packages' 'STEP'
        Invoke-BatCmd 'choco' 'upgrade all -y --no-progress' | Out-Null
    }
}
