# =====================================================================
# Gui.ps1  -  WPF wiring: loads MainWindow.xaml, binds events to Logic.
# No business logic lives here, only UI glue.
# =====================================================================

function Initialize-BatTypes {
    if ('BatItem' -as [type]) { return }
    Add-Type -TypeDefinition @'
using System.ComponentModel;
public class BatItem : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;
    private void Notify(string n) { if (PropertyChanged != null) PropertyChanged(this, new PropertyChangedEventArgs(n)); }
    private bool _checked;
    private string _size;
    private string _status;
    private bool _enabled = true;
    private long _bytes;
    public bool Checked { get { return _checked; } set { _checked = value; Notify("Checked"); } }
    public string Size { get { return _size; } set { _size = value; Notify("Size"); } }
    public string Status { get { return _status; } set { _status = value; Notify("Status"); } }
    public bool Enabled { get { return _enabled; } set { _enabled = value; Notify("Enabled"); } }
    public long Bytes { get { return _bytes; } set { _bytes = value; Notify("Bytes"); } }
    public string Id { get; set; }
    public string Name { get; set; }
    public string Version { get; set; }
    public string Available { get; set; }
    public string Source { get; set; }
    public string Group { get; set; }
    public string Risk { get; set; }
    public string Speed { get; set; }
    public string Desc { get; set; }
    public object Data { get; set; }
}
'@
}

# ------------------------------------------------------------ helpers
function Set-BatGrid {
    param($Grid, $Items)
    $list = New-Object 'System.Collections.Generic.List[BatItem]'
    foreach ($i in @($Items)) { if ($null -ne $i) { $list.Add($i) } }
    $Grid.ItemsSource = $null
    $Grid.ItemsSource = $list
}

function ConvertTo-BatItems {
    param($Rows)
    foreach ($r in @($Rows)) {
        if ($null -eq $r) { continue }
        $i = New-Object BatItem
        $i.Name = "$($r.Name)"; $i.Id = "$($r.Id)"; $i.Version = "$($r.Version)"
        $i.Available = "$($r.Available)"; $i.Source = "$($r.Source)"; $i.Risk = "$($r.Risk)"; $i.Desc = "$($r.Desc)"
        $i
    }
}

function Get-BatChecked {
    param($Grid)
    if (-not $Grid.ItemsSource) { return @() }
    @($Grid.ItemsSource | Where-Object { $_.Checked })
}

function ConvertTo-BatPkgItems {
    param($Items)
    @($Items | ForEach-Object { [pscustomobject]@{ Name = $_.Name; Id = $_.Id; Source = $_.Source } })
}

function Enable-BatGridRowToggle {
    param($Grid)
    $Grid.Add_PreviewMouseLeftButtonUp({
        param($s, $e)
        $dep = $e.OriginalSource
        while ($null -ne $dep -and $dep -isnot [System.Windows.Controls.DataGridRow]) {
            if ($dep -is [System.Windows.Controls.CheckBox] -or $dep -is [System.Windows.Controls.Primitives.Thumb] -or $dep -is [System.Windows.Controls.Primitives.ScrollBar]) { return }
            $dep = [System.Windows.Media.VisualTreeHelper]::GetParent($dep)
        }
        if ($dep -is [System.Windows.Controls.DataGridRow] -and $dep.Item -is [BatItem]) {
            $dep.Item.Checked = -not $dep.Item.Checked
        }
    })
}

function Set-BatGridFilter {
    param($Grid, [string]$Text)
    if (-not $Grid.ItemsSource) { return }
    $view = [System.Windows.Data.CollectionViewSource]::GetDefaultView($Grid.ItemsSource)
    if ([string]::IsNullOrWhiteSpace($Text)) { $view.Filter = $null; return }
    $t = $Text.Trim()
    $sb = { param($o) ($o.Name -like "*$t*") -or ($o.Id -like "*$t*") }.GetNewClosure()
    $view.Filter = [Predicate[object]]$sb
}

function Get-BatMode {
    if ($BatUI.RbWinget.IsChecked) { return 'winget' }
    if ($BatUI.RbChoco.IsChecked) { return 'choco' }
    'both'
}

function Test-BatModeReady {
    param([string]$Mode)
    $w = Test-BatCommand winget
    $c = Test-BatCommand choco
    $ok = $false
    if ($Mode -eq 'winget') { $ok = $w } elseif ($Mode -eq 'choco') { $ok = $c } else { $ok = ($w -or $c) }
    if (-not $ok) { Write-BatLog "The package manager for '$Mode' is not installed - use the Install button at the top" 'ERR' }
    $ok
}

function Update-BatPmStatus {
    $w = Test-BatCommand winget
    $c = Test-BatCommand choco
    $wt = if ($w) { 'ready' } else { 'missing' }
    $ct = if ($c) { 'ready' } else { 'missing' }
    $BatUI.PmStatus.Text = "Winget: $wt     Chocolatey: $ct"
    $BatUI.BtnGetWinget.Visibility = if ($w) { 'Collapsed' } else { 'Visible' }
    $BatUI.BtnGetChoco.Visibility = if ($c) { 'Collapsed' } else { 'Visible' }
    $BatUI.RbWinget.IsEnabled = $w
    $BatUI.RbChoco.IsEnabled = $c
    $BatUI.RbBoth.IsEnabled = ($w -or $c)
    if ((-not $w -and $BatUI.RbWinget.IsChecked) -or (-not $c -and $BatUI.RbChoco.IsChecked)) { $BatUI.RbBoth.IsChecked = $true }
}

function Update-BatDriveInfo {
    try {
        $d = Get-PSDrive -Name C -ErrorAction Stop
        $free = $d.Free / 1GB
        $total = ($d.Free + $d.Used) / 1GB
        if ($global:Bat.Collapsed) { $BatUI.DriveInfo.Text = ('C: {0:N0} GB' -f $free) }
        else { $BatUI.DriveInfo.Text = ('C: Free {0:N1} GB of {1:N1} GB' -f $free, $total) }
    }
    catch { }
}

function Get-BatSettingsPath { Join-Path $env:APPDATA 'BatToolkit\settings.json' }

function Get-BatSettings {
    try {
        $p = Get-BatSettingsPath
        if (Test-Path -LiteralPath $p) {
            return (Get-Content -LiteralPath $p -Raw | ConvertFrom-Json)
        }
    }
    catch { }
    return $null
}

function Save-BatSettings {
    try {
        $p = Get-BatSettingsPath
        $dir = Split-Path -Path $p -Parent
        if (-not (Test-Path -LiteralPath $dir)) { [void](New-Item -ItemType Directory -Path $dir -Force) }
        (@{ theme = $global:Bat.Theme; accent = $global:Bat.Accent } | ConvertTo-Json) | Set-Content -LiteralPath $p -Encoding UTF8
    }
    catch { }
}

function Get-BatContrastHex {
    param([string]$Hex)
    try {
        $c = [System.Windows.Media.ColorConverter]::ConvertFromString($Hex)
        $lum = (0.299 * $c.R) + (0.587 * $c.G) + (0.114 * $c.B)
        if ($lum -gt 150) { return '#09090B' }
    }
    catch { }
    return '#FFFFFF'
}

function Build-BatAccentSwatches {
    $data = Get-BatResource 'themes.json' | ConvertFrom-Json
    $panel = $BatUI.AccentSwatches
    if (-not $panel) { return }
    $panel.Children.Clear()
    $conv = New-Object System.Windows.Media.BrushConverter
    $mode = if ($global:Bat.Theme) { $global:Bat.Theme } else { 'dark' }

    foreach ($prop in $data.accents.PSObject.Properties) {
        $key = $prop.Name
        $info = $prop.Value
        $hex = if ($mode -eq 'light') { [string]$info.light } else { [string]$info.dark }
        $btn = New-Object System.Windows.Controls.Button
        $btn.Width = 20
        $btn.Height = 20
        $btn.Margin = '0,0,6,0'
        $btn.Padding = '0'
        $btn.ToolTip = [string]$info.label
        $btn.Tag = $key
        $isSel = ($global:Bat.Accent -eq $key)
        $tpl = @"
<ControlTemplate xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" TargetType="Button">
  <Border Width="20" Height="20" CornerRadius="10" Background="$hex" BorderBrush="$(if ($isSel) { '#FFFFFF' } else { 'Transparent' })" BorderThickness="$(if ($isSel) { '2' } else { '0' })"/>
</ControlTemplate>
"@
        $btn.Template = [Windows.Markup.XamlReader]::Parse($tpl)
        $btn.Add_Click({
            param($s, $e)
            Set-BatAccent -Accent ([string]$s.Tag)
        })
        [void]$panel.Children.Add($btn)
    }

    # Custom color picker button (+)
    $customBtn = New-Object System.Windows.Controls.Button
    $customBtn.Width = 20
    $customBtn.Height = 20
    $customBtn.Margin = '0,0,0,0'
    $customBtn.Padding = '0'
    $customBtn.ToolTip = 'Custom color...'
    $isCustom = ($global:Bat.Accent -and $global:Bat.Accent.StartsWith('#'))
    $customBg = if ($isCustom) { $global:Bat.Accent } else { '#3F3F46' }
    $customTpl = @"
<ControlTemplate xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" TargetType="Button">
  <Border Width="20" Height="20" CornerRadius="10" Background="$customBg" BorderBrush="$(if ($isCustom) { '#FFFFFF' } else { '#71717A' })" BorderThickness="1.5">
    <TextBlock Text="+" Foreground="#FFFFFF" FontWeight="Bold" FontSize="12" HorizontalAlignment="Center" VerticalAlignment="Center" Margin="0,-2,0,0"/>
  </Border>
</ControlTemplate>
"@
    $customBtn.Template = [Windows.Markup.XamlReader]::Parse($customTpl)
    $customBtn.Add_Click({
        $dlg = New-Object System.Windows.Forms.ColorDialog
        $dlg.FullOpen = $true
        if ($dlg.ShowDialog() -eq 'OK') {
            $hex = ('#{0:X2}{1:X2}{2:X2}' -f $dlg.Color.R, $dlg.Color.G, $dlg.Color.B)
            Set-BatAccent -Accent $hex
        }
    })
    [void]$panel.Children.Add($customBtn)
}

