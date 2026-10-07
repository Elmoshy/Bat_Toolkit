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
    public bool Checked { get { return _checked; } set { _checked = value; Notify("Checked"); } }
    public string Size { get { return _size; } set { _size = value; Notify("Size"); } }
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

function Get-BatSavedTheme {
    try {
        $p = Get-BatSettingsPath
        if (Test-Path -LiteralPath $p) {
            $s = Get-Content -LiteralPath $p -Raw | ConvertFrom-Json
            if ($s.theme) { return [string]$s.theme }
        }
    }
    catch { }
    return $null
}

function Save-BatTheme {
    param([string]$Name)
    try {
        $p = Get-BatSettingsPath
        $dir = Split-Path -Path $p -Parent
        if (-not (Test-Path -LiteralPath $dir)) { [void](New-Item -ItemType Directory -Path $dir -Force) }
        (@{ theme = $Name } | ConvertTo-Json) | Set-Content -LiteralPath $p -Encoding UTF8
    }
    catch { }
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
    if ($Name -eq 'dark') { $BatUI.ThemeIcon.Text = [string][char]0x2600; $BatUI.LblTheme.Text = 'Light theme' }
    else { $BatUI.ThemeIcon.Text = [string][char]0x263E; $BatUI.LblTheme.Text = 'Dark theme' }
    if (-not $NoSave) { Save-BatTheme $Name }
}

function Set-BatSidebar {
    param([bool]$Collapsed)
    $global:Bat.Collapsed = $Collapsed
    $vis = if ($Collapsed) { 'Collapsed' } else { 'Visible' }
    foreach ($n in 'SideTitle', 'LblInstall', 'LblUpdate', 'LblClean', 'LblTweaks', 'LblFixes', 'LblDebloat', 'LblTheme') { $BatUI[$n].Visibility = $vis }
    $anim = New-Object System.Windows.Media.Animation.DoubleAnimation
    $anim.To = $(if ($Collapsed) { 66 } else { 236 })
    $anim.Duration = [TimeSpan]::FromMilliseconds(160)
    $BatUI.Sidebar.BeginAnimation([System.Windows.FrameworkElement]::WidthProperty, $anim)
    Update-BatDriveInfo
}

