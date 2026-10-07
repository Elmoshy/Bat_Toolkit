# BAT TOOLKIT - Specification v0.2

PowerShell + WPF toolkit to manage Windows from one place. Tweaks is paused.

## Architecture (3 layers, one lost file never kills the project)
- `src/Data`   JSON only: apps.json (catalog), cleanup.json (cleanup operations), bloatware.json, dns.json
- `src/Logic`  PowerShell functions named `*-Bat*` (Core, Apps, Update, Clean, Fixes, Debloat). No UI code.
- `src/UI`     MainWindow.xaml (layout + theme tokens) and Gui.ps1 (event glue only)
- `Build.ps1`  merges everything into `dist/BatToolkit.ps1` (single file for `irm | iex`). Source stays in Git.
- `Dev.ps1`    runs straight from `src` while developing

Header: no terminal buttons, the LOG at the bottom is the only live view (it also writes a session log file).

Theme: palette Driftwood pearl morning (#BC7B6F #5A322A #E4A499 #718A9E #CCCDC7), all tokens in Window.Resources of MainWindow.xaml.

Rules: long work always runs in a background runspace (UI never freezes); every command and result goes to the LOG; one operation at a time.

## Sections
1. Install Apps: source = Winget / Chocolatey / Both merged (missing managers can be installed from the toolbar).
   Tabs: Search (table + Install Selected), Popular Apps (categories, Selected Apps panel, Show Installed, Clear, Export, Import), Uninstall (Load Installed, filter, Uninstall Selected).
2. Update Apps: Load Installed, Select Updateable, Select all, Update Selected, Update ALL. Columns Name / ID / Version / Available / Source.
3. Clean C: operations live in cleanup.json (49 now). Each entry has id, group, name, desc, risk (Safe / Moderate / Careful), safe (default flag), speed (Instant / Seconds / Minutes / Long) and either paths[] or a named special handler, plus optional services[] to stop and restart.
   Groups: Quick, System, Advanced, Dead files (chkdsk leftovers, old logs, broken shortcuts, upgrade leftovers) and Optimize (drive TRIM or defrag, font cache rebuild, oldest restore point).
   The page shows collapsible expanders with a group checkbox and can regroup by Category or by How long it takes.
   Buttons: Quick Clean, Analyze Sizes, Safe Defaults, Select All / None, Start Deep Clean. Careful operations ask for confirmation.
4. Fixes and DNS: Reset Windows Update, Reset Network, DISM + SFC, DNS provider picker (Automatic, Google, Cloudflare x3, AdGuard x2, Quad9, OpenDNS, CleanBrowsing) applied to every active physical adapter.
5. Debloat: scan installed Appx packages against bloatware.json, tick Safe defaults, remove for all users and from the provisioning list.

## Safety rules
- Cleanup deletes the CONTENTS of known folders or exact file patterns, never a drive root, Windows, System32, WinSxS, user profile, Program Files, ProgramData, AppData roots (see Test-BatSafePath).
- Browser cleaning touches cache folders only (no history, passwords, cookies).
- Debloat has a hard protection list (Store, App Installer, Shell experience, Terminal, runtimes) that cannot be removed even if selected.
- Risk levels are shown in every grid; Careful items need a confirmation dialog.

## Data growth
Add apps, operations, bloat entries or DNS providers by editing the JSON only. No UI or logic change needed.

## Next
- Tweaks section (with undo) when un-paused
- Per-item progress in Install / Update
- Pester tests for parsers and the safe path guard
- Per-operation size analysis for special handlers
- Theme colors (single place: Window.Resources in MainWindow.xaml)