function Get-BatBlendHex {
    param([string]$Base, [string]$Tint, [double]$Amount)
    $v = @()
    foreach ($o in 1, 3, 5) {
        $x = [int][Convert]::ToInt32($Base.Substring($o, 2), 16)
        $y = [int][Convert]::ToInt32($Tint.Substring($o, 2), 16)
        $v += [int][Math]::Round($x * (1 - $Amount) + $y * $Amount)
    }
    '#{0:X2}{1:X2}{2:X2}' -f $v[0], $v[1], $v[2]
}

function Set-BatAccent {
    param([string]$Accent, [switch]$NoSave)
    $data = Get-BatResource 'themes.json' | ConvertFrom-Json
    if (-not $Accent) { $Accent = [string]$data.defaultAccent }
    $mode = if ($global:Bat.Theme) { $global:Bat.Theme } else { 'dark' }
    $conv = New-Object System.Windows.Media.BrushConverter
    if ($Accent.StartsWith('#')) {
        $hex = $Accent
        $hex2 = $Accent
    }
    elseif ($data.accents.$Accent) {
        $entry = $data.accents.$Accent
        $hex = if ($mode -eq 'light') { [string]$entry.light } else { [string]$entry.dark }
        $hex2 = [string]$entry.accent2
    }
    else {
        $Accent = [string]$data.defaultAccent
        $entry = $data.accents.$Accent
        $hex = if ($mode -eq 'light') { [string]$entry.light } else { [string]$entry.dark }
        $hex2 = [string]$entry.accent2
    }
    $onHex = Get-BatContrastHex $hex
    $BatUI.Win.Resources['Accent'] = [System.Windows.Media.SolidColorBrush]$conv.ConvertFromString($hex)
    $BatUI.Win.Resources['Accent2'] = [System.Windows.Media.SolidColorBrush]$conv.ConvertFromString($hex2)
    $BatUI.Win.Resources['OnAccent'] = [System.Windows.Media.SolidColorBrush]$conv.ConvertFromString($onHex)
    # Material You feel: surfaces pick up a little of the accent (not on pure AMOLED black)
    if ($mode -ne 'amoled' -and $hex -match '^#[0-9A-Fa-f]{6}$' -and $data.themes.$mode) {
        $base = $data.themes.$mode
        $amt = @{ Bg = 0.035; Side = 0.05; Panel = 0.06; Panel2 = 0.10; Line = 0.12; Hover = 0.12 }
        foreach ($k in $amt.Keys) {
            $mix = Get-BatBlendHex ([string]$base.$k) $hex $amt[$k]
            $BatUI.Win.Resources[$k] = [System.Windows.Media.SolidColorBrush]$conv.ConvertFromString($mix)
        }
    }
    $global:Bat.Accent = $Accent
    Build-BatAccentSwatches
    if (-not $NoSave) { Save-BatSettings }
}

function Set-BatTheme {
    param([string]$Name, [switch]$NoSave)
    $data = Get-BatResource 'themes.json' | ConvertFrom-Json
    if (-not $Name -or -not $data.themes.$Name) { $Name = [string]$data.default }
    $conv = New-Object System.Windows.Media.BrushConverter
    foreach ($prop in $data.themes.$Name.PSObject.Properties) {
        $BatUI.Win.Resources[$prop.Name] = [System.Windows.Media.SolidColorBrush]$conv.ConvertFromString([string]$prop.Value)
    }
    $global:Bat.Theme = $Name
    $names = @{ dark = 'Dark'; light = 'Light'; amoled = 'AMOLED black' }
    $icons = @{ dark = 'IconMoon'; light = 'IconSun'; amoled = 'IconAmoled' }
    $next = 'dark'
    if ($Name -eq 'dark') { $next = 'light' } elseif ($Name -eq 'light') { $next = 'amoled' }
    # The sidebar button always shows the CURRENT theme; clicking it goes to the next one
    $BatUI.ThemeIcon.Data = [System.Windows.Media.Geometry]$BatUI.Win.FindResource($icons[$Name])
    $BatUI.LblTheme.Text = 'Theme: ' + $names[$Name]
    $BatUI.BtnTheme.ToolTip = 'Theme: ' + $names[$Name] + '. Click for ' + $names[$next]
    foreach ($k in 'dark', 'light', 'amoled') {
        $seg = $BatUI['BtnTheme' + $k.Substring(0, 1).ToUpper() + $k.Substring(1)]
        if ($seg) { if ($k -eq $Name) { $seg.Tag = 'Selected' } else { $seg.Tag = $null } }
    }
    Set-BatAccent -Accent $global:Bat.Accent -NoSave
    if (-not $NoSave) { Save-BatSettings }
}

function Set-BatSidebar {
    param([bool]$Collapsed, [switch]$Instant)
    $global:Bat.Collapsed = $Collapsed
    $vis = if ($Collapsed) { 'Collapsed' } else { 'Visible' }
    $BatUI.BtnTheme.Visibility = $(if ($Collapsed) { 'Visible' } else { 'Collapsed' })
    foreach ($n in 'SideTitle', 'LblInstall', 'LblUpdate', 'LblClean', 'LblTweaks', 'LblFixes', 'LblDebloat', 'LblTheme', 'AccentPanel') { $BatUI[$n].Visibility = $vis }
    $targetWidth = $(if ($Collapsed) { 66 } else { 236 })
    if ($Instant) {
        $BatUI.Sidebar.BeginAnimation([System.Windows.FrameworkElement]::WidthProperty, $null)
        $BatUI.Sidebar.Width = $targetWidth
    }
    else {
        $anim = New-Object System.Windows.Media.Animation.DoubleAnimation
        $anim.To = $targetWidth
        $anim.Duration = [TimeSpan]::FromMilliseconds(160)
        $BatUI.Sidebar.BeginAnimation([System.Windows.FrameworkElement]::WidthProperty, $anim)
    }
    Update-BatDriveInfo
}

function Show-BatPage {
    param([string]$Name)
    $pages = @{
        Install = @('PageInstall', 'NavInstall', 'Install & Manage Apps', 'Search pick from catalog or uninstall installed software')
        Update  = @('PageUpdate', 'NavUpdate', 'Update Apps', 'Update installed programs from Winget and Chocolatey')
        Clean   = @('PageClean', 'NavClean', 'Clean C:', 'Quick, System, Advanced, Dead files and Optimize - every operation is explicit and optional')
        Tweaks  = @('PageTweaks', 'NavTweaks', 'Tweaks', 'Registry, services and scheduled task tweaks with live status, automatic backup and undo')
        Fixes   = @('PageFixes', 'NavFixes', 'Fixes and DNS', 'One click repairs and network settings')
        Debloat = @('PageDebloat', 'NavDebloat', 'Debloat', 'Remove built-in Windows apps you do not need')
    }
    foreach ($k in $pages.Keys) {
        $BatUI[$pages[$k][0]].Visibility = 'Collapsed'
        $BatUI[$pages[$k][1]].Tag = $null
    }
    $p = $pages[$Name]
    $BatUI[$p[0]].Visibility = 'Visible'
    $BatUI[$p[1]].Tag = 'Selected'
    $BatUI.SectionTitle.Text = $p[2]
    $BatUI.SectionDesc.Text = $p[3]
}

function Show-BatConfirm {
    param([string]$Text, [string]$Title = 'BAT TOOLKIT')
    $r = [System.Windows.MessageBox]::Show($Text, $Title, 'YesNo', 'Warning')
    $r -eq 'Yes'
}

# ----------------------------------------------------------- catalog
# ------------------------------------------------ tri-state helpers
# A group box is checked (all), dash (some) or empty (none).
# Clicking a dash selects everything, clicking a checked box clears everything.
function Set-BatGroupCheckState {
    param($Check, [bool[]]$Flags)
    $total = @($Flags).Count
    $on = @($Flags | Where-Object { $_ }).Count
    if ($total -eq 0 -or $on -eq 0) { $Check.IsChecked = $false }
    elseif ($on -eq $total) { $Check.IsChecked = $true }
    else { $Check.IsChecked = $null }
}

