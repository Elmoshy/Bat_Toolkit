<#
 Build.ps1 - compiles the multi file source into ONE runnable script.
 Source of truth = the src folder (keep it in Git). dist\BatToolkit.ps1 is
 only an output and can be regenerated at any time.
#>
$root = $PSScriptRoot
$src  = Join-Path $root 'src'
$out  = Join-Path $root 'dist\BatToolkit.ps1'
New-Item -ItemType Directory -Force -Path (Split-Path $out) | Out-Null

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('# BAT TOOLKIT - compiled single file build. Do not edit: edit src and run Build.ps1')
[void]$sb.AppendLine('$global:BatEmbedded = @{}')
[void]$sb.AppendLine('$global:BatEntry = $PSCommandPath')
[void]$sb.AppendLine('$global:BatChild = ($args -contains ''--child'')')

$resources = @(Get-ChildItem -Path (Join-Path $src 'Data') -Filter *.json) + @(Get-ChildItem -Path (Join-Path $src 'UI') -Filter *.xaml)
foreach ($f in $resources) {
    $text = [IO.File]::ReadAllText($f.FullName, [Text.Encoding]::UTF8).TrimEnd()
    if ($text -match "(?m)^'@") { throw "Resource $($f.Name) contains a line starting with '@ which breaks here-strings" }
    [void]$sb.AppendLine("`$global:BatEmbedded['$($f.Name)'] = @'")
    [void]$sb.AppendLine($text)
    [void]$sb.AppendLine("'@")
}

foreach ($rel in 'Logic\Core.ps1', 'Logic\Apps.ps1', 'Logic\Update.ps1', 'Logic\Clean.ps1', 'Logic\Fixes.ps1', 'Logic\Debloat.ps1', 'UI\Gui.ps1') {
    [void]$sb.AppendLine("# ----- $rel -----")
    [void]$sb.AppendLine([IO.File]::ReadAllText((Join-Path $src $rel), [Text.Encoding]::UTF8))
}
[void]$sb.AppendLine('Start-BatToolkit')

# UTF-8 with BOM so Windows PowerShell 5.1 reads it correctly
[IO.File]::WriteAllText($out, $sb.ToString(), (New-Object Text.UTF8Encoding $true))

$errs = $null; $tok = $null
[void][System.Management.Automation.Language.Parser]::ParseFile($out, [ref]$tok, [ref]$errs)
if ($errs) { $errs | ForEach-Object { Write-Host ("Line {0}: {1}" -f $_.Extent.StartLineNumber, $_.Message) -ForegroundColor Red }; throw 'Build failed: syntax errors' }
Write-Host ("Built {0} ({1:N0} KB)" -f $out, ((Get-Item $out).Length / 1KB)) -ForegroundColor Green
