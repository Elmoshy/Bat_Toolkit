# Dev launcher: runs straight from the source files (no build needed).
# Run from an elevated PowerShell:  .\Dev.ps1
$global:BatEntry = $PSCommandPath
$global:BatChild = ($args -contains '--child')
$global:BatRoot = Join-Path $PSScriptRoot 'src'
foreach ($rel in 'Logic\Core.ps1', 'Logic\Apps.ps1', 'Logic\Update.ps1', 'Logic\Clean.ps1', 'Logic\Fixes.ps1', 'Logic\Debloat.ps1', 'UI\Gui.ps1') {
    . (Join-Path $global:BatRoot $rel)
}
Start-BatToolkit