function Update-BatGroupChecks {
    param($Groups)
    foreach ($g in @($Groups)) {
        if ($null -eq $g) { continue }
        $flags = New-Object 'System.Collections.Generic.List[bool]'
        foreach ($x in $g.Rows) {
            if ($x -is [System.Windows.Controls.CheckBox]) { if ($x.IsEnabled) { $flags.Add([bool]$x.IsChecked) } }
            elseif ($x.Enabled) { $flags.Add([bool]$x.Checked) }
        }
        Set-BatGroupCheckState -Check $g.Chk -Flags $flags.ToArray()
    }
}

function Set-BatGroupAll {
    param($Check)
    $state = [bool]$Check.IsChecked
    foreach ($x in $Check.Tag) {
        if ($x -is [System.Windows.Controls.CheckBox]) { $x.IsChecked = $state }
        elseif ($x.Enabled) { $x.Checked = $state }
    }
}

function New-BatGroupHeader {
    param([string]$Title, $Rows)
    $hdr = New-Object System.Windows.Controls.StackPanel
    $hdr.Orientation = 'Horizontal'
    $chk = New-Object System.Windows.Controls.CheckBox
    $chk.VerticalAlignment = 'Center'
    $chk.Margin = '0,0,10,0'
    $chk.ToolTip = 'Tick or untick the whole group. A dash means only some items are ticked.'
    $chk.Tag = $Rows
    $chk.Add_Click({ param($s, $ev) Set-BatGroupAll -Check $s })
    $txt = New-Object System.Windows.Controls.TextBlock
    $txt.Text = $Title
    $txt.FontWeight = 'SemiBold'
    $txt.VerticalAlignment = 'Center'
    [void]$hdr.Children.Add($chk)
    [void]$hdr.Children.Add($txt)
    [pscustomobject]@{ Header = $hdr; Chk = $chk; Rows = $Rows }
}

# ----------------------------------------------------------- catalog
function Update-BatSelectedList {
    $BatUI.SelectedList.Items.Clear()
    foreach ($cb in $global:Bat.CatalogBoxes) {
        if ($cb.IsChecked) { [void]$BatUI.SelectedList.Items.Add($cb.Tag.name) }
    }
    $BatUI.SelectedHeader.Text = "Selected Apps ($($BatUI.SelectedList.Items.Count))"
}

function Update-BatCatalogState {
    Update-BatGroupChecks $global:Bat.CatalogGroups
    Update-BatSelectedList
}

function Build-BatCatalog {
    $catalog = Get-BatResource 'apps.json' | ConvertFrom-Json
    $global:Bat.CatalogBoxes.Clear()
    $global:Bat.CatalogGroups = New-Object System.Collections.ArrayList
    $BatUI.CatalogPanel.Children.Clear()
    $cardStyle = $BatUI.Win.FindResource('AppCard')
    foreach ($cat in $catalog.categories) {
        $boxes = New-Object System.Collections.ArrayList
        $wrap = New-Object System.Windows.Controls.WrapPanel
        $wrap.Margin = '18,6,0,6'
        foreach ($app in $cat.apps) {
            $cb = New-Object System.Windows.Controls.CheckBox
            $cb.Content = $app.name
            $cb.Tag = $app
            $cb.ToolTip = $app.desc
            $cb.Add_Checked({ Update-BatCatalogState })
            $cb.Add_Unchecked({ Update-BatCatalogState })
            $card = New-Object System.Windows.Controls.Border
            $card.Style = $cardStyle
            $card.Width = 230
            $card.Margin = '0,0,8,8'
            $card.Tag = $app
            $card.Child = $cb
            [void]$boxes.Add($cb)
            [void]$global:Bat.CatalogBoxes.Add($cb)
            [void]$wrap.Children.Add($card)
        }
        $grp = New-BatGroupHeader -Title "$($cat.name)  ($(@($cat.apps).Count))" -Rows $boxes
        [void]$global:Bat.CatalogGroups.Add($grp)
        $exp = New-Object System.Windows.Controls.Expander
        $exp.Header = $grp.Header
        $exp.Tag = [string]$cat.name
        $exp.IsExpanded = ($cat.name -eq 'Essentials')
        $exp.Content = $wrap
        [void]$BatUI.CatalogPanel.Children.Add($exp)
    }
    Update-BatGroupChecks $global:Bat.CatalogGroups
}

function Set-BatCatalogFilter {
    param([string]$Text)
    $t = "$Text".Trim()
    foreach ($exp in $BatUI.CatalogPanel.Children) {
        $any = $false
        foreach ($card in $exp.Content.Children) {
            $a = $card.Tag
            $hit = $true
            if ($t) {
                $hay = "$($a.name) $($a.desc) $($a.winget) $($a.choco)"
                $hit = ($hay.IndexOf($t, [StringComparison]::OrdinalIgnoreCase) -ge 0)
            }
            if ($hit) { $card.Visibility = 'Visible'; $any = $true } else { $card.Visibility = 'Collapsed' }
        }
        if ($any) { $exp.Visibility = 'Visible' } else { $exp.Visibility = 'Collapsed' }
        if ($t) { $exp.IsExpanded = $any } else { $exp.IsExpanded = ($exp.Tag -eq 'Essentials') }
    }
}

function Resolve-BatCatalogItems {
    param($Apps, [string]$Mode)
    foreach ($a in $Apps) {
        $src = $null
        $id = $null
        if ($Mode -ne 'choco' -and $a.winget) { $src = 'winget'; $id = $a.winget }
        elseif ($Mode -ne 'winget' -and $a.choco) { $src = 'choco'; $id = $a.choco }
        if ($src) { [pscustomobject]@{ Name = $a.name; Source = $src; Id = $id } }
        else { Write-BatLog "No package id for '$($a.name)' with source '$Mode' - skipped" 'WARN' }
    }
}

function Set-BatCatalogChecked {
    param([bool]$State)
    foreach ($cb in $global:Bat.CatalogBoxes) { $cb.IsChecked = $State }
}

# ------------------------------------------------------------- clean
function Get-BatCleanItems {
    foreach ($i in @($global:Bat.CleanItems)) { if ($null -ne $i) { $i } }
}

function Update-BatCleanCounter {
    if (-not $BatUI.CleanCounter) { return }
    $all = @(Get-BatCleanItems)
    $sel = @($all | Where-Object { $_.Checked })
    [long]$bytes = 0
    foreach ($i in $sel) { $bytes += [long]$i.Bytes }
    $txt = "$($sel.Count) of $($all.Count) selected"
    if ($global:Bat.CleanAnalyzed) { $txt += '   |   Will free about ' + (Format-BatBytes $bytes) + ' (measurable items)' }
    else { $txt += '   |   Press Analyze Sizes to see how much space you will free' }
    $BatUI.CleanCounter.Text = $txt
}

function Show-BatCleanGroups {
    $panel = $BatUI.CleanHost
    $panel.Children.Clear()
    $global:Bat.CleanGroups = New-Object System.Collections.ArrayList
    $byTime = [bool]$BatUI.RbByTime.IsChecked
    if ($byTime) { $order = @('Instant', 'Seconds', 'Minutes', 'Long') }
    else { $order = @('Quick', 'System', 'Advanced', 'Dead files', 'Optimize') }
    $labels = @{
        'Instant' = 'Instant  -  under 5 seconds'; 'Seconds' = 'Seconds  -  up to a minute'
        'Minutes' = 'Minutes  -  1 to 10 minutes'; 'Long' = 'Long  -  10 minutes or more'
        'Quick' = 'Quick Clean'; 'System' = 'System Cleanup'; 'Advanced' = 'Advanced Cleanup'
        'Dead files' = 'Dead files'; 'Optimize' = 'Optimize'
    }
    $template = $BatUI.Win.FindResource('CleanRow')
    $first = $true
    foreach ($g in $order) {
        $items = @($global:Bat.CleanItems | Where-Object { $(if ($byTime) { $_.Speed } else { $_.Group }) -eq $g })
        if ($items.Count -eq 0) { continue }
        $list = New-Object 'System.Collections.Generic.List[BatItem]'
        foreach ($i in $items) { $list.Add($i) }

        $grp = New-BatGroupHeader -Title ('{0}   ({1})' -f $labels[$g], $items.Count) -Rows $list
        [void]$global:Bat.CleanGroups.Add($grp)

        $ic = New-Object System.Windows.Controls.ItemsControl
        $ic.ItemsSource = $list
        $ic.ItemTemplate = $template
        $ic.Margin = '28,10,4,4'

        $exp = New-Object System.Windows.Controls.Expander
        $exp.Header = $grp.Header
        $exp.Content = $ic
        $exp.IsExpanded = $first
        $first = $false
        [void]$panel.Children.Add($exp)
    }
    Update-BatGroupChecks $global:Bat.CleanGroups
    Update-BatCleanCounter
}