function Show-BatPage {
    param([string]$Name)
    $pages = @{
        Install = @('PageInstall', 'NavInstall', 'Install & Manage Apps', 'Search pick from catalog or uninstall installed software')
        Update  = @('PageUpdate', 'NavUpdate', 'Update Apps', 'Update installed programs from Winget and Chocolatey')
        Clean   = @('PageClean', 'NavClean', 'Clean C:', 'Quick, System, Advanced, Dead files and Optimize - every operation is explicit and optional')
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
function Update-BatSelectedList {
    $BatUI.SelectedList.Items.Clear()
    foreach ($cb in $global:Bat.CatalogBoxes) {
        if ($cb.IsChecked) { [void]$BatUI.SelectedList.Items.Add($cb.Tag.name) }
    }
    $BatUI.SelectedHeader.Text = "Selected Apps ($($BatUI.SelectedList.Items.Count))"
}

function Build-BatCatalog {
    $catalog = Get-BatResource 'apps.json' | ConvertFrom-Json
    $global:Bat.CatalogBoxes.Clear()
    $BatUI.CatalogPanel.Children.Clear()
    foreach ($cat in $catalog.categories) {
        $exp = New-Object System.Windows.Controls.Expander
        $exp.Header = "$($cat.name)  ($(@($cat.apps).Count))"
        $exp.IsExpanded = ($cat.name -eq 'Essentials')
        $wrap = New-Object System.Windows.Controls.WrapPanel
        $wrap.Margin = '18,6,0,6'
        foreach ($app in $cat.apps) {
            $cb = New-Object System.Windows.Controls.CheckBox
            $cb.Content = $app.name
            $cb.Tag = $app
            $cb.ToolTip = $app.desc
            $cb.Width = 230
            $cb.Margin = '0,3,10,3'
            $cb.Add_Checked({ Update-BatSelectedList })
            $cb.Add_Unchecked({ Update-BatSelectedList })
            [void]$global:Bat.CatalogBoxes.Add($cb)
            [void]$wrap.Children.Add($cb)
        }
        $exp.Content = $wrap
        [void]$BatUI.CatalogPanel.Children.Add($exp)
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

function Show-BatCleanGroups {
    $panel = $BatUI.CleanHost
    $panel.Children.Clear()
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

        $hdr = New-Object System.Windows.Controls.StackPanel
        $hdr.Orientation = 'Horizontal'
        $chk = New-Object System.Windows.Controls.CheckBox
        $chk.VerticalAlignment = 'Center'
        $chk.Margin = '0,0,10,0'
        $chk.ToolTip = 'Tick or untick the whole group'
        $chk.IsChecked = (@($items | Where-Object { -not $_.Checked }).Count -eq 0)
        $chk.Tag = $list
        $chk.Add_Click({
            param($s, $e)
            foreach ($i in $s.Tag) { $i.Checked = [bool]$s.IsChecked }
        })
        $txt = New-Object System.Windows.Controls.TextBlock
        $txt.Text = ('{0}   ({1})' -f $labels[$g], $items.Count)
        $txt.FontWeight = 'SemiBold'
        $txt.VerticalAlignment = 'Center'
        [void]$hdr.Children.Add($chk)
        [void]$hdr.Children.Add($txt)

        $ic = New-Object System.Windows.Controls.ItemsControl
        $ic.ItemsSource = $list
        $ic.ItemTemplate = $template
        $ic.Margin = '28,10,4,4'

        $exp = New-Object System.Windows.Controls.Expander
        $exp.Header = $hdr
        $exp.Content = $ic
        $exp.IsExpanded = $first
        $first = $false
        [void]$panel.Children.Add($exp)
    }
}

function Build-BatClean {
    $ops = @((Get-BatResource 'cleanup.json' | ConvertFrom-Json).operations)
    $global:Bat.CleanItems = New-Object System.Collections.ArrayList
    foreach ($o in $ops) {
        $i = New-Object BatItem
        $i.Id = $o.id; $i.Name = $o.name; $i.Desc = $o.desc; $i.Risk = $o.risk
        $i.Group = $o.group; $i.Data = $o; $i.Size = ''
        $i.Speed = $(if ($o.speed) { [string]$o.speed } else { 'Seconds' })
        $i.Checked = (($o.group -ne 'Advanced') -and [bool]$o.safe)
        [void]$global:Bat.CleanItems.Add($i)
    }
    Show-BatCleanGroups
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

    # sidebar + navigation
    $u.BtnToggle.Add_Click({ Set-BatSidebar (-not $global:Bat.Collapsed) })
    $u.NavInstall.Add_Click({ Show-BatPage 'Install' })
    $u.NavUpdate.Add_Click({ Show-BatPage 'Update' })
    $u.NavClean.Add_Click({ Show-BatPage 'Clean' })
    $u.NavFixes.Add_Click({ Show-BatPage 'Fixes' })
    $u.NavDebloat.Add_Click({ Show-BatPage 'Debloat' })

    # shared
    $u.BtnTheme.Add_Click({ Set-BatTheme $(if ($global:Bat.Theme -eq 'dark') { 'light' } else { 'dark' }) })
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
    $u.BtnLoadInstalled.Add_Click({
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Load installed apps' -ArgumentList @($mode) `
            -Work { param($mode) Get-BatInstalled -Mode $mode } `
            -OnDone { param($r) Set-BatGrid $BatUI.GridInstalled (ConvertTo-BatItems $r); Write-BatLog ("{0} item(s) loaded" -f @($r).Count) 'OK' }
    })
    $u.TxtFilterInstalled.Add_TextChanged({ Set-BatGridFilter $BatUI.GridInstalled $BatUI.TxtFilterInstalled.Text })
    $u.BtnUninstall.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridInstalled)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        $names = ($sel | Select-Object -First 15 | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "Uninstall $($sel.Count) app(s)?`n`n$names")) { return }
        Invoke-BatAsync -Title "Uninstall $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'uninstall' }
    })

    # ---- update
    $u.BtnLoadUpd.Add_Click({
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Load installed apps' -ArgumentList @($mode) `
            -Work { param($mode) Get-BatInstalled -Mode $mode } `
            -OnDone {
                param($r)
                Set-BatGrid $BatUI.GridUpd (ConvertTo-BatItems $r)
                $n = @(@($BatUI.GridUpd.ItemsSource) | Where-Object { $_.Available }).Count
                Write-BatLog "$n app(s) have an update available" 'OK'
            }
    })
    $u.BtnSelectUpd.Add_Click({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = [bool]$i.Available } })
    $u.ChkSelAllUpd.Add_Checked({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = $true } })
    $u.ChkSelAllUpd.Add_Unchecked({ foreach ($i in @($BatUI.GridUpd.ItemsSource)) { $i.Checked = $false } })
    $u.TxtFilterUpd.Add_TextChanged({ Set-BatGridFilter $BatUI.GridUpd $BatUI.TxtFilterUpd.Text })
    $u.BtnUpdSel.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridUpd)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        Invoke-BatAsync -Title "Update $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Invoke-BatPackageOps -Items $items -Action 'upgrade' }
    })
    $u.BtnUpdAll.Add_Click({
        $mode = Get-BatMode
        if (-not (Test-BatModeReady $mode)) { return }
        Invoke-BatAsync -Title 'Update ALL' -ArgumentList @($mode) -Work { param($mode) Update-BatAll -Mode $mode }
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
    $u.BtnScanBloat.Add_Click({
        $entries = @((Get-BatResource 'bloatware.json' | ConvertFrom-Json).entries)
        Invoke-BatAsync -Title 'Scan installed bloatware' -ArgumentList @(, $entries) `
            -Work { param($entries) Find-BatBloat -Entries $entries } `
            -OnDone { param($r) Set-BatGrid $BatUI.GridBloat (ConvertTo-BatItems $r | ForEach-Object { $_ }); Write-BatLog ("{0} package(s) found" -f @($r).Count) 'OK' }
    })
    $u.BtnTickSafe.Add_Click({ foreach ($i in @($BatUI.GridBloat.ItemsSource)) { $i.Checked = ($i.Risk -eq 'Safe') } })
    $u.BtnRemoveBloat.Add_Click({
        $sel = ConvertTo-BatPkgItems (Get-BatChecked $BatUI.GridBloat)
        if ($sel.Count -eq 0) { Write-BatLog 'Select at least one app first' 'WARN'; return }
        $names = ($sel | Select-Object -First 20 | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "Remove $($sel.Count) Windows app(s) for all users?`n`n$names")) { return }
        Invoke-BatAsync -Title "Remove $($sel.Count) app(s)" -ArgumentList @(, $sel) `
            -Work { param($items) Remove-BatAppx -Items $items }
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
    foreach ($p in @((Get-BatResource 'dns.json' | ConvertFrom-Json).providers)) {
        $item = New-Object System.Windows.Controls.ComboBoxItem
        $item.Content = $p.name
        $item.Tag = $p
        [void]$global:BatUI.CmbDns.Items.Add($item)
    }
    $global:BatUI.CmbDns.SelectedIndex = 0
    Register-BatHandlers
    Update-BatPmStatus
    Update-BatDriveInfo
    Set-BatTheme (Get-BatSavedTheme) -NoSave
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

    # Open a fresh hidden copy (elevated when needed) so the console you started from is released
    # and only the tool window stays. Set BAT_DEBUG=1 to keep the console visible.
    if ($canRelaunch -and -not $global:BatChild -and -not $env:BAT_DEBUG) {
        try {
            $exe = (Get-Process -Id $PID).Path
            $argList = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-STA', '-WindowStyle', 'Hidden', '-File', ('"{0}"' -f $global:BatEntry), '--child')
            if ($isAdmin) { Start-Process -FilePath $exe -ArgumentList $argList -WindowStyle Hidden -ErrorAction Stop }
            else { Start-Process -FilePath $exe -ArgumentList $argList -Verb RunAs -WindowStyle Hidden -ErrorAction Stop }
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
    try { Start-BatApp }
    catch {
        $msg = $_.Exception.Message
        try { [IO.File]::AppendAllText((Join-Path $env:TEMP 'BatToolkit-error.log'), ("{0}  {1}`r`n{2}`r`n" -f (Get-Date), $msg, $_.ScriptStackTrace)) } catch { }
        [void][System.Windows.MessageBox]::Show("BAT TOOLKIT stopped:`n`n$msg", 'BAT TOOLKIT', 'OK', 'Error')
    }
}