function Build-BatClean {
    $ops = @((Get-BatResource 'cleanup.json' | ConvertFrom-Json).operations)
    $global:Bat.CleanItems = New-Object System.Collections.ArrayList
    $global:Bat.CleanAnalyzed = $false
    foreach ($o in $ops) {
        $i = New-Object BatItem
        $i.Id = $o.id; $i.Name = $o.name; $i.Desc = $o.desc; $i.Risk = $o.risk
        $i.Group = $o.group; $i.Data = $o; $i.Size = ''
        $i.Speed = $(if ($o.speed) { [string]$o.speed } else { 'Seconds' })
        $i.Checked = (($o.group -ne 'Advanced') -and [bool]$o.safe)
        $i.add_PropertyChanged({
            param($s, $ev)
            if ($ev.PropertyName -eq 'Checked') { Update-BatGroupChecks $global:Bat.CleanGroups; Update-BatCleanCounter }
        })
        [void]$global:Bat.CleanItems.Add($i)
    }
    Show-BatCleanGroups
}

# ------------------------------------------------------------ tweaks
# Layout follows WinUtil. Left: checkbox tweaks (tick, then Run Tweaks / Undo). Right: switches that
# apply instantly, comboboxes and one-click buttons.
function Get-BatTweakItems {
    foreach ($i in @($global:Bat.TweakItems)) { if ($null -ne $i) { $i } }
}

function Test-BatTweakIsCheckbox {
    param($Item)
    $ty = [string]$Item.Data.Type
    return ($ty -ne 'Toggle' -and $ty -ne 'Button' -and $ty -ne 'ComboOption')
}

function Update-BatTweakCounter {
    if (-not $BatUI.TweakCounter) { return }
    $all = @(Get-BatTweakItems)
    $sel = @($all | Where-Object { (Test-BatTweakIsCheckbox $_) -and $_.Checked })
    $careful = @($sel | Where-Object { $_.Risk -eq 'Careful' }).Count
    $applied = @($all | Where-Object { $_.Status -eq 'Applied' -and $_.Data.Type -ne 'ComboOption' }).Count
    $BatUI.TweakCounter.Text = "$($sel.Count) selected ($careful careful)   |   $applied tweak(s) already applied on this PC"
}

function New-BatHelpMark {
    param([string]$Text)
    $q = New-Object System.Windows.Controls.TextBlock
    $q.Text = '(?)'
    $q.FontSize = 11
    $q.Margin = '6,0,0,0'
    $q.VerticalAlignment = 'Center'
    $q.Cursor = 'Help'
    $q.SetResourceReference([System.Windows.Controls.TextBlock]::ForegroundProperty, 'Dim')
    $q.ToolTip = $Text
    [System.Windows.Controls.ToolTipService]::SetShowDuration($q, 30000)
    [System.Windows.Controls.ToolTipService]::SetInitialShowDelay($q, 200)
    $q
}

function New-BatTweakTip {
    param($Item)
    $tip = [string]$Item.Desc
    if ($Item.Risk) { $tip = ($tip + "`nRisk: " + $Item.Risk).Trim() }
    if (-not $Item.Enabled) { $tip = ($tip + "`n" + $Item.Status).Trim() }
    $tip
}

function New-BatSectionTitle {
    param([string]$Text)
    $t = New-Object System.Windows.Controls.TextBlock
    $t.Text = $Text
    $t.FontFamily = 'Consolas'
    $t.FontSize = 15
    $t.FontWeight = 'SemiBold'
    $t.Margin = '0,10,0,6'
    $t.SetResourceReference([System.Windows.Controls.TextBlock]::ForegroundProperty, 'Accent')
    $t
}

function New-BatTweakCheckRow {
    param($Item)
    $row = New-Object System.Windows.Controls.StackPanel
    $row.Orientation = 'Horizontal'
    $row.Margin = '0,3,0,3'
    $cb = New-Object System.Windows.Controls.CheckBox
    $cb.Content = $Item.Name
    $cb.IsEnabled = $Item.Enabled
    $b = New-Object System.Windows.Data.Binding('Checked')
    $b.Source = $Item
    $b.Mode = 'TwoWay'
    [void]$cb.SetBinding([System.Windows.Controls.Primitives.ToggleButton]::IsCheckedProperty, $b)
    [void]$row.Children.Add($cb)
    [void]$row.Children.Add((New-BatHelpMark (New-BatTweakTip $Item)))
    $st = New-Object System.Windows.Controls.TextBlock
    $st.FontSize = 11
    $st.Margin = '10,0,0,0'
    $st.VerticalAlignment = 'Center'
    $st.SetResourceReference([System.Windows.Controls.TextBlock]::ForegroundProperty, 'Dim')
    $sb = New-Object System.Windows.Data.Binding('Status')
    $sb.Source = $Item
    $sb.Mode = 'OneWay'
    [void]$st.SetBinding([System.Windows.Controls.TextBlock]::TextProperty, $sb)
    [void]$row.Children.Add($st)
    $row
}

function Invoke-BatToggle {
    param($Toggle)
    $item = $Toggle.Tag
    $on = [bool]$Toggle.IsChecked
    if ($global:Bat.Busy) {
        $Toggle.IsChecked = (-not $on)
        Write-BatLog 'Another operation is still running - please wait' 'WARN'
        return
    }
    if ($item.Risk -eq 'Careful' -and -not (Show-BatConfirm "'$($item.Name)' is marked CAREFUL. Continue?")) { $Toggle.IsChecked = (-not $on); return }
    $list = @($item.Data)
    if ($on) {
        Invoke-BatAsync -Title "Apply: $($item.Name)" -ArgumentList @(, $list) `
            -Work { param($list) Invoke-BatTweaks -Tweaks $list } -OnDone { param($r) Start-BatTweakScan }
    }
    else {
        Invoke-BatAsync -Title "Undo: $($item.Name)" -ArgumentList @(, $list) `
            -Work { param($list) Undo-BatTweaks -Tweaks $list } -OnDone { param($r) Start-BatTweakScan }
    }
}

function New-BatTweakToggleRow {
    param($Item)
    $row = New-Object System.Windows.Controls.StackPanel
    $row.Orientation = 'Horizontal'
    $row.Margin = '0,4,0,4'
    $tb = New-Object System.Windows.Controls.Primitives.ToggleButton
    $tb.Style = $BatUI.Win.FindResource('SwitchToggle')
    $tb.Tag = $Item
    $tb.IsEnabled = $Item.Enabled
    $tb.Add_Click({ param($s, $ev) Invoke-BatToggle -Toggle $s })
    $lbl = New-Object System.Windows.Controls.TextBlock
    $lbl.Text = $Item.Name
    $lbl.Margin = '10,0,0,0'
    $lbl.VerticalAlignment = 'Center'
    [void]$row.Children.Add($tb)
    [void]$row.Children.Add($lbl)
    [void]$row.Children.Add((New-BatHelpMark (New-BatTweakTip $Item)))
    $global:Bat.TweakControls[$Item.Id] = $tb
    $row
}

function Invoke-BatTweakButton {
    param($Button)
    $item = $Button.Tag
    if ($item.Risk -eq 'Careful' -and -not (Show-BatConfirm "'$($item.Name)' is marked CAREFUL and may download or change a lot. Continue?")) { return }
    $list = @($item.Data)
    Invoke-BatAsync -Title $item.Name -ArgumentList @(, $list) `
        -Work { param($list) Invoke-BatTweaks -Tweaks $list } -OnDone { param($r) Start-BatTweakScan }
}

function New-BatTweakButtonRow {
    param($Item)
    $btn = New-Object System.Windows.Controls.Button
    $btn.Content = $Item.Name
    $btn.Tag = $Item
    $btn.IsEnabled = $Item.Enabled
    $btn.ToolTip = (New-BatTweakTip $Item)
    $btn.HorizontalAlignment = 'Left'
    $btn.MinWidth = 260
    $btn.Margin = '0,4,0,4'
    $btn.Add_Click({ param($s, $ev) Invoke-BatTweakButton -Button $s })
    $btn
}

function Invoke-BatComboChange {
    param($Combo)
    if ($global:Bat.Busy) { Write-BatLog 'Another operation is still running - press Get Installed Tweaks to resync the list' 'WARN'; return }
    $opts = @($Combo.Tag)
    $idx = [int]$Combo.SelectedIndex
    $undo = @($opts | Where-Object { $_.Data.ComboIndex -gt 0 } | ForEach-Object { $_.Data })
    $apply = @($opts | Where-Object { $_.Data.ComboIndex -eq $idx -and $idx -gt 0 } | ForEach-Object { $_.Data })
    Invoke-BatAsync -Title ('Set: ' + $opts[0].Data.ComboTitle) -ArgumentList @($undo, $apply) `
        -Work { param($undo, $apply) Undo-BatTweaks -Tweaks $undo; if (@($apply).Count -gt 0) { Invoke-BatTweaks -Tweaks $apply } } `
        -OnDone { param($r) Start-BatTweakScan }
}

function New-BatTweakComboRow {
    param($Items)
    $sorted = @($Items | Sort-Object { $_.Data.ComboIndex })
    $row = New-Object System.Windows.Controls.StackPanel
    $row.Orientation = 'Horizontal'
    $row.Margin = '0,8,0,4'
    $lbl = New-Object System.Windows.Controls.TextBlock
    $lbl.Text = $sorted[0].Data.ComboTitle
    $lbl.VerticalAlignment = 'Center'
    $lbl.Margin = '0,0,10,0'
    $cmb = New-Object System.Windows.Controls.ComboBox
    $cmb.Width = 230
    $cmb.Height = 28
    $cmb.VerticalContentAlignment = 'Center'
    foreach ($i in $sorted) { [void]$cmb.Items.Add([string]$i.Data.ComboOption) }
    $cmb.SelectedIndex = 0
    $cmb.Tag = $sorted
    $cmb.IsEnabled = $sorted[0].Enabled
    $cmb.Add_SelectionChanged({ param($s, $ev) if (-not $global:Bat.TweakUiLock) { Invoke-BatComboChange -Combo $s } })
    [void]$row.Children.Add($lbl)
    [void]$row.Children.Add($cmb)
    $tip = ($sorted | ForEach-Object { $_.Data.ComboOption + ': ' + $_.Desc }) -join "`n"
    [void]$row.Children.Add((New-BatHelpMark $tip))
    [void]$global:Bat.TweakCombos.Add($cmb)
    $row
}

function New-BatTweakDnsRow {
    $providers = @((Get-BatResource 'dns.json' | ConvertFrom-Json).providers)
    $row = New-Object System.Windows.Controls.StackPanel
    $row.Orientation = 'Horizontal'
    $row.Margin = '0,10,0,4'
    $lbl = New-Object System.Windows.Controls.TextBlock
    $lbl.Text = 'DNS - Set to:'
    $lbl.VerticalAlignment = 'Center'
    $lbl.Margin = '0,0,10,0'
    $cmb = New-Object System.Windows.Controls.ComboBox
    $cmb.Width = 230
    $cmb.Height = 28
    $cmb.VerticalContentAlignment = 'Center'
    foreach ($p in $providers) { [void]$cmb.Items.Add([string]$p.name) }
    $cmb.SelectedIndex = 0
    $cmb.Tag = $providers
    $cmb.Add_SelectionChanged({
        param($s, $ev)
        if ($global:Bat.TweakUiLock) { return }
        $p = @($s.Tag)[[int]$s.SelectedIndex]
        if (-not $p) { return }
        Invoke-BatAsync -Title "Apply DNS: $($p.name)" -ArgumentList @($p.name, @($p.ipv4), @($p.ipv6)) `
            -Work { param($n, $v4, $v6) Set-BatDns -Name $n -IPv4 $v4 -IPv6 $v6 }
    })
    [void]$row.Children.Add($lbl)
    [void]$row.Children.Add($cmb)
    [void]$row.Children.Add((New-BatHelpMark 'Changes the DNS servers of your active network adapters now. The first entry returns to automatic (DHCP).'))
    $row
}

function Show-BatTweakGroups {
    $left = $BatUI.TweakLeft
    $right = $BatUI.TweakRight
    $left.Children.Clear()
    $right.Children.Clear()
    $global:Bat.TweakGroups = New-Object System.Collections.ArrayList
    $global:Bat.TweakControls = @{}
    $global:Bat.TweakCombos = New-Object System.Collections.ArrayList
    $global:Bat.TweakUiLock = $true
    $items = @(Get-BatTweakItems)
    $cats = New-Object System.Collections.ArrayList
    foreach ($c in 'Essential Tweaks', 'Customize Preferences', 'Advanced Tweaks - CAUTION', 'Performance Plans - NOT FOR LAPTOPS') {
        if (@($items | Where-Object { $_.Group -eq $c }).Count -gt 0) { [void]$cats.Add($c) }
    }
    foreach ($i in $items) { if (-not $cats.Contains($i.Group)) { [void]$cats.Add($i.Group) } }

    foreach ($c in $cats) {
        $rows = @($items | Where-Object { $_.Group -eq $c })
        $isRight = ($c -match 'Customize|Performance')
        if ($isRight) { $panel = $right } else { $panel = $left }

        if ($isRight) { [void]$panel.Children.Add((New-BatSectionTitle $c)) }
        else {
            $list = New-Object 'System.Collections.Generic.List[BatItem]'
            foreach ($i in $rows) { if (Test-BatTweakIsCheckbox $i) { $list.Add($i) } }
            $grp = New-BatGroupHeader -Title $c -Rows $list
            $grp.Header.Margin = '0,10,0,6'
            $grp.Header.Children[1].FontFamily = New-Object System.Windows.Media.FontFamily('Consolas')
            $grp.Header.Children[1].FontSize = 15
            [void]$global:Bat.TweakGroups.Add($grp)
            [void]$panel.Children.Add($grp.Header)
        }
        foreach ($i in $rows) {
            $ty = [string]$i.Data.Type
            if ($ty -eq 'Toggle') { [void]$panel.Children.Add((New-BatTweakToggleRow $i)) }
            elseif (Test-BatTweakIsCheckbox $i) { [void]$panel.Children.Add((New-BatTweakCheckRow $i)) }
        }
        foreach ($cg in @($rows | Where-Object { $_.Data.Type -eq 'ComboOption' } | Group-Object { $_.Data.ComboGroup })) {
            [void]$panel.Children.Add((New-BatTweakComboRow -Items @($cg.Group)))
        }
        foreach ($i in $rows) { if ($i.Data.Type -eq 'Button') { [void]$panel.Children.Add((New-BatTweakButtonRow $i)) } }
        if ($c -match 'Advanced') { [void]$panel.Children.Add((New-BatTweakDnsRow)) }
    }
    $global:Bat.TweakUiLock = $false
    Update-BatGroupChecks $global:Bat.TweakGroups
    Update-BatTweakCounter
}

function Build-BatTweaks {
    $build = Get-BatWindowsBuild
    $global:Bat.TweakItems = New-Object System.Collections.ArrayList
    $global:Bat.TweaksScanned = $false
    foreach ($t in @(Get-BatTweakList)) {
        $i = New-Object BatItem
        $i.Id = $t.Id; $i.Name = $t.Name; $i.Desc = $t.Desc; $i.Risk = $t.Risk; $i.Group = $t.Category; $i.Data = $t
        $i.Status = 'Not checked'
        $why = Get-BatTweakBlock -Tweak $t -Build $build
        if ($why) { $i.Enabled = $false; $i.Status = $why }
        $i.add_PropertyChanged({
            param($s, $ev)
            if ($ev.PropertyName -eq 'Checked') { Update-BatGroupChecks $global:Bat.TweakGroups; Update-BatTweakCounter }
        })
        [void]$global:Bat.TweakItems.Add($i)
    }
    Show-BatTweakGroups
}

function Set-BatTweakPreset {
    param([string]$Name)
    $minimal = @('WPFTweaksRestorePoint', 'WPFTweaksTelemetry', 'WPFTweaksActivity', 'WPFTweaksConsumerFeatures', 'WPFTweaksLocation', 'WPFTweaksDisableStoreSearch')
    $skip = @('WPFTweaksHiber', 'WPFTweaksDisableBitLocker', 'WPFTweaksDiskCleanup', 'WPFTweaksRevertStartMenu')
    $extra = @('WPFTweaksBraveDebloat', 'WPFTweaksEdgeDebloat', 'WPFTweaksDisableBGapps', 'WPFTweaksTeredo', 'WPFTweaksRemoveHomeAndGallery', 'WPFTweaksDisplay', 'WPFTweaksBlockAdobeNet')
    foreach ($i in (Get-BatTweakItems)) {
        if (-not (Test-BatTweakIsCheckbox $i)) { continue }
        $on = $false
        if ($i.Enabled) {
            $std = ($i.Group -match 'Essential' -and ($skip -notcontains $i.Id))
            if ($Name -eq 'Minimal') { $on = ($minimal -contains $i.Id) }
            elseif ($Name -eq 'Standard') { $on = $std }
            elseif ($Name -eq 'Advanced') { $on = ($std -or ($extra -contains $i.Id)) }
        }
        $i.Checked = $on
    }
}

function Start-BatTweakScan {
    param([switch]$SelectApplied)
    $list = @(Get-BatTweakItems | ForEach-Object { $_.Data })
    if ($list.Count -eq 0) { return }
    $global:Bat.SelectAppliedNext = [bool]$SelectApplied
    Invoke-BatAsync -Title 'Detect tweak status' -ArgumentList @(, $list) `
        -Work { param($list) Get-BatTweakStates -Tweaks $list } `
        -OnDone {
            param($r)
            $map = @{}
            foreach ($x in @($r)) { if ($x) { $map[$x.Id] = $x.State } }
            $selectApplied = [bool]$global:Bat.SelectAppliedNext
            $global:Bat.SelectAppliedNext = $false
            foreach ($i in (Get-BatTweakItems)) {
                if (-not $i.Enabled) { continue }
                $st = $map[$i.Id]
                if ($st -eq 'Applied') { $i.Status = 'Applied' }
                elseif ($st -eq 'Partial') { $i.Status = 'Partly applied' }
                elseif ($st -eq 'Off') { $i.Status = 'Not applied' }
                elseif ($i.Data.Type -eq 'Button') { $i.Status = 'Run action' }
                else { $i.Status = 'Unknown' }
                $ctl = $global:Bat.TweakControls[$i.Id]
                if ($ctl) { $ctl.IsChecked = ($st -eq 'Applied') }
                if ($selectApplied -and $st -eq 'Applied' -and (Test-BatTweakIsCheckbox $i)) { $i.Checked = $true }
            }
            foreach ($cmb in @($global:Bat.TweakCombos)) {
                $idx = 0
                foreach ($o in @($cmb.Tag)) { if ($o.Data.ComboIndex -gt 0 -and $map[$o.Id] -eq 'Applied') { $idx = [int]$o.Data.ComboIndex } }
                $global:Bat.TweakUiLock = $true
                $cmb.SelectedIndex = $idx
                $global:Bat.TweakUiLock = $false
            }
            $global:Bat.TweaksScanned = $true
            Update-BatTweakCounter
        }
}

function Start-BatTweakAction {
    param([string]$Mode)
    $sel = @(Get-BatTweakItems | Where-Object { (Test-BatTweakIsCheckbox $_) -and $_.Checked -and $_.Enabled })
    if ($sel.Count -eq 0) { Write-BatLog 'Tick at least one tweak on the left first' 'WARN'; return }
    $careful = @($sel | Where-Object { $_.Risk -eq 'Careful' })
    if ($careful.Count -gt 0) {
        $names = ($careful | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "These selected tweaks are marked CAREFUL:`n`n$names`n`nContinue?")) { return }
    }
    $list = @($sel | ForEach-Object { $_.Data })
    if ($Mode -eq 'Apply') {
        $rp = [bool]$BatUI.ChkTweakRestore.IsChecked
        Invoke-BatAsync -Title "Run $($list.Count) tweak(s)" -ArgumentList @($list, $rp) `
            -Work { param($list, $rp) if ($rp) { New-BatRestorePoint -Description 'BAT TOOLKIT before tweaks' }; Invoke-BatTweaks -Tweaks $list } `
            -OnDone { param($r) Start-BatTweakScan }
    }
    else {
        if (-not (Show-BatConfirm "Undo $($list.Count) tweak(s) using the values saved before they were applied?")) { return }
        Invoke-BatAsync -Title "Undo $($list.Count) tweak(s)" -ArgumentList @(, $list) `
            -Work { param($list) Undo-BatTweaks -Tweaks $list } `
            -OnDone { param($r) Start-BatTweakScan }
    }
}

# ----------------------------------------------------------- debloat
function Update-BatBloatCounter {
    if (-not $BatUI.BloatCounter) { return }
    $all = @($BatUI.GridBloat.ItemsSource | Where-Object { $null -ne $_ })
    $n = @($all | Where-Object { $_.Checked }).Count
    $BatUI.BloatCounter.Text = "$n of $($all.Count) selected"
}

function Set-BatBloatPreset {
    param($Ids)
    $n = 0
    foreach ($i in @($BatUI.GridBloat.ItemsSource)) {
        if ($i -and (@($Ids) -contains $i.Id)) { $i.Checked = $true; $n++ }
    }
    Write-BatLog "Preset applied: $n app(s) ticked" 'OK'
}

function Start-BatBloatScan {
    $entries = @((Get-BatResource 'bloatware.json' | ConvertFrom-Json).entries)
    Invoke-BatAsync -Title 'Scan installed bloatware' -ArgumentList @(, $entries) `
        -Work { param($entries) Find-BatBloat -Entries $entries } `
        -OnDone {
            param($r)
            Set-BatGrid $BatUI.GridBloat (ConvertTo-BatItems $r | ForEach-Object { $_ })
            foreach ($i in @($BatUI.GridBloat.ItemsSource)) {
                if ($i) { $i.add_PropertyChanged({ param($s, $ev) if ($ev.PropertyName -eq 'Checked') { Update-BatBloatCounter } }) }
            }
            Set-BatGridFilter $BatUI.GridBloat $BatUI.TxtFilterBloat.Text
            Write-BatLog ("{0} package(s) found" -f @($r).Count) 'OK'
            if ($global:Bat.PendingPreset) { $ids = $global:Bat.PendingPreset; $global:Bat.PendingPreset = $null; Set-BatBloatPreset $ids }
            Update-BatBloatCounter
        }
}

function Start-BatClean {
    param([switch]$QuickOnly)
    if ($QuickOnly) {
        foreach ($i in (Get-BatCleanItems)) { $i.Checked = ($i.Group -eq 'Quick') -and ($i.Data.safe -eq $true) }
    }
    $sel = @(Get-BatCleanItems | Where-Object { $_.Checked })
    if ($sel.Count -eq 0) { Write-BatLog 'Nothing selected to clean' 'WARN'; return }
    $careful = @($sel | Where-Object { $_.Risk -eq 'Careful' })
    if ($careful.Count -gt 0) {
        $names = ($careful | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "These selected operations are marked CAREFUL:`n`n$names`n`nContinue?")) { return }
    }
    $ops = @($sel | ForEach-Object { $_.Data })
    Invoke-BatAsync -Title "Clean C: ($($ops.Count) operations)" -ArgumentList @(, $ops) `
        -Work { param($ops) Invoke-BatCleanOps -Ops $ops } `
        -OnDone { param($r) Update-BatDriveInfo }
}

# --------------------------------------------------------- handlers
function Register-BatHandlers {
    $u = $BatUI

    foreach ($g in @($u.GridSearch, $u.GridInstalled, $u.GridUpd, $u.GridBloat)) {
        Enable-BatGridRowToggle $g
    }

    # sidebar + navigation
    $u.BtnToggle.Add_Click({ Set-BatSidebar (-not $global:Bat.Collapsed) })
    $u.NavInstall.Add_Click({ Show-BatPage 'Install' })
    $u.NavUpdate.Add_Click({ Show-BatPage 'Update' })
    $u.NavClean.Add_Click({ Show-BatPage 'Clean' })
    $u.NavTweaks.Add_Click({ Show-BatPage 'Tweaks'; if (-not $global:Bat.TweaksScanned) { Start-BatTweakScan } })
    $u.NavFixes.Add_Click({ Show-BatPage 'Fixes' })
    $u.NavDebloat.Add_Click({ Show-BatPage 'Debloat' })

    # shared
    $u.BtnThemeDark.Add_Click({ Set-BatTheme 'dark' })
    $u.BtnThemeLight.Add_Click({ Set-BatTheme 'light' })
    $u.BtnThemeAmoled.Add_Click({ Set-BatTheme 'amoled' })
    $u.BtnTheme.Add_Click({
        $n = 'dark'
        if ($global:Bat.Theme -eq 'dark') { $n = 'light' } elseif ($global:Bat.Theme -eq 'light') { $n = 'amoled' }
        Set-BatTheme $n
    })
    $u.BtnClearLog.Add_Click({ $BatUI.LogBox.Clear() })
    $u.BtnCopyLog.Add_Click({ if ($BatUI.LogBox.Text) { [System.Windows.Clipboard]::SetText($BatUI.LogBox.Text) } })

    # package manager setup
    $u.BtnGetWinget.Add_Click({
        Invoke-BatAsync -Title 'Install winget' -Work { Install-BatWinget } -OnDone { Update-BatPmStatus }
    })
    $u.BtnGetChoco.Add_Click({
        Invoke-BatAsync -Title 'Install Chocolatey' -Work { Install-BatChoco } -OnDone { Update-BatPmStatus }
    })

    # ---- install: search
    $doSearch = {
        $q = $BatUI.TxtSearch.Text.Trim()
        if (-not $q) { return }
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title "Search: $q" -ArgumentList @($q, $mode) `
            -Work { param($q, $mode) Search-BatPackages -Query $q -Mode $mode } `
            -OnDone { param($r) Set-BatGrid $BatUI.GridSearch (ConvertTo-BatItems $r) }
    }
    $u.BtnSearch.Add_Click($doSearch)
    $u.TxtSearch.Add_KeyDown({ param($s, $e) if ($e.Key -eq 'Return') { $BatUI.BtnSearch.RaiseEvent((New-Object System.Windows.RoutedEventArgs([System.Windows.Controls.Primitives.ButtonBase]::ClickEvent))) } })
    $u.BtnInstallSearch.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridSearch)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one result first' 'WARN'; return }
        Invoke-BatAsync -Title "Install $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'install' }
    })

    # ---- install: popular catalog
    $u.TxtCatalogSearch.Add_TextChanged({ Set-BatCatalogFilter $BatUI.TxtCatalogSearch.Text })
    $u.BtnDeselectAll.Add_Click({ Set-BatCatalogChecked $false })
    $u.BtnClearCatalog.Add_Click({
        Set-BatCatalogChecked $false
        foreach ($cb in $global:Bat.CatalogBoxes) { $cb.Content = $cb.Tag.name }
    })
    $u.BtnInstallCatalog.Add_Click({
        $apps = @($global:Bat.CatalogBoxes | Where-Object { $_.IsChecked } | ForEach-Object { $_.Tag })
        if ($apps.Count -eq 0) { Write-BatLog 'No catalog apps selected' 'WARN'; return }
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        $items = @(Resolve-BatCatalogItems $apps $mode)
        if ($items.Count -eq 0) { return }
        Invoke-BatAsync -Title "Install $($items.Count) catalog app(s)" -ArgumentList @(, $items) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'install' }
    })
    $u.BtnShowInstalled.Add_Click({
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Detect installed apps' -ArgumentList @($mode) `
            -Work { param($mode) Get-BatInstalled -Mode $mode } `
            -OnDone {
                param($r)
                $ids = @{}
                foreach ($x in @($r)) { if ($x) { $ids[("$($x.Id)").ToLower()] = $true } }
                $mark = [string][char]0x2713
                $n = 0
                foreach ($cb in $global:Bat.CatalogBoxes) {
                    $a = $cb.Tag
                    $has = ($a.winget -and $ids.ContainsKey($a.winget.ToLower())) -or ($a.choco -and $ids.ContainsKey($a.choco.ToLower()))
                    if ($has) { $cb.Content = "$($a.name)  $mark"; $n++ } else { $cb.Content = $a.name }
                }
                Write-BatLog "$n catalog app(s) already installed" 'OK'
            }
    })
    $u.BtnExport.Add_Click({
        $sel = @($global:Bat.CatalogBoxes | Where-Object { $_.IsChecked } | ForEach-Object { [pscustomobject]@{ name = $_.Tag.name; winget = $_.Tag.winget; choco = $_.Tag.choco } })
        if ($sel.Count -eq 0) { Write-BatLog 'Nothing selected to export' 'WARN'; return }
        $dlg = New-Object System.Windows.Forms.SaveFileDialog
        $dlg.Filter = 'JSON (*.json)|*.json'
        $dlg.FileName = 'bat-apps.json'
        if ($dlg.ShowDialog() -eq 'OK') {
            ConvertTo-Json -InputObject @($sel) | Set-Content -LiteralPath $dlg.FileName -Encoding UTF8
            Write-BatLog "Exported $($sel.Count) app(s) to $($dlg.FileName)" 'OK'
        }
    })
    $u.BtnImport.Add_Click({
        $dlg = New-Object System.Windows.Forms.OpenFileDialog
        $dlg.Filter = 'JSON (*.json)|*.json'
        if ($dlg.ShowDialog() -ne 'OK') { return }
        try { $list = @(Get-Content -LiteralPath $dlg.FileName -Raw -Encoding UTF8 | ConvertFrom-Json) }
        catch { Write-BatLog "Import failed: $($_.Exception.Message)" 'ERR'; return }
        $n = 0
        foreach ($app in $list) {
            foreach ($cb in $global:Bat.CatalogBoxes) {
                $t = $cb.Tag
                if (($app.winget -and $t.winget -eq $app.winget) -or ($app.choco -and $t.choco -eq $app.choco) -or ($app.name -and $t.name -eq $app.name)) {
                    $cb.IsChecked = $true; $n++; break
                }
            }
        }
        Write-BatLog "Imported selection: $n app(s) matched the catalog" 'OK'
    })

    # ---- install: uninstall
    $reloadInstalled = {
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Load installed apps' -ArgumentList @($mode) `
            -Work { param($mode) Get-BatInstalled -Mode $mode } `
            -OnDone {
                param($r)
                Set-BatGrid $BatUI.GridInstalled (ConvertTo-BatItems $r)
                Set-BatGridFilter $BatUI.GridInstalled $BatUI.TxtFilterInstalled.Text
                Write-BatLog ("{0} item(s) loaded" -f @($r).Count) 'OK'
            }
    }
    $u.BtnLoadInstalled.Add_Click($reloadInstalled)
    $u.TxtFilterInstalled.Add_TextChanged({ Set-BatGridFilter $BatUI.GridInstalled $BatUI.TxtFilterInstalled.Text })
    $u.BtnUninstall.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridInstalled)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        $names = ($sel | Select-Object -First 15 | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "Uninstall $($sel.Count) app(s)?`n`n$names")) { return }
        Invoke-BatAsync -Title "Uninstall $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'uninstall' } `
            -OnDone $reloadInstalled
    })

    # ---- update
    $reloadUpd = {
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Load installed apps' -ArgumentList @($mode) `
            -Work { param($mode) Get-BatInstalled -Mode $mode } `
            -OnDone {
                param($r)
                Set-BatGrid $BatUI.GridUpd (ConvertTo-BatItems $r)
                Set-BatGridFilter $BatUI.GridUpd $BatUI.TxtFilterUpd.Text
                $n = @(@($BatUI.GridUpd.ItemsSource) | Where-Object { $_.Available }).Count
                Write-BatLog "$n app(s) have an update available" 'OK'
            }
    }
    $u.BtnLoadUpd.Add_Click($reloadUpd)
    $u.BtnSelectUpd.Add_Click({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = [bool]$i.Available } })
    $u.ChkSelAllUpd.Add_Checked({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = $true } })
    $u.ChkSelAllUpd.Add_Unchecked({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = $false } })
    $u.TxtFilterUpd.Add_TextChanged({ Set-BatGridFilter $BatUI.GridUpd $BatUI.TxtFilterUpd.Text })
    $u.BtnUpdSel.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridUpd)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        Invoke-BatAsync -Title "Update $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'upgrade' } `
            -OnDone $reloadUpd
    })
    $u.BtnUpdAll.Add_Click({
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Update ALL' -ArgumentList @($mode) `
            -Work { param($mode) Update-BatAll -Mode $mode } `
            -OnDone $reloadUpd
    })

    # ---- clean
    $u.RbByCat.Add_Checked({ if ($global:Bat.CleanItems) { Show-BatCleanGroups } })
    $u.RbByTime.Add_Checked({ if ($global:Bat.CleanItems) { Show-BatCleanGroups } })
    $u.BtnQuickClean.Add_Click({ Start-BatClean -QuickOnly })
    $u.BtnDeepClean.Add_Click({ Start-BatClean })
    $u.BtnSafeDefaults.Add_Click({ foreach ($i in (Get-BatCleanItems)) { $i.Checked = ($i.Data.safe -eq $true) } })
    $u.BtnCleanAll.Add_Click({ foreach ($i in (Get-BatCleanItems)) { $i.Checked = $true } })
    $u.BtnCleanNone.Add_Click({ foreach ($i in (Get-BatCleanItems)) { $i.Checked = $false } })
    $u.BtnAnalyze.Add_Click({
        $ops = @(Get-BatCleanItems | ForEach-Object { $_.Data })
        Invoke-BatAsync -Title 'Analyze sizes' -ArgumentList @(, $ops) `
            -Work { param($ops) Measure-BatOps -Ops $ops } `
            -OnDone {
                param($r)
                $map = @{}
                foreach ($x in @($r)) { if ($x) { $map[$x.Id] = $x } }
                [long]$sum = 0
                foreach ($i in (Get-BatCleanItems)) {
                    $x = $map[$i.Id]
                    if ($x) {
                        if ($x.Measurable) { $i.Size = Format-BatBytes $x.Bytes; $sum += $x.Bytes } else { $i.Size = '-' }
                    }
                }
                foreach ($i in (Get-BatCleanItems)) { $x = $map[$i.Id]; if ($x -and $x.Measurable) { $i.Bytes = [long]$x.Bytes } else { $i.Bytes = 0 } }
                $global:Bat.CleanAnalyzed = $true
                Update-BatCleanCounter
                Write-BatLog ('Total reclaimable (measurable paths): {0}' -f (Format-BatBytes $sum)) 'OK'
            }
    })

    # ---- fixes and dns
    $u.BtnResetWU.Add_Click({
        if (Show-BatConfirm 'Reset Windows Update components now?') { Invoke-BatAsync -Title 'Reset Windows Update' -Work { Reset-BatWindowsUpdate } }
    })
    $u.BtnResetNet.Add_Click({
        if (Show-BatConfirm 'Reset the network stack now? You may briefly lose connection and need a restart.') { Invoke-BatAsync -Title 'Reset Network' -Work { Reset-BatNetwork } }
    })
    $u.BtnRepairSys.Add_Click({
        if (Show-BatConfirm 'Run DISM and SFC now? This can take a long time.') { Invoke-BatAsync -Title 'Scan and Repair System Files' -Work { Repair-BatSystemFiles } }
    })
    $u.CmbDns.Add_SelectionChanged({
        $sel = $BatUI.CmbDns.SelectedItem
        if ($sel) {
            $p = $sel.Tag
            if (@($p.ipv4).Count -eq 0) { $BatUI.DnsInfo.Text = 'DNS servers are taken from your router (DHCP).' }
            else { $BatUI.DnsInfo.Text = 'IPv4: ' + (@($p.ipv4) -join ', ') + $(if (@($p.ipv6).Count) { '     IPv6: ' + (@($p.ipv6) -join ', ') } else { '' }) }
        }
    })
    $u.BtnApplyDns.Add_Click({
        $sel = $BatUI.CmbDns.SelectedItem
        if (-not $sel) { return }
        $p = $sel.Tag
        Invoke-BatAsync -Title "Apply DNS: $($p.name)" -ArgumentList @($p.name, @($p.ipv4), @($p.ipv6)) `
            -Work { param($n, $v4, $v6) Set-BatDns -Name $n -IPv4 $v4 -IPv6 $v6 }
    })

    # ---- debloat
    $u.BtnScanBloat.Add_Click({ Start-BatBloatScan })
    $u.TxtFilterBloat.Add_TextChanged({ Set-BatGridFilter $BatUI.GridBloat $BatUI.TxtFilterBloat.Text })
    $u.BtnRestoreBloat.Add_Click({ Invoke-BatAsync -Title 'Create restore point' -Work { New-BatRestorePoint -Description 'BAT TOOLKIT before debloat' } })
    $u.BtnExportBloat.Add_Click({
        $sel = @(Get-BatChecked $BatUI.GridBloat | ForEach-Object { [pscustomobject]@{ name = $_.Name; package = $_.Id } })
        if ($sel.Count -eq 0) { Write-BatLog 'Tick the apps you want in the preset first' 'WARN'; return }
        $dlg = New-Object System.Windows.Forms.SaveFileDialog
        $dlg.Filter = 'JSON (*.json)|*.json'
        $dlg.FileName = 'bat-debloat-preset.json'
        if ($dlg.ShowDialog() -eq 'OK') {
            ConvertTo-Json -InputObject @($sel) | Set-Content -LiteralPath $dlg.FileName -Encoding UTF8
            Write-BatLog "Preset saved: $($sel.Count) app(s) -> $($dlg.FileName)" 'OK'
        }
    })
    $u.BtnImportBloat.Add_Click({
        $dlg = New-Object System.Windows.Forms.OpenFileDialog
        $dlg.Filter = 'JSON (*.json)|*.json'
        if ($dlg.ShowDialog() -ne 'OK') { return }
        try { $ids = @(Get-Content -LiteralPath $dlg.FileName -Raw -Encoding UTF8 | ConvertFrom-Json | ForEach-Object { [string]$_.package }) }
        catch { Write-BatLog "Import failed: $($_.Exception.Message)" 'ERR'; return }
        if (@($BatUI.GridBloat.ItemsSource).Count -eq 0) { $global:Bat.PendingPreset = $ids; Start-BatBloatScan }
        else { Set-BatBloatPreset $ids }
    })

    # ---- tweaks
    $u.BtnRestoreTweaks.Add_Click({ Invoke-BatAsync -Title 'Create restore point' -Work { New-BatRestorePoint -Description 'BAT TOOLKIT manual' } })
    $u.BtnTweakScan.Add_Click({ Start-BatTweakScan -SelectApplied })
    $u.BtnPresetStandard.Add_Click({ Set-BatTweakPreset 'Standard' })
    $u.BtnPresetMinimal.Add_Click({ Set-BatTweakPreset 'Minimal' })
    $u.BtnPresetAdvanced.Add_Click({ Set-BatTweakPreset 'Advanced' })
    $u.BtnPresetClear.Add_Click({ foreach ($i in (Get-BatTweakItems)) { $i.Checked = $false } })
    $u.BtnPresetAppx.Add_Click({ Show-BatPage 'Debloat' })
    $u.BtnApplyTweaks.Add_Click({ Start-BatTweakAction -Mode 'Apply' })
    $u.BtnUndoTweaks.Add_Click({ Start-BatTweakAction -Mode 'Undo' })
    $u.BtnTickSafe.Add_Click({ foreach ($i in @($BatUI.GridBloat.ItemsSource)) { $i.Checked = ($i.Risk -eq 'Safe') } })
    $u.BtnRemoveBloat.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridBloat)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        $names = ($sel | Select-Object -First 20 | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "Remove $($sel.Count) Windows app(s) for all users?`n`n$names")) { return }
        Invoke-BatAsync -Title "Remove $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Remove-BatAppx -Items $items } `
            -OnDone { param($r) Start-BatBloatScan }
    })
}

# ------------------------------------------------------------- start
function Start-BatApp {
    Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Windows.Forms
    Initialize-BatCore
    Initialize-BatTypes

    $xaml = Get-BatResource 'MainWindow.xaml'
    try { $win = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader ([xml]$xaml))) }
    catch {
        $ex = $_.Exception
        while ($ex.InnerException) { $ex = $ex.InnerException }
        [void][System.Windows.MessageBox]::Show("The window could not be loaded:`n`n$($ex.Message)", 'BAT TOOLKIT', 'OK', 'Error')
        Write-Host "XAML load failed: $($ex.Message)" -ForegroundColor Red
        return
    }
    foreach ($m in [regex]::Matches($xaml, 'x:Name="([^"]+)"')) {
        $n = $m.Groups[1].Value
        $el = $win.FindName($n)
        if ($el) { $global:BatUI[$n] = $el }
    }

    Start-BatLogPump
    Build-BatCatalog
    Build-BatClean
    Build-BatTweaks
    foreach ($p in @((Get-BatResource 'dns.json' | ConvertFrom-Json).providers)) {
        $item = New-Object System.Windows.Controls.ComboBoxItem
        $item.Content = $p.name
        $item.Tag = $p
        [void]$global:BatUI.CmbDns.Items.Add($item)
    }
    $global:BatUI.CmbDns.SelectedIndex = 0
    Register-BatHandlers
    Update-BatPmStatus
    Set-BatSidebar $true -Instant
    $saved = Get-BatSettings
    if ($saved -and $saved.accent) { $global:Bat.Accent = [string]$saved.accent }
    Set-BatTheme $(if ($saved -and $saved.theme) { [string]$saved.theme } else { $null }) -NoSave
    Show-BatPage 'Install'
    Write-BatLog "BAT TOOLKIT $($global:Bat.Version) ready - log file: $($Sync.LogFile)" 'OK'

    $win.Dispatcher.Add_UnhandledException({ param($s, $e) Write-BatLog "UI error: $($e.Exception.Message)" 'ERR'; $e.Handled = $true })
    $win.Add_Closing({ if ($global:Bat.LogTimer) { $global:Bat.LogTimer.Stop() } })
    [void]$win.ShowDialog()
}

function Start-BatToolkit {
    Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase, System.Windows.Forms
    $isAdmin = Test-BatAdmin
    $canRelaunch = ($global:BatEntry -and (Test-Path -LiteralPath $global:BatEntry))

    # Elevation needs a fresh process. The copy opens its own console window that works as a live
    # log monitor next to the tool window. Set BAT_QUIET=1 to hide that console, BAT_DEBUG=1 to
    # skip the relaunch.
    if ($canRelaunch -and -not $global:BatChild -and -not $env:BAT_DEBUG) {
        try {
            $exe = (Get-Process -Id $PID).Path
            $argList = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-STA', '-File', ('"{0}"' -f $global:BatEntry), '--child')
            $style = 'Normal'
            if ($env:BAT_QUIET) { $style = 'Hidden' }
            if ($isAdmin) { Start-Process -FilePath $exe -ArgumentList $argList -WindowStyle $style -ErrorAction Stop }
            else { Start-Process -FilePath $exe -ArgumentList $argList -Verb RunAs -WindowStyle $style -ErrorAction Stop }
        }
        catch {
            [void][System.Windows.MessageBox]::Show('BAT TOOLKIT needs Administrator permission. The request was declined or failed.', 'BAT TOOLKIT', 'OK', 'Warning')
        }
        return
    }
    if (-not $isAdmin) {
        [void][System.Windows.MessageBox]::Show('BAT TOOLKIT must run as Administrator. Open PowerShell as admin and run it again.', 'BAT TOOLKIT', 'OK', 'Warning')
        return
    }
    if (-not $env:BAT_QUIET) {
        try { $Host.UI.RawUI.WindowTitle = 'BAT TOOLKIT - live log' } catch { }
        Write-Host ''
        Write-Host '  BAT TOOLKIT - live log' -ForegroundColor Cyan
        Write-Host '  Every operation is printed here as it runs. Closing this window closes the tool.' -ForegroundColor DarkGray
        Write-Host ''
    }
    try { Start-BatApp }
    catch {
        $msg = $_.Exception.Message
        try { [IO.File]::AppendAllText((Join-Path $env:TEMP 'BatToolkit-error.log'), ("{0}  {1}`r`n{2}`r`n" -f (Get-Date), $msg, $_.ScriptStackTrace)) } catch { }
        [void][System.Windows.MessageBox]::Show("BAT TOOLKIT stopped:`n`n$msg", 'BAT TOOLKIT', 'OK', 'Error')
    }
    # The window opened by the relaunch stays so the session log can be read after the tool closes
    if ($global:BatChild -and -not $env:BAT_QUIET) {
        Write-Host ''
        Write-Host ("  Session ended. Log file: {0}" -f $Sync.LogFile) -ForegroundColor DarkGray
        try { [void](Read-Host '  Press Enter to close this window') } catch { }
    }
}

