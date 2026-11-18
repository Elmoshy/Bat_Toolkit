# BAT TOOLKIT - compiled single file build. Do not edit: edit src and run Build.ps1
$global:BatEmbedded = @{}
$global:BatEntry = $PSCommandPath
$global:BatChild = ($args -contains '--child')
$global:BatEmbedded['apps.json'] = @'
{
  "categories": [
    { "name": "Essentials", "apps": [
      {"name":"7-Zip","winget":"7zip.7zip","choco":"7zip","desc":"File archiver"},
      {"name":"VLC media player","winget":"VideoLAN.VLC","choco":"vlc","desc":"Plays almost any media"},
      {"name":"Notepad++","winget":"Notepad++.Notepad++","choco":"notepadplusplus","desc":"Text and code editor"},
      {"name":"Everything","winget":"voidtools.Everything","choco":"everything","desc":"Instant file search"},
      {"name":"SumatraPDF","winget":"SumatraPDF.SumatraPDF","choco":"sumatrapdf","desc":"Light PDF reader"},
      {"name":"PowerToys","winget":"Microsoft.PowerToys","choco":"powertoys","desc":"Microsoft power user tools"},
      {"name":"Bitwarden","winget":"Bitwarden.Bitwarden","choco":"bitwarden","desc":"Password manager"},
      {"name":"WinRAR","winget":"RARLab.WinRAR","choco":"winrar","desc":"Archiver"},
      {"name":"ShareX","winget":"ShareX.ShareX","choco":"sharex","desc":"Screenshots and screen recording"},
      {"name":"qBittorrent","winget":"qBittorrent.qBittorrent","choco":"qbittorrent","desc":"Torrent client"}
    ]},
    { "name": "Browsers", "apps": [
      {"name":"Google Chrome","winget":"Google.Chrome","choco":"googlechrome","desc":"Web browser"},
      {"name":"Mozilla Firefox","winget":"Mozilla.Firefox","choco":"firefox","desc":"Web browser"},
      {"name":"Brave","winget":"Brave.Brave","choco":"brave","desc":"Privacy focused browser"},
      {"name":"Opera","winget":"Opera.Opera","choco":"opera","desc":"Web browser"},
      {"name":"Vivaldi","winget":"Vivaldi.Vivaldi","choco":"vivaldi","desc":"Customizable browser"},
      {"name":"Tor Browser","winget":"TorProject.TorBrowser","choco":"tor-browser","desc":"Anonymous browsing"}
    ]},
    { "name": "Development", "apps": [
      {"name":"Visual Studio Code","winget":"Microsoft.VisualStudioCode","choco":"vscode","desc":"Code editor"},
      {"name":"Git","winget":"Git.Git","choco":"git","desc":"Version control"},
      {"name":"GitHub Desktop","winget":"GitHub.GitHubDesktop","choco":"github-desktop","desc":"Git GUI"},
      {"name":"Python 3.12","winget":"Python.Python.3.12","choco":"python312","desc":"Python runtime"},
      {"name":"Node.js LTS","winget":"OpenJS.NodeJS.LTS","choco":"nodejs-lts","desc":"JavaScript runtime"},
      {"name":"PowerShell 7","winget":"Microsoft.PowerShell","choco":"powershell-core","desc":"Modern PowerShell"},
      {"name":"Windows Terminal","winget":"Microsoft.WindowsTerminal","choco":"microsoft-windows-terminal","desc":"Terminal app"},
      {"name":"Docker Desktop","winget":"Docker.DockerDesktop","choco":"docker-desktop","desc":"Containers"},
      {"name":"Postman","winget":"Postman.Postman","choco":"postman","desc":"API testing"},
      {"name":"DBeaver","winget":"DBeaver.DBeaver.Community","choco":"dbeaver","desc":"Database client"},
      {"name":"IntelliJ IDEA Community","winget":"JetBrains.IntelliJIDEA.Community","choco":"intellijidea-community","desc":"Java IDE"},
      {"name":"Temurin JDK 21","winget":"EclipseAdoptium.Temurin.21.JDK","choco":"temurin21","desc":"Java JDK"},
      {"name":".NET SDK 8","winget":"Microsoft.DotNet.SDK.8","choco":"dotnet-8.0-sdk","desc":".NET SDK"},
      {"name":"Go","winget":"GoLang.Go","choco":"golang","desc":"Go language"},
      {"name":"WinSCP","winget":"WinSCP.WinSCP","choco":"winscp","desc":"SFTP and SCP client"},
      {"name":"PuTTY","winget":"PuTTY.PuTTY","choco":"putty","desc":"SSH client"},
      {"name":"WinMerge","winget":"WinMerge.WinMerge","choco":"winmerge","desc":"Diff and merge"}
    ]},
    { "name": "Utilities", "apps": [
      {"name":"WinDirStat","winget":"WinDirStat.WinDirStat","choco":"windirstat","desc":"Disk usage viewer"},
      {"name":"CPU-Z","winget":"CPUID.CPU-Z","choco":"cpu-z","desc":"Hardware info"},
      {"name":"HWMonitor","winget":"CPUID.HWMonitor","choco":"hwmonitor","desc":"Hardware sensors"},
      {"name":"Rufus","winget":"Rufus.Rufus","choco":"rufus","desc":"Bootable USB creator"},
      {"name":"Balena Etcher","winget":"Balena.Etcher","choco":"etcher","desc":"Flash images to USB"},
      {"name":"AutoHotkey","winget":"AutoHotkey.AutoHotkey","choco":"autohotkey","desc":"Automation scripting"},
      {"name":"MSI Afterburner","winget":"Guru3D.Afterburner","choco":"msiafterburner","desc":"GPU tuning"},
      {"name":"TeamViewer","winget":"TeamViewer.TeamViewer","choco":"teamviewer","desc":"Remote access"},
      {"name":"AnyDesk","winget":"AnyDesk.AnyDesk","choco":"anydesk","desc":"Remote access"}
    ]},
    { "name": "Communications", "apps": [
      {"name":"Discord","winget":"Discord.Discord","choco":"discord","desc":"Chat and voice"},
      {"name":"Telegram","winget":"Telegram.TelegramDesktop","choco":"telegram","desc":"Messenger"},
      {"name":"WhatsApp","winget":"WhatsApp.WhatsApp","choco":"whatsapp","desc":"Messenger"},
      {"name":"Zoom","winget":"Zoom.Zoom","choco":"zoom","desc":"Video meetings"},
      {"name":"Microsoft Teams","winget":"Microsoft.Teams","choco":"microsoft-teams","desc":"Meetings and chat"},
      {"name":"Slack","winget":"SlackTechnologies.Slack","choco":"slack","desc":"Team chat"},
      {"name":"Thunderbird","winget":"Mozilla.Thunderbird","choco":"thunderbird","desc":"Email client"}
    ]},
    { "name": "Documents", "apps": [
      {"name":"Adobe Acrobat Reader","winget":"Adobe.Acrobat.Reader.64-bit","choco":"adobereader","desc":"PDF reader"},
      {"name":"LibreOffice","winget":"TheDocumentFoundation.LibreOffice","choco":"libreoffice-fresh","desc":"Office suite"},
      {"name":"Foxit PDF Reader","winget":"Foxit.FoxitReader","choco":"foxitreader","desc":"PDF reader"},
      {"name":"Obsidian","winget":"Obsidian.Obsidian","choco":"obsidian","desc":"Markdown notes"},
      {"name":"Notion","winget":"Notion.Notion","choco":"notion","desc":"Notes and workspace"},
      {"name":"Calibre","winget":"calibre.calibre","choco":"calibre","desc":"Ebook manager"}
    ]},
    { "name": "Multimedia", "apps": [
      {"name":"OBS Studio","winget":"OBSProject.OBSStudio","choco":"obs-studio","desc":"Recording and streaming"},
      {"name":"Audacity","winget":"Audacity.Audacity","choco":"audacity","desc":"Audio editor"},
      {"name":"Spotify","winget":"Spotify.Spotify","choco":"spotify","desc":"Music streaming"},
      {"name":"HandBrake","winget":"HandBrake.HandBrake","choco":"handbrake","desc":"Video transcoder"},
      {"name":"GIMP","winget":"GIMP.GIMP","choco":"gimp","desc":"Image editor"},
      {"name":"Inkscape","winget":"Inkscape.Inkscape","choco":"inkscape","desc":"Vector graphics"},
      {"name":"Krita","winget":"KDE.Krita","choco":"krita","desc":"Digital painting"},
      {"name":"Blender","winget":"BlenderFoundation.Blender","choco":"blender","desc":"3D creation"},
      {"name":"Kdenlive","winget":"KDE.Kdenlive","choco":"kdenlive","desc":"Video editor"},
      {"name":"K-Lite Codec Pack Mega","winget":"CodecGuide.K-LiteCodecPack.Mega","choco":"k-litecodecpackmega","desc":"Codecs and player"},
      {"name":"IrfanView","winget":"IrfanSkiljan.IrfanView","choco":"irfanview","desc":"Image viewer"}
    ]},
    { "name": "Gaming", "apps": [
      {"name":"Steam","winget":"Valve.Steam","choco":"steam","desc":"Game store"},
      {"name":"Epic Games Launcher","winget":"EpicGames.EpicGamesLauncher","choco":"epicgameslauncher","desc":"Game store"},
      {"name":"GOG Galaxy","winget":"GOG.Galaxy","choco":"goggalaxy","desc":"Game library"},
      {"name":"EA app","winget":"ElectronicArts.EADesktop","choco":"ea-app","desc":"EA games"},
      {"name":"Ubisoft Connect","winget":"Ubisoft.Connect","choco":"ubisoft-connect","desc":"Ubisoft games"}
    ]},
    { "name": "Runtimes", "apps": [
      {"name":"VC++ 2015-2022 x64","winget":"Microsoft.VCRedist.2015+.x64","choco":"vcredist140","desc":"Visual C++ runtime"},
      {"name":".NET Desktop Runtime 8","winget":"Microsoft.DotNet.DesktopRuntime.8","choco":"dotnet-8.0-desktopruntime","desc":".NET runtime"},
      {"name":"Java Runtime","winget":"Oracle.JavaRuntimeEnvironment","choco":"javaruntime","desc":"Java JRE"},
      {"name":"DirectX End-User Runtime","winget":"Microsoft.DirectX","choco":"directx","desc":"DirectX libraries"},
      {"name":"WebView2 Runtime","winget":"Microsoft.EdgeWebView2Runtime","choco":"webview2-runtime","desc":"Embedded web runtime"}
    ]}
  ]
}
'@
$global:BatEmbedded['bloatware.json'] = @'
{
  "entries": [
    {"name":"Bing News","pattern":"Microsoft.BingNews","risk":"Safe","desc":"News app"},
    {"name":"Bing Weather","pattern":"Microsoft.BingWeather","risk":"Safe","desc":"Weather app"},
    {"name":"Bing Finance","pattern":"Microsoft.BingFinance","risk":"Safe","desc":"Finance app"},
    {"name":"Bing Sports","pattern":"Microsoft.BingSports","risk":"Safe","desc":"Sports app"},
    {"name":"Bing Search","pattern":"Microsoft.BingSearch","risk":"Safe","desc":"Bing search integration"},
    {"name":"Get Help","pattern":"Microsoft.GetHelp","risk":"Safe","desc":"Support app"},
    {"name":"Tips (Get Started)","pattern":"Microsoft.Getstarted","risk":"Safe","desc":"Tips app"},
    {"name":"Microsoft 365 Hub","pattern":"Microsoft.MicrosoftOfficeHub","risk":"Safe","desc":"Office promo hub"},
    {"name":"Solitaire Collection","pattern":"Microsoft.MicrosoftSolitaireCollection","risk":"Safe","desc":"Card games with ads"},
    {"name":"Mixed Reality Portal","pattern":"Microsoft.MixedReality.Portal","risk":"Safe","desc":"VR portal"},
    {"name":"People","pattern":"Microsoft.People","risk":"Safe","desc":"Contacts app"},
    {"name":"Skype","pattern":"Microsoft.SkypeApp","risk":"Safe","desc":"Skype store app"},
    {"name":"Feedback Hub","pattern":"Microsoft.WindowsFeedbackHub","risk":"Safe","desc":"Send feedback to Microsoft"},
    {"name":"Maps","pattern":"Microsoft.WindowsMaps","risk":"Safe","desc":"Maps app"},
    {"name":"Phone Link","pattern":"Microsoft.YourPhone","risk":"Optional","desc":"Connect phone to PC"},
    {"name":"Groove Music","pattern":"Microsoft.ZuneMusic","risk":"Safe","desc":"Music player"},
    {"name":"Movies and TV","pattern":"Microsoft.ZuneVideo","risk":"Safe","desc":"Video player"},
    {"name":"Cortana","pattern":"Microsoft.549981C3F5F10","risk":"Safe","desc":"Old assistant"},
    {"name":"3D Builder","pattern":"Microsoft.3DBuilder","risk":"Safe","desc":"3D tool"},
    {"name":"3D Viewer","pattern":"Microsoft.Microsoft3DViewer","risk":"Safe","desc":"3D viewer"},
    {"name":"Print 3D","pattern":"Microsoft.Print3D","risk":"Safe","desc":"3D print tool"},
    {"name":"OneConnect","pattern":"Microsoft.OneConnect","risk":"Safe","desc":"Mobile plans"},
    {"name":"Wallet","pattern":"Microsoft.Wallet","risk":"Safe","desc":"Payments app"},
    {"name":"Power Automate Desktop","pattern":"Microsoft.PowerAutomateDesktop","risk":"Optional","desc":"Automation tool"},
    {"name":"Microsoft To Do","pattern":"Microsoft.Todos","risk":"Optional","desc":"Task app"},
    {"name":"Clipchamp","pattern":"Clipchamp.Clipchamp","risk":"Optional","desc":"Video editor"},
    {"name":"Teams (personal)","pattern":"MicrosoftTeams","risk":"Optional","desc":"Consumer Teams"},
    {"name":"Teams (new personal)","pattern":"MSTeams","risk":"Optional","desc":"Consumer Teams"},
    {"name":"Copilot app","pattern":"Microsoft.Copilot","risk":"Optional","desc":"AI assistant app"},
    {"name":"Outlook (new)","pattern":"Microsoft.OutlookForWindows","risk":"Optional","desc":"New Outlook app"},
    {"name":"Dev Home","pattern":"Microsoft.Windows.DevHome","risk":"Optional","desc":"Developer dashboard"},
    {"name":"Quick Assist","pattern":"MicrosoftCorporationII.QuickAssist","risk":"Optional","desc":"Remote help tool"},
    {"name":"Mail and Calendar","pattern":"microsoft.windowscommunicationsapps","risk":"Optional","desc":"Built in mail and calendar"},
    {"name":"Sticky Notes","pattern":"Microsoft.MicrosoftStickyNotes","risk":"Careful","desc":"Notes you may use"},
    {"name":"Paint","pattern":"Microsoft.Paint","risk":"Careful","desc":"Paint app"},
    {"name":"Xbox App","pattern":"Microsoft.GamingApp","risk":"Optional","desc":"Xbox PC app"},
    {"name":"Xbox Console Companion","pattern":"Microsoft.XboxApp","risk":"Safe","desc":"Old Xbox app"},
    {"name":"Xbox Game Bar","pattern":"Microsoft.XboxGamingOverlay","risk":"Optional","desc":"Game overlay"},
    {"name":"Xbox Game Overlay","pattern":"Microsoft.XboxGameOverlay","risk":"Optional","desc":"Game overlay"},
    {"name":"Xbox Speech To Text","pattern":"Microsoft.XboxSpeechToTextOverlay","risk":"Safe","desc":"Overlay component"},
    {"name":"Xbox Identity Provider","pattern":"Microsoft.XboxIdentityProvider","risk":"Careful","desc":"Needed by Xbox sign in and some games"},
    {"name":"Xbox TCUI","pattern":"Microsoft.Xbox.TCUI","risk":"Careful","desc":"Xbox UI component"},
    {"name":"Candy Crush","pattern":"*CandyCrush*","risk":"Safe","desc":"Promoted game"},
    {"name":"Disney+","pattern":"*Disney*","risk":"Safe","desc":"Promoted app"},
    {"name":"Spotify (store)","pattern":"SpotifyAB.SpotifyMusic","risk":"Safe","desc":"Promoted app"},
    {"name":"Facebook","pattern":"*Facebook*","risk":"Safe","desc":"Promoted app"},
    {"name":"Instagram","pattern":"*Instagram*","risk":"Safe","desc":"Promoted app"},
    {"name":"TikTok","pattern":"*TikTok*","risk":"Safe","desc":"Promoted app"},
    {"name":"Netflix","pattern":"*Netflix*","risk":"Safe","desc":"Promoted app"},
    {"name":"Twitter","pattern":"*Twitter*","risk":"Safe","desc":"Promoted app"},
    {"name":"LinkedIn","pattern":"*LinkedIn*","risk":"Safe","desc":"Promoted app"},
    {"name":"Amazon Prime Video","pattern":"AmazonVideo.PrimeVideo","risk":"Safe","desc":"Promoted app"},
    {"name":"Amazon Alexa","pattern":"*AmazonAlexa*","risk":"Safe","desc":"Promoted app"},
    {"name":"McAfee","pattern":"*McAfee*","risk":"Safe","desc":"Trial antivirus"},
    {"name":"Dropbox promo","pattern":"*DropboxOEM*","risk":"Safe","desc":"Promoted app"},
    {"name":"Duolingo","pattern":"*Duolingo*","risk":"Safe","desc":"Promoted app"},
    {"name":"Flipboard","pattern":"*Flipboard*","risk":"Safe","desc":"Promoted app"},
    {"name":"Pandora","pattern":"*Pandora*","risk":"Safe","desc":"Promoted app"},
    {"name":"Photoshop Express","pattern":"*PhotoshopExpress*","risk":"Safe","desc":"Promoted app"},
    {"name":"Eclipse Manager","pattern":"*EclipseManager*","risk":"Safe","desc":"Promoted app"},
    {"name":"Actipro","pattern":"*ActiproSoftware*","risk":"Safe","desc":"Promoted app"}
  ]
}
'@
$global:BatEmbedded['cleanup.json'] = @'
{
  "operations": [
    {"id":"user-temp","group":"Quick","name":"User temp files","desc":"Temporary files in your TEMP folder","risk":"Safe","safe":true,"speed":"Seconds","paths":["%TEMP%"]},
    {"id":"system-temp","group":"Quick","name":"System temp files","desc":"Windows\\Temp contents","risk":"Safe","safe":true,"speed":"Seconds","paths":["%SystemRoot%\\Temp"]},
    {"id":"recycle-bin","group":"Quick","name":"Recycle Bin","desc":"Empties the Recycle Bin on all drives","risk":"Safe","safe":true,"speed":"Seconds","special":"RecycleBin"},
    {"id":"thumb-cache","group":"Quick","name":"Thumbnail cache","desc":"Explorer thumbnails are rebuilt when needed","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\Windows\\Explorer\\thumbcache_*.db"]},
    {"id":"icon-cache","group":"Quick","name":"Icon cache","desc":"Icon cache files are rebuilt by Explorer","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\IconCache.db","%LOCALAPPDATA%\\Microsoft\\Windows\\Explorer\\iconcache_*.db"]},
    {"id":"shader-cache","group":"Quick","name":"DirectX and GPU shader cache","desc":"D3D, NVIDIA and AMD shader caches (games rebuild them)","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\D3DSCache","%LOCALAPPDATA%\\NVIDIA\\DXCache","%LOCALAPPDATA%\\NVIDIA\\GLCache","%LOCALAPPDATA%\\AMD\\DxCache","%LOCALAPPDATA%\\AMD\\GLCache"]},
    {"id":"cache-chrome","group":"Quick","name":"Chrome cache","desc":"Cache, code cache and GPU cache only (no passwords or history)","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Google\\Chrome\\User Data\\*\\Cache","%LOCALAPPDATA%\\Google\\Chrome\\User Data\\*\\Code Cache","%LOCALAPPDATA%\\Google\\Chrome\\User Data\\*\\GPUCache"]},
    {"id":"cache-edge","group":"Quick","name":"Edge cache","desc":"Cache, code cache and GPU cache only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\Edge\\User Data\\*\\Cache","%LOCALAPPDATA%\\Microsoft\\Edge\\User Data\\*\\Code Cache","%LOCALAPPDATA%\\Microsoft\\Edge\\User Data\\*\\GPUCache"]},
    {"id":"cache-brave","group":"Quick","name":"Brave cache","desc":"Cache, code cache and GPU cache only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\BraveSoftware\\Brave-Browser\\User Data\\*\\Cache","%LOCALAPPDATA%\\BraveSoftware\\Brave-Browser\\User Data\\*\\Code Cache","%LOCALAPPDATA%\\BraveSoftware\\Brave-Browser\\User Data\\*\\GPUCache"]},
    {"id":"cache-firefox","group":"Quick","name":"Firefox cache","desc":"cache2 folders of all profiles","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Mozilla\\Firefox\\Profiles\\*\\cache2"]},
    {"id":"cache-opera","group":"Quick","name":"Opera cache","desc":"Cache folder of Opera Stable","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Opera Software\\Opera Stable\\Cache"]},
    {"id":"inet-cache","group":"Quick","name":"Internet cache (INetCache)","desc":"Legacy Windows internet cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\Windows\\INetCache"]},
    {"id":"dns-cache","group":"Quick","name":"DNS resolver cache","desc":"Runs ipconfig /flushdns","risk":"Safe","safe":true,"speed":"Instant","special":"FlushDns"},
    {"id":"wu-cache","group":"System","name":"Windows Update download cache","desc":"SoftwareDistribution\\Download (services are stopped then restarted)","risk":"Safe","safe":true,"speed":"Seconds","services":["wuauserv","bits"],"paths":["%SystemRoot%\\SoftwareDistribution\\Download"]},
    {"id":"delivery-opt","group":"System","name":"Delivery Optimization cache","desc":"Peer to peer update cache","risk":"Safe","safe":true,"speed":"Seconds","services":["dosvc"],"paths":["%SystemRoot%\\ServiceProfiles\\NetworkService\\AppData\\Local\\Microsoft\\Windows\\DeliveryOptimization\\Cache","%ProgramData%\\Microsoft\\Windows\\DeliveryOptimization\\Cache"]},
    {"id":"store-cache","group":"System","name":"Microsoft Store cache","desc":"Local cache of the Store app, rebuilt automatically","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\LocalCache"]},
    {"id":"wer","group":"System","name":"Windows Error Reporting","desc":"Archived and queued error reports","risk":"Safe","safe":true,"speed":"Seconds","paths":["%ProgramData%\\Microsoft\\Windows\\WER\\ReportArchive","%ProgramData%\\Microsoft\\Windows\\WER\\ReportQueue","%ProgramData%\\Microsoft\\Windows\\WER\\Temp","%LOCALAPPDATA%\\Microsoft\\Windows\\WER"]},
    {"id":"crash-dumps","group":"System","name":"Crash dumps","desc":"User crash dumps, minidumps and MEMORY.DMP","risk":"Moderate","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\CrashDumps","%SystemRoot%\\Minidump","%SystemRoot%\\MEMORY.DMP","%SystemRoot%\\LiveKernelReports\\*.dmp"]},
    {"id":"setup-logs","group":"System","name":"Setup and DISM logs","desc":"Panther and DISM log files","risk":"Safe","safe":true,"speed":"Seconds","paths":["%SystemRoot%\\Panther\\*.log","%SystemRoot%\\Logs\\DISM\\*.log"]},
    {"id":"servicing-logs","group":"System","name":"Servicing and Windows Update logs","desc":"CBS logs and WindowsUpdate logs","risk":"Safe","safe":true,"speed":"Seconds","paths":["%SystemRoot%\\Logs\\CBS\\*.log","%SystemRoot%\\Logs\\CBS\\*.cab","%SystemRoot%\\Logs\\WindowsUpdate"]},
    {"id":"component-cleanup","group":"Advanced","name":"Component store cleanup (DISM)","desc":"Removes superseded Windows components. Can take several minutes","risk":"Safe","safe":true,"speed":"Long","special":"ComponentCleanup"},
    {"id":"component-resetbase","group":"Advanced","name":"Component store ResetBase","desc":"Deeper cleanup but installed updates can no longer be uninstalled","risk":"Careful","safe":false,"speed":"Long","special":"ResetBase"},
    {"id":"windows-old","group":"Advanced","name":"Previous Windows installation (Windows.old)","desc":"Frees a lot of space but you cannot roll back to the old Windows","risk":"Careful","safe":false,"speed":"Minutes","special":"WindowsOld"},
    {"id":"hibernate-off","group":"Advanced","name":"Disable hibernation (delete hiberfil.sys)","desc":"Frees space equal to a big part of RAM and disables Fast Startup","risk":"Careful","safe":false,"speed":"Instant","special":"HibernateOff"},
    {"id":"event-logs","group":"Advanced","name":"Windows event logs","desc":"Clears all event logs (loses troubleshooting history)","risk":"Moderate","safe":false,"speed":"Seconds","special":"EventLogs"},
    {"id":"recent-items","group":"Advanced","name":"Recent files and jump lists","desc":"Clears recent items history (privacy)","risk":"Moderate","safe":false,"speed":"Seconds","paths":["%APPDATA%\\Microsoft\\Windows\\Recent\\AutomaticDestinations","%APPDATA%\\Microsoft\\Windows\\Recent\\CustomDestinations","%APPDATA%\\Microsoft\\Windows\\Recent\\*.lnk"]},
    {"id":"prefetch","group":"Advanced","name":"Prefetch","desc":"Apps may start a bit slower the first time afterwards","risk":"Moderate","safe":false,"speed":"Seconds","paths":["%SystemRoot%\\Prefetch"]},
    {"id":"dev-npm","group":"Advanced","name":"npm cache","desc":"Node package cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\npm-cache"]},
    {"id":"dev-pip","group":"Advanced","name":"pip cache","desc":"Python package cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\pip\\Cache"]},
    {"id":"dev-nuget","group":"Advanced","name":"NuGet caches","desc":"NuGet v3 and plugin caches","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\NuGet\\v3-cache","%LOCALAPPDATA%\\NuGet\\plugins-cache"]},
    {"id":"dev-gradle","group":"Advanced","name":"Gradle caches","desc":"Downloaded again on next build","risk":"Moderate","safe":false,"speed":"Minutes","paths":["%USERPROFILE%\\.gradle\\caches"]},
    {"id":"app-vscode","group":"Advanced","name":"VS Code cache","desc":"Cache and cached data only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%APPDATA%\\Code\\Cache","%APPDATA%\\Code\\CachedData","%APPDATA%\\Code\\Code Cache","%APPDATA%\\Code\\GPUCache"]},
    {"id":"app-discord","group":"Advanced","name":"Discord cache","desc":"Cache, code cache and GPU cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%APPDATA%\\discord\\Cache","%APPDATA%\\discord\\Code Cache","%APPDATA%\\discord\\GPUCache"]},
    {"id":"app-spotify","group":"Advanced","name":"Spotify cache","desc":"Offline cache is removed too","risk":"Moderate","safe":false,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Spotify\\Storage","%LOCALAPPDATA%\\Spotify\\Data"]},
    {"id":"app-steam-html","group":"Advanced","name":"Steam web cache","desc":"Steam htmlcache only (games are not touched)","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Steam\\htmlcache"]},
    {"id":"app-epic-webcache","group":"Advanced","name":"Epic Games Launcher web cache","desc":"Launcher web cache only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\EpicGamesLauncher\\Saved\\webcache*"]},
    {"id":"app-onedrive-logs","group":"Advanced","name":"OneDrive logs","desc":"Log files only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\OneDrive\\logs"]},
    {"id":"app-zoom-logs","group":"Advanced","name":"Zoom logs","desc":"Old Zoom log files","risk":"Safe","safe":true,"speed":"Seconds","paths":["%APPDATA%\\Zoom\\logs"]},
    {"id":"dead-found-chk","group":"Dead files","name":"Chkdsk recovered fragments","desc":"found.000 style folders left at the drive root by CHKDSK","risk":"Moderate","safe":false,"speed":"Seconds","paths":["%SystemDrive%\\found.*"]},
    {"id":"dead-live-kernel","group":"Dead files","name":"Live kernel reports","desc":"Watchdog and kernel diagnostic dumps","risk":"Safe","safe":true,"speed":"Seconds","paths":["%SystemRoot%\\LiveKernelReports"]},
    {"id":"dead-downloaded-programs","group":"Dead files","name":"Downloaded Program Files","desc":"Legacy ActiveX and Java applet leftovers","risk":"Safe","safe":true,"speed":"Seconds","paths":["%SystemRoot%\\Downloaded Program Files"]},
    {"id":"dead-office-cache","group":"Dead files","name":"Office file cache","desc":"Office upload and document cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\Office\\16.0\\OfficeFileCache"]},
    {"id":"dead-old-logs","group":"Dead files","name":"Old Windows logs (30+ days)","desc":"Only .log and .etl files older than 30 days under Windows\\Logs and Windows\\Temp","risk":"Safe","safe":true,"speed":"Seconds","special":"OldLogs"},
    {"id":"dead-broken-shortcuts","group":"Dead files","name":"Broken shortcuts","desc":"Desktop and Start Menu shortcuts whose target no longer exists (disconnected drives are ignored)","risk":"Moderate","safe":false,"speed":"Seconds","special":"BrokenShortcuts"},
    {"id":"dead-upgrade-leftovers","group":"Dead files","name":"Windows upgrade leftovers","desc":"$WINDOWS.~BT and $WINDOWS.~WS and $WinREAgent setup folders","risk":"Careful","safe":false,"speed":"Minutes","paths":["%SystemDrive%\\$WINDOWS.~BT","%SystemDrive%\\$WINDOWS.~WS","%SystemDrive%\\$WinREAgent"]},
    {"id":"opt-drive","group":"Optimize","name":"Optimize drive C:","desc":"TRIM on SSD or defrag on HDD, detected automatically","risk":"Safe","safe":false,"speed":"Minutes","special":"OptimizeDrive"},
    {"id":"opt-font-cache","group":"Optimize","name":"Rebuild font cache","desc":"Stops the font services and deletes the cache so Windows rebuilds it (fixes broken fonts)","risk":"Moderate","safe":false,"speed":"Seconds","services":["FontCache","FontCache3.0.0.0"],"paths":["%SystemRoot%\\ServiceProfiles\\LocalService\\AppData\\Local\\FontCache\\*.dat"]},
    {"id":"opt-oldest-restore","group":"Optimize","name":"Delete oldest restore point","desc":"Removes only the oldest shadow copy of C: to free space","risk":"Careful","safe":false,"speed":"Seconds","special":"ShadowOldest"}
  ]
}
'@
$global:BatEmbedded['dns.json'] = @'
{
  "providers": [
    {"name":"Automatic (Router / DHCP)","ipv4":[],"ipv6":[]},
    {"name":"Google","ipv4":["8.8.8.8","8.8.4.4"],"ipv6":["2001:4860:4860::8888","2001:4860:4860::8844"]},
    {"name":"Cloudflare","ipv4":["1.1.1.1","1.0.0.1"],"ipv6":["2606:4700:4700::1111","2606:4700:4700::1001"]},
    {"name":"Cloudflare (Malware blocking)","ipv4":["1.1.1.2","1.0.0.2"],"ipv6":["2606:4700:4700::1112","2606:4700:4700::1002"]},
    {"name":"Cloudflare (Family)","ipv4":["1.1.1.3","1.0.0.3"],"ipv6":["2606:4700:4700::1113","2606:4700:4700::1003"]},
    {"name":"AdGuard","ipv4":["94.140.14.14","94.140.15.15"],"ipv6":["2a10:50c0::ad1:ff","2a10:50c0::ad2:ff"]},
    {"name":"AdGuard Family","ipv4":["94.140.14.15","94.140.15.16"],"ipv6":["2a10:50c0::bad1:ff","2a10:50c0::bad2:ff"]},
    {"name":"Quad9","ipv4":["9.9.9.9","149.112.112.112"],"ipv6":["2620:fe::fe","2620:fe::9"]},
    {"name":"OpenDNS","ipv4":["208.67.222.222","208.67.220.220"],"ipv6":[]},
    {"name":"CleanBrowsing (Family)","ipv4":["185.228.168.168","185.228.169.168"],"ipv6":[]}
  ]
}
'@
$global:BatEmbedded['themes.json'] = @'
{
  "default": "dark",
  "defaultAccent": "turquoise",
  "palette": "Material You style: warm charcoal / soft light surfaces tinted by the chosen accent, plus pure AMOLED black",
  "themes": {
    "dark": {
      "Bg": "#131214",
      "Side": "#19181B",
      "Panel": "#1F1D21",
      "Panel2": "#29272C",
      "Line": "#36333A",
      "Fg": "#F4F4F5",
      "Dim": "#A1A1AA",
      "Accent": "#2DD4BF",
      "Accent2": "#38BDF8",
      "Hover": "#36333A",
      "OnHover": "#F4F4F5",
      "OnAccent": "#09090B"
    },
    "light": {
      "Bg": "#F8FAFC",
      "Side": "#F1F5F9",
      "Panel": "#FFFFFF",
      "Panel2": "#E8EDF3",
      "Line": "#D8DEE6",
      "Fg": "#18181B",
      "Dim": "#52525B",
      "Accent": "#0F766E",
      "Accent2": "#0284C7",
      "Hover": "#E2E8F0",
      "OnHover": "#18181B",
      "OnAccent": "#FFFFFF"
    },
    "amoled": {
      "Bg": "#000000",
      "Side": "#000000",
      "Panel": "#09090B",
      "Panel2": "#121214",
      "Line": "#1C1C21",
      "Fg": "#F4F4F5",
      "Dim": "#A1A1AA",
      "Accent": "#2DD4BF",
      "Accent2": "#38BDF8",
      "Hover": "#1C1C21",
      "OnHover": "#F4F4F5",
      "OnAccent": "#000000"
    }
  },
  "accents": {
    "turquoise": {
      "label": "Turquoise",
      "dark": "#2DD4BF",
      "light": "#0F766E",
      "accent2": "#38BDF8"
    },
    "blue": {
      "label": "Blue",
      "dark": "#60A5FA",
      "light": "#2563EB",
      "accent2": "#38BDF8"
    },
    "violet": {
      "label": "Violet",
      "dark": "#A78BFA",
      "light": "#7C3AED",
      "accent2": "#C084FC"
    },
    "emerald": {
      "label": "Emerald",
      "dark": "#34D399",
      "light": "#059669",
      "accent2": "#2DD4BF"
    },
    "amber": {
      "label": "Amber",
      "dark": "#FBBF24",
      "light": "#D97706",
      "accent2": "#F59E0B"
    },
    "rose": {
      "label": "Rose",
      "dark": "#FB7185",
      "light": "#E11D48",
      "accent2": "#F43F5E"
    }
  }
}
'@
$global:BatEmbedded['tweaks.json'] = @'
{
  "WPFTweaksActivity": {
    "Content": "Activity History - Disable",
    "Description": "Stops Windows from publishing or uploading user activities while preserving clipboard history.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "EnableActivityFeed",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "PublishUserActivities",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "UploadUserActivities",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/activity"
  },
  "WPFTweaksHiber": {
    "Content": "Hibernation - Disable",
    "Description": "Hibernation is really meant for laptops as it saves what's in memory before turning the PC off. It really should never be used.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Power",
        "Name": "HibernateEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\FlyoutMenuSettings",
        "Name": "ShowHibernateOption",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      }
    ],
    "InvokeScript": [
      "powercfg.exe /hibernate off"
    ],
    "UndoScript": [
      "powercfg.exe /hibernate on"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/hiber"
  },
  "WPFTweaksWidget": {
    "Content": "Widgets - Remove",
    "Description": "Removes the annoying widgets in the bottom left of the Taskbar.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "\n      # Sometimes if you dont stop the Widgets process the removal may fail\n\n      Get-Process *Widget* | Stop-Process\n      Get-AppxPackage Microsoft.WidgetsPlatformRuntime -AllUsers | Remove-AppxPackage -AllUsers\n      Get-AppxPackage MicrosoftWindows.Client.WebExperience -AllUsers | Remove-AppxPackage -AllUsers\n\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      Write-Host \"Removed widgets\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/widget"
  },
  "WPFTweaksRevertStartMenu": {
    "Content": "Start Menu Previous Layout - Enable",
    "Description": "Bring back the old Start Menu layout from before the gradual rollout of the new one in 25H2. On newer versions of Windows !!THIS TWEAK WILL NOT WORK!!",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\ControlSet001\\Control\\FeatureManagement\\Overrides\\8\\3036241548",
        "Name": "EnabledState",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/revertstartmenu"
  },
  "WPFTweaksDisableStoreSearch": {
    "Content": "Microsoft Store Recommended Search Results - Disable",
    "Description": "Will not display recommended Microsoft Store apps when searching for apps in the Start menu.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "icacls \"$Env:LocalAppData\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\LocalState\\store.db\" /deny *S-1-1-0:F"
    ],
    "UndoScript": [
      "icacls \"$Env:LocalAppData\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\LocalState\\store.db\" /grant *S-1-1-0:F"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/disablestoresearch"
  },
  "WPFTweaksLocation": {
    "Content": "Location Tracking - Disable",
    "Description": "Disables Location Tracking.",
    "category": "Essential Tweaks",
    "panel": "1",
    "service": [
      {
        "Name": "lfsvc",
        "StartupType": "Disabled",
        "OriginalType": "Manual"
      }
    ],
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\CapabilityAccessManager\\ConsentStore\\location",
        "Name": "Value",
        "Value": "Deny",
        "Type": "String",
        "OriginalValue": "Allow"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Sensor\\Overrides\\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}",
        "Name": "SensorPermissionState",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKLM:\\SYSTEM\\Maps",
        "Name": "AutoUpdateEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/location"
  },
  "WPFTweaksServices": {
    "Content": "Services - Set to Manual",
    "Description": "Sets some services to Manual startup.",
    "category": "Essential Tweaks",
    "panel": "1",
    "service": [
      {
        "Name": "CscService",
        "StartupType": "Disabled",
        "OriginalType": "Manual"
      },
      {
        "Name": "DiagTrack",
        "StartupType": "Disabled",
        "OriginalType": "Automatic"
      },
      {
        "Name": "MapsBroker",
        "StartupType": "Manual",
        "OriginalType": "Automatic"
      },
      {
        "Name": "StorSvc",
        "StartupType": "Manual",
        "OriginalType": "Automatic"
      },
      {
        "Name": "SharedAccess",
        "StartupType": "Disabled",
        "OriginalType": "Automatic"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/services"
  },
  "WPFTweaksSvcHostSplitting": {
    "Content": "svchost.exe Splitting - Disable",
    "Description": "Disables service-host splitting to reduce the number of svchost.exe processes and modestly lower memory overhead. Recommended for low-performance systems with 12 GB of RAM or less. Can interfere with Xbox services. Restart Windows after changing this setting.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      # A threshold above the physical memory disables svchost service splitting\n      $Memory = (Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum / 1KB\n      Set-ItemProperty -Path \"HKLM:\\SYSTEM\\CurrentControlSet\\Control\" -Name SvcHostSplitThresholdInKB -Value $Memory -Type DWord\n      "
    ],
    "UndoScript": [
      "\n      # Windows client default (0x380000): splitting back on\n      Set-ItemProperty -Path \"HKLM:\\SYSTEM\\CurrentControlSet\\Control\" -Name SvcHostSplitThresholdInKB -Value 3670016 -Type DWord -Force\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/svchostsplitting"
  },
  "WPFTweaksBraveDebloat": {
    "Content": "Brave Browser - Debloat",
    "Description": "Disables various annoyances like Brave Rewards, Leo AI, Crypto Wallet and VPN.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveRewardsDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveWalletDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveVPNDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveAIChatEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveStatsPingEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveNewsDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveTalkDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "TorDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "BraveP3AEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "UrlKeyedAnonymizedDataCollectionEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "SafeBrowsingExtendedReportingEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\BraveSoftware\\Brave",
        "Name": "MetricsReportingEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/bravedebloat"
  },
  "WPFTweaksDisableWarningForUnsignedRdp": {
    "Content": "RDP Unsigned File Warnings - Disable",
    "Description": "Disables warnings shown when launching unsigned RDP files introduced with the latest Windows 10 and 11 updates.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services\\Client",
        "Name": "RedirectionWarningDialogVersion",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Terminal Server Client",
        "Name": "RdpLaunchConsentAccepted",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/disablewarningforunsignedrdp"
  },
  "WPFTweaksEdgeDebloat": {
    "Content": "Microsoft Edge - Debloat",
    "Description": "Disables various telemetry options, popups, and other annoyances in Edge.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\EdgeUpdate",
        "Name": "CreateDesktopShortcutDefault",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "PersonalizationReportingEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge\\ExtensionInstallBlocklist",
        "Name": "1",
        "Value": "ofefcgjbeghpigppfmkologfjadafddi",
        "Type": "String",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ShowRecommendationsEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "HideFirstRunExperience",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "UserFeedbackAllowed",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ConfigureDoNotTrack",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "AlternateErrorPagesEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeCollectionsEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeShoppingAssistantEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "MicrosoftEdgeInsiderPromotionEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "ShowMicrosoftRewards",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "WebWidgetAllowed",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "DiagnosticData",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "EdgeAssetDeliveryServiceEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "WalletDonationEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Edge",
        "Name": "DefaultBrowserSettingsCampaignEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/edgedebloat"
  },
  "WPFTweaksConsumerFeatures": {
    "Content": "ConsumerFeatures - Disable",
    "Description": "Stops promoted app installs and reduces app suggestions from Microsoft Store content.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent",
        "Name": "DisableWindowsConsumerFeatures",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/consumerfeatures"
  },
  "WPFTweaksTelemetry": {
    "Content": "Telemetry - Disable",
    "Description": "Disables Microsoft Telemetry.",
    "category": "Essential Tweaks",
    "panel": "1",
    "service": [
      {
        "Name": "diagtrack",
        "StartupType": "Disabled",
        "OriginalType": "Automatic"
      },
      {
        "Name": "WerSvc",
        "StartupType": "Disabled",
        "OriginalType": "Manual"
      }
    ],
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\AdvertisingInfo",
        "Name": "Enabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Privacy",
        "Name": "TailoredExperiencesWithDiagnosticDataEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Speech_OneCore\\Settings\\OnlineSpeechPrivacy",
        "Name": "HasAccepted",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Input\\TIPC",
        "Name": "Enabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\InputPersonalization",
        "Name": "RestrictImplicitInkCollection",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\InputPersonalization",
        "Name": "RestrictImplicitTextCollection",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\InputPersonalization\\TrainedDataStore",
        "Name": "HarvestContacts",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Personalization\\Settings",
        "Name": "AcceptedPrivacyPolicy",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\DataCollection",
        "Name": "AllowTelemetry",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "Start_TrackProgs",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "PublishUserActivities",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Siuf\\Rules",
        "Name": "NumberOfSIUFInPeriod",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Siuf\\Rules",
        "Name": "PeriodInNanoSeconds",
        "Value": "<RemoveEntry>",
        "Type": "QWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "InvokeScript": [
      "\n      # Disable Defender Auto Sample Submission\n      try {\n          Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction Stop\n      } catch {\n          # Skip Defender error 0x800106ba when its service is unavailable; other errors must fail.\n          if ($_.Exception.Message -notmatch '\\b0x800106ba\\b' -and $_.Exception.HResult -ne 0x800106BA) {\n              throw\n          }\n          Write-Warning 'Defender sample submission preference could not be changed; Defender may be unavailable or disabled.'\n          Write-WinUtilLog -Level 'WARN' -Component 'Script' -Message 'Defender sample submission preference could not be changed; Defender may be unavailable or disabled.'\n      }\n\n      # Disable PowerShell 7 telemetry\n      [Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '1', 'Machine')\n      "
    ],
    "UndoScript": [
      "\n      # Enable Defender Auto Sample Submission\n      try {\n          Set-MpPreference -SubmitSamplesConsent 1 -ErrorAction Stop\n      } catch {\n          # Skip Defender error 0x800106ba when its service is unavailable; other errors must fail.\n          if ($_.Exception.Message -notmatch '\\b0x800106ba\\b' -and $_.Exception.HResult -ne 0x800106BA) {\n              throw\n          }\n          Write-Warning 'Defender sample submission preference could not be restored; Defender may be unavailable or disabled.'\n          Write-WinUtilLog -Level 'WARN' -Component 'Script' -Message 'Defender sample submission preference could not be restored; Defender may be unavailable or disabled.'\n      }\n\n      # Enable PowerShell 7 telemetry\n      [Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '', 'Machine')\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/telemetry"
  },
  "WPFTweaksDeliveryOptimization": {
    "Content": "Delivery Optimization - Disable",
    "Description": "Stops Windows from using your bandwidth to upload updates to other PCs on the internet or local network.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DeliveryOptimization",
        "Name": "DODownloadMode",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/deliveryoptimization"
  },
  "WPFTweaksRemoveEdge": {
    "Content": "Microsoft Edge - Remove",
    "Description": "Uninstalls Microsoft Edge by creating dummy MicrosoftEdge.exe file in the legacy Edge folder. This tricks Windows into unlocking the official Edge uninstaller allowing for a system-level removal.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      $EdgeAppDir = \"$Env:ProgramFiles (x86)\\Microsoft\\Edge\\Application\"\n      $Path = $null\n      if (Test-Path -LiteralPath $EdgeAppDir -ErrorAction Stop) {\n          $InstallerPattern = Join-Path $EdgeAppDir \"*\\Installer\\setup.exe\"\n          if (Test-Path -Path $InstallerPattern -ErrorAction Stop) {\n              $Path = Resolve-Path -Path $InstallerPattern -ErrorAction Stop | Select-Object -Last 1\n          }\n      }\n\n      if ($Path) {\n          New-Item -Path \"$Env:SystemRoot\\SystemApps\\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\\MicrosoftEdge.exe\" -Force\n          Start-Process -FilePath $Path -ArgumentList \"--uninstall --system-level --force-uninstall --delete-profile\" -Wait\n          Write-Host \"Microsoft Edge was removed\"\n      } else {\n          Write-Host \"Microsoft Edge is not installed\"\n      }\n      "
    ],
    "UndoScript": [
      "\n      Write-Host \"Installing Microsoft Edge...\"\n      winget install Microsoft.Edge --source winget\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/removeedge"
  },
  "WPFTweaksDisableBitLocker": {
    "Content": "BitLocker - Disable",
    "Description": "Disables BitLocker.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "\n      $bitLockerVolume = Get-BitLockerVolume -MountPoint $Env:SystemDrive -ErrorAction Stop\n\n      if ($bitLockerVolume.VolumeStatus -eq 'FullyDecrypted') {\n          Write-Host \"BitLocker is already disabled on $($Env:SystemDrive).\"\n      } else {\n          Disable-BitLocker -MountPoint $Env:SystemDrive -ErrorAction Stop\n      }\n      "
    ],
    "UndoScript": [
      "Enable-BitLocker -MountPoint $Env:SystemDrive"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/disablebitlocker"
  },
  "WPFTweaksUTC": {
    "Content": "Date & Time - Set Time to UTC",
    "Description": "Essential for computers that are dual booting. Fixes the time sync with Linux systems.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\TimeZoneInformation",
        "Name": "RealTimeIsUniversal",
        "Value": "1",
        "Type": "QWord",
        "OriginalValue": "0"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/utc"
  },
  "WPFTweaksRemoveOneDrive": {
    "Content": "Microsoft OneDrive - Remove",
    "Description": "Denies permission to remove OneDrive user files, then uses its own uninstaller to remove it and restores the original permission afterward.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      $OneDrivePath = $Env:OneDrive\n      $OneDriveFolderExists = -not [string]::IsNullOrWhiteSpace($OneDrivePath) -and (Test-Path -LiteralPath $OneDrivePath -PathType Container -ErrorAction Stop)\n\n      if ($OneDriveFolderExists) {\n          $OneDriveAcl = Get-Acl -LiteralPath $OneDrivePath -ErrorAction Stop\n      } else {\n          Write-Host \"OneDrive folder is already absent; skipping folder permissions and cleanup.\"\n      }\n\n      try {\n          if ($OneDriveFolderExists) {\n              # Protect user files while the uninstaller runs.\n              icacls $OneDrivePath /deny \"*S-1-5-32-544:(D,DC)\"\n              if ($LASTEXITCODE -ne 0) { throw \"Unable to protect the OneDrive folder (icacls exit code $LASTEXITCODE).\" }\n          }\n\n          Write-Host \"Uninstalling OneDrive...\"\n          Start-Process -FilePath (Join-Path $Env:SystemRoot \"System32\\OneDriveSetup.exe\") -ArgumentList '/uninstall' -Wait -ErrorAction Stop\n\n          # Some of OneDrive files use explorer, and OneDrive uses FileCoAuth\n          Write-Host \"Removing leftover OneDrive Files...\"\n\n          Get-Process -ErrorAction Stop | Where-Object ProcessName -eq 'FileCoAuth' | Stop-Process -ErrorAction Stop\n          Get-Process -ErrorAction Stop | Where-Object ProcessName -eq 'Explorer' | Stop-Process -ErrorAction Stop\n\n          $OneDriveLeftovers = @(\"$Env:LocalAppData\\Microsoft\\OneDrive\", \"$Env:ProgramData\\Microsoft OneDrive\")\n          foreach ($LeftoverPath in $OneDriveLeftovers) {\n              if (Test-Path -LiteralPath $LeftoverPath -ErrorAction Stop) {\n                  Remove-Item -LiteralPath $LeftoverPath -Recurse -Force -ErrorAction Stop\n              }\n          }\n      } finally {\n          if ($OneDriveFolderExists) {\n              # Restore access even when uninstall or leftover cleanup fails.\n              Set-Acl -LiteralPath $OneDrivePath -AclObject $OneDriveAcl -ErrorAction Stop\n          }\n      }\n\n      if ($OneDriveFolderExists -and -not (Get-ChildItem -LiteralPath $OneDrivePath -Force -ErrorAction Stop)) {\n          # Refuse to delete if files appeared after the emptiness check.\n          [System.IO.Directory]::Delete($OneDrivePath, $false)\n          [Environment]::SetEnvironmentVariable('OneDrive', $null, 'User')\n      }\n\n      # OneSyncSvc is a per-user template; Get-Service only exposes user instances.\n      # Skip the operation if this Windows installation has no template.\n      if (Test-Path -LiteralPath 'HKLM:\\SYSTEM\\CurrentControlSet\\Services\\OneSyncSvc') {\n          Set-Service -Name OneSyncSvc -StartupType Disabled\n      }\n      "
    ],
    "UndoScript": [
      "\n      Write-Host \"Installing OneDrive\"\n      winget install Microsoft.Onedrive --source winget\n\n      # Enable OneSyncSvc when the per-user service template exists\n      if (Test-Path -LiteralPath 'HKLM:\\SYSTEM\\CurrentControlSet\\Services\\OneSyncSvc') {\n          Set-Service -Name OneSyncSvc -StartupType Automatic\n      }\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/removeonedrive"
  },
  "WPFTweaksRemoveHomeAndGallery": {
    "Content": "File Explorer Home and Gallery - Disable",
    "Description": "Removes the Home and Gallery from Explorer and sets This PC as default.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Classes\\CLSID\\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
        "Name": "System.IsPinnedToNameSpaceTree",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "LaunchTo",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/removehomeandgallery"
  },
  "WPFTweaksDisplay": {
    "Content": "Visual Effects - Set to Best Performance",
    "Description": "Sets the system preferences to performance. You can do this manually with sysdm.cpl as well.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "DragFullWindows",
        "Value": "0",
        "Type": "String",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "MenuShowDelay",
        "Value": "200",
        "Type": "String",
        "OriginalValue": "400"
      },
      {
        "Path": "HKCU:\\Control Panel\\Desktop\\WindowMetrics",
        "Name": "MinAnimate",
        "Value": "0",
        "Type": "String",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Control Panel\\Keyboard",
        "Name": "KeyboardDelay",
        "Value": "0",
        "Type": "String",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ListviewAlphaSelect",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ListviewShadow",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "TaskbarAnimations",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects",
        "Name": "VisualFXSetting",
        "Value": "3",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\DWM",
        "Name": "EnableAeroPeek",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "TaskbarMn",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      }
    ],
    "InvokeScript": [
      "Set-ItemProperty -Path \"HKCU:\\Control Panel\\Desktop\" -Name \"UserPreferencesMask\" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))"
    ],
    "UndoScript": [
      "Remove-ItemProperty -Path \"HKCU:\\Control Panel\\Desktop\" -Name \"UserPreferencesMask\""
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/display"
  },
  "WPFTweaksReservedStorage": {
    "Content": "Disable Reserved Storage",
    "Description": "Disables Windows Reserved Storage (7-10 GB held for updates/temp files). Recommended only on small drives. Re-enable before major Windows feature updates to avoid installation failures.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "DISM /Online /Set-ReservedStorageState /State:Disabled"
    ],
    "UndoScript": [
      "DISM /Online /Set-ReservedStorageState /State:Enabled"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/reservedstorage"
  },
  "WPFTweaksRestorePoint": {
    "Content": "Restore Point - Create",
    "Description": "Creates a restore point at runtime in case a revert is needed from WinUtil modifications.",
    "category": "Essential Tweaks",
    "panel": "1",
    "Checked": "False",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\SystemRestore",
        "Name": "SystemRestorePointCreationFrequency",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1440"
      }
    ],
    "InvokeScript": [
      "\n      if (-not (Get-ComputerRestorePoint)) {\n          Enable-ComputerRestore -Drive $Env:SystemDrive\n      }\n\n      Checkpoint-Computer -Description \"System Restore Point created by WinUtil\" -RestorePointType MODIFY_SETTINGS\n      Write-Host \"System Restore Point Created Successfully\" -ForegroundColor Green\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/restorepoint"
  },
  "WPFTweaksEndTaskOnTaskbar": {
    "Content": "End Task With Right Click - Enable",
    "Description": "Enables option to end task when right-clicking a program in the taskbar.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced\\TaskbarDeveloperSettings",
        "Name": "TaskbarEndTask",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/endtaskontaskbar"
  },
  "WPFTweaksStorage": {
    "Content": "Storage Sense - Disable",
    "Description": "Storage Sense deletes temp files automatically.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\StorageSense\\Parameters\\StoragePolicy",
        "Name": "01",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/storage"
  },
  "WPFTweaksWindowsAI": {
    "Content": "Windows AI - Disable And Remove",
    "Description": "Removes and disables all AI features/packages",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "SettingsPageVisibility",
        "Value": "hide:aicomponents",
        "Type": "String",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\WindowsNotepad",
        "Name": "DisableAIFeatures",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "InvokeScript": [
      "\n      $Appx = (Get-AppxPackage MicrosoftWindows.Client.CoreAI).PackageFullName\n      $Sid = (Get-LocalUser $Env:UserName).Sid.Value\n\n      New-Item \"HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Appx\\AppxAllUserStore\\EndOfLife\\$Sid\\$Appx\" -Force\n\n      Get-AppxPackage -AllUsers \"*Copilot*\" | Remove-AppxPackage -AllUsers\n      winget uninstall -e --name \"Copilot\" --silent --force --accept-source-agreements 2>$null\n      Get-AppxPackage -AllUsers Microsoft.MicrosoftOfficeHub | Remove-AppxPackage -AllUsers\n\n      if ($Appx) {\n          Remove-AppxPackage $Appx\n      }\n\n      # WSAIFabricSvc only exists on some Windows 11 builds; without the guard a\n      # missing service aborts the rest of this script block and Recall stays enabled\n      if (Get-Service -Name WSAIFabricSvc -ErrorAction SilentlyContinue) {\n          Set-Service -Name WSAIFabricSvc -StartupType Disabled\n      }\n      # Store/MSIX PowerShell 7 can hang or fail COM activation in DISM.\n      $RecallCommand = {\n          Disable-WindowsOptionalFeature -FeatureName Recall -Online -NoRestart -ErrorAction Stop | Out-Null\n      }\n      $RecallOutput = powershell.exe -NoProfile -NonInteractive -Command $RecallCommand 2>&1\n      if ($LASTEXITCODE -ne 0) {\n          throw \"Failed to disable Recall (exit code $LASTEXITCODE): $(($RecallOutput | Out-String).Trim())\"\n      }\n      $RecallOutput | ForEach-Object { Write-Host $_ }\n\n      Write-Host \"Windows AI Disabled\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/windowsai"
  },
  "WPFTweaksWPBT": {
    "Content": "Windows Platform Binary Table (WPBT) - Disable",
    "Description": "If enabled, WPBT allows your computer vendor to execute programs at boot time, such as anti-theft software, software drivers, as well as force install software without user consent. Poses potential security risk.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager",
        "Name": "DisableWpbtExecution",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/wpbt"
  },
  "WPFTweaksPreventDeviceMetadataFromNetwork": {
    "Content": "Prevent Device Companion Apps",
    "Description": "Prevents additional software from being installed when plugging in devices (e.g. Ads when plugging in a monitor). Poses potential security risk.",
    "category": "Essential Tweaks",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Device Metadata",
        "Name": "PreventDeviceMetadataFromNetwork",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/preventdevicemetadatafromnetwork"
  },
  "WPFTweaksRazerBlock": {
    "Content": "Razer Software Auto-Install - Disable",
    "Description": "Blocks ALL Razer Software installations. The hardware works fine without any software.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DriverSearching",
        "Name": "SearchOrderConfig",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Device Installer",
        "Name": "DisableCoInstallers",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0"
      }
    ],
    "InvokeScript": [
      "\n      $RazerPath = \"$Env:SystemRoot\\Installer\\Razer\"\n\n      if (Test-Path $RazerPath) {\n        Remove-Item $RazerPath\\* -Recurse -Force\n      } else {\n        New-Item -Path $RazerPath -ItemType Directory\n      }\n\n      icacls $RazerPath /deny \"*S-1-1-0:(W)\"\n      "
    ],
    "UndoScript": [
      "\n      icacls \"$Env:SystemRoot\\Installer\\Razer\" /remove:d *S-1-1-0\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/razerblock"
  },
  "WPFTweaksLogiBlock": {
    "Content": "Logitech Download Assistant Auto-Install - Disable",
    "Description": "Blocks the Logi Download Assistant that Windows Update keeps reinstalling with Logitech device drivers. Logitech hardware keeps working without it.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      Stop-Process -Name \"logi_download_assistant\" -Force -ErrorAction SilentlyContinue\n\n      $ProgramFiles64 = if ($Env:ProgramW6432) { $Env:ProgramW6432 } else { $Env:ProgramFiles }\n      $LogiPath = \"$ProgramFiles64\\LogiDownloadAssistant\"\n\n      if (Test-Path $LogiPath) {\n        Remove-Item $LogiPath\\* -Recurse -Force\n      } else {\n        New-Item -Path $LogiPath -ItemType Directory\n      }\n\n      icacls $LogiPath /deny \"*S-1-1-0:(W)\"\n      if ($LASTEXITCODE -ne 0) { throw \"icacls failed to deny write access on $LogiPath (exit code $LASTEXITCODE)\" }\n      "
    ],
    "UndoScript": [
      "\n      $ProgramFiles64 = if ($Env:ProgramW6432) { $Env:ProgramW6432 } else { $Env:ProgramFiles }\n      $LogiPath = \"$ProgramFiles64\\LogiDownloadAssistant\"\n\n      if (Test-Path $LogiPath) {\n        icacls $LogiPath /remove:d \"*S-1-1-0\"\n        if ($LASTEXITCODE -ne 0) { throw \"icacls failed to remove the write-deny rule on $LogiPath (exit code $LASTEXITCODE)\" }\n      }\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/logiblock"
  },
  "WPFTweaksDisableNotifications": {
    "Content": "System Tray Notifications & Calendar - Disable",
    "Description": "Disables all Notifications INCLUDING Calendar.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "DisableNotificationCenter",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\PushNotifications",
        "Name": "ToastEnabled",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/disablenotifications"
  },
  "WPFTweaksBlockAdobeNet": {
    "Content": "Adobe URL Block List - Enable",
    "Description": "Reduces user interruptions by selectively blocking connections to Adobe's activation and telemetry servers. Credit: Ruddernation-Designs",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      $hostsUrl = Invoke-RestMethod -Uri https://github.com/Ruddernation-Designs/Adobe-URL-Block-List/raw/refs/heads/master/hosts\n      Add-Content -Path \"$Env:SystemRoot\\System32\\drivers\\etc\\hosts\" -Value $hostsUrl\n\n      ipconfig /flushdns\n      Write-Host 'Added Adobe url block list from host file'\n      "
    ],
    "UndoScript": [
      "\n      Set-Content \"$Env:SystemRoot\\System32\\drivers\\etc\\hosts\" (\n          (Get-Content \"$Env:SystemRoot\\System32\\drivers\\etc\\hosts\") -join \"`n\" -replace '(?s)#New Ver.*', ''\n      )\n\n      ipconfig /flushdns\n      Write-Host 'Removed Adobe url block list from host file'\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/blockadobenet"
  },
  "WPFTweaksRightClickMenu": {
    "Content": "Right-Click Menu Previous Layout - Enable",
    "Description": "Restores the classic context menu when right-clicking in File Explorer, replacing the simplified Windows 11 version.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "InvokeScript": [
      "\n      New-Item -Path \"HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\" -Name InprocServer32 -Value \"\" -Force\n      Stop-Process -Name explorer\n      "
    ],
    "UndoScript": [
      "Remove-Item -Path \"HKCU:\\Software\\Classes\\CLSID\\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\" -Recurse"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/rightclickmenu"
  },
  "WPFTweaksDiskCleanup": {
    "Content": "Disk Cleanup - Run",
    "Description": "Runs Disk Cleanup on Drive C: and removes old Windows Updates.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "\n      cleanmgr.exe /d C: /VERYLOWDISK\n      Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/diskcleanup"
  },
  "WPFTweaksDeleteTempFiles": {
    "Content": "Temporary Files - Remove",
    "Description": "Erases TEMP Folders.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "\n      # A temp folder always holds files something has open, including this run's own, and\n      # the job layer counts a logged error as a failed step\n      Remove-Item -Path \"$Env:Temp\\*\" -Recurse -Force -ErrorAction SilentlyContinue\n      Remove-Item -Path \"$Env:SystemRoot\\Temp\\*\" -Recurse -Force -ErrorAction SilentlyContinue\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/deletetempfiles"
  },
  "WPFTweaksIPv46": {
    "Content": "IPv6 - Set IPv4 as Preferred",
    "Description": "Setting the IPv4 preference can have latency and security benefits on private networks where IPv6 is not configured.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters",
        "Name": "DisabledComponents",
        "Value": "32",
        "Type": "DWord",
        "OriginalValue": "0"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/ipv46"
  },
  "WPFTweaksTeredo": {
    "Content": "Teredo - Disable",
    "Description": "Teredo network tunneling is an IPv6 feature that can cause additional latency, but may cause problems with some games.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters",
        "Name": "DisabledComponents",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0"
      }
    ],
    "InvokeScript": [
      "netsh interface teredo set state disabled"
    ],
    "UndoScript": [
      "netsh interface teredo set state default"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/teredo"
  },
  "WPFTweaksDisableSearchIndexing": {
    "Content": "Windows Search Indexing - Disable",
    "Description": "Stops and disables the Windows Search service (WSearch) to cut background disk activity, mainly useful on mechanical hard drives. Warning: file searches in Explorer and the Start menu become much slower because Windows no longer maintains a search index. Undo restores the service and starts it again.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "service": [
      {
        "Name": "WSearch",
        "StartupType": "Disabled",
        "OriginalType": "Automatic"
      }
    ],
    "InvokeScript": [
      "$search = Get-Service -Name WSearch -ErrorAction SilentlyContinue\n      if ($search -and $search.StartType -eq 'Disabled' -and $search.Status -ne 'Stopped') {\n        Stop-Service -Name WSearch -Force -ErrorAction Stop\n      }"
    ],
    "UndoScript": [
      "$search = Get-Service -Name WSearch -ErrorAction SilentlyContinue\n      if ($search -and $search.StartType -eq 'Automatic' -and $search.Status -ne 'Running') {\n        Start-Service -Name WSearch -ErrorAction Stop\n      }"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/disablesearchindexing"
  },
  "WPFTweaksDisableIPv6": {
    "Content": "IPv6 - Disable",
    "Description": "Disables IPv6.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters",
        "Name": "DisabledComponents",
        "Value": "255",
        "Type": "DWord",
        "OriginalValue": "0"
      }
    ],
    "InvokeScript": [
      "Disable-NetAdapterBinding -Name * -ComponentID ms_tcpip6"
    ],
    "UndoScript": [
      "Enable-NetAdapterBinding -Name * -ComponentID ms_tcpip6"
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/disableipv6"
  },
  "WPFTweaksDisableBGapps": {
    "Content": "Background Apps - Disable",
    "Description": "Disables all Microsoft Store apps from running in the background, which has to be done individually since Windows 11.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\BackgroundAccessApplications",
        "Name": "GlobalUserDisabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/disablebgapps"
  },
  "WPFTweaksDisableExplorerAutoDiscovery": {
    "Content": "File Explorer Automatic Folder Discovery - Disable",
    "Description": "Windows Explorer automatically tries to guess the type of the folder based on its contents, slowing down the browsing experience. WARNING! Will disable File Explorer grouping.",
    "category": "Essential Tweaks",
    "panel": "1",
    "InvokeScript": [
      "\n      # Previously detected folders\n      $bags = \"HKCU:\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\Bags\"\n\n      # Folder types lookup table\n      $bagMRU = \"HKCU:\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\BagMRU\"\n\n      # Flush Explorer view database\n      Remove-Item -Path $bags -Recurse -Force\n      Write-Host \"Removed $bags\"\n\n      Remove-Item -Path $bagMRU -Recurse -Force\n      Write-Host \"Removed $bagMRU\"\n\n      # Every folder\n      $allFolders = \"HKCU:\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\Bags\\AllFolders\\Shell\"\n\n      if (!(Test-Path $allFolders)) {\n        New-Item -Path $allFolders -Force\n        Write-Host \"Created $allFolders\"\n      }\n\n      # Generic view\n      New-ItemProperty -Path $allFolders -Name \"FolderType\" -Value \"NotSpecified\" -PropertyType String -Force\n      Write-Host \"Set FolderType to NotSpecified\"\n\n      Write-Host Please sign out and back in, or restart your computer to apply the changes!\n      "
    ],
    "UndoScript": [
      "\n      # Previously detected folders\n      $bags = \"HKCU:\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\Bags\"\n\n      # Folder types lookup table\n      $bagMRU = \"HKCU:\\Software\\Classes\\Local Settings\\Software\\Microsoft\\Windows\\Shell\\BagMRU\"\n\n      # Flush Explorer view database\n      Remove-Item -Path $bags -Recurse -Force\n      Write-Host \"Removed $bags\"\n\n      Remove-Item -Path $bagMRU -Recurse -Force\n      Write-Host \"Removed $bagMRU\"\n\n      Write-Host Please sign out and back in, or restart your computer to apply the changes!\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/essential-tweaks/disableexplorerautodiscovery"
  },
  "WPFToggleDetailedBSoD": {
    "Content": "BSoD Verbose Mode",
    "Description": "Gives more information when you blue screen.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CrashControl",
        "Name": "DisplayParameters",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\CrashControl",
        "Name": "DisableEmoticon",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/detailedbsod"
  },
  "WPFToggleBatteryPercentage": {
    "Content": "System Tray Battery Percentage",
    "Description": "Shows numeric battery percentage next to the battery icon in the system tray.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "IsBatteryPercentageEnabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/batterypercentage"
  },
  "WPFToggleDarkMode": {
    "Content": "Dark Theme for Windows",
    "Description": "Dark Mode for the system and applications.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
        "Name": "AppsUseLightTheme",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "false"
      },
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
        "Name": "SystemUsesLightTheme",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "false"
      }
    ],
    "InvokeScript": [
      "\n      Invoke-WinUtilExplorerUpdate\n      if ($sync.ThemeButton.Content -eq [char]0xF08C) {\n        Invoke-WinutilThemeChange -theme \"Auto\"\n      }\n      "
    ],
    "UndoScript": [
      "\n      Invoke-WinUtilExplorerUpdate\n      if ($sync.ThemeButton.Content -eq [char]0xF08C) {\n        Invoke-WinutilThemeChange -theme \"Auto\"\n      }\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/darkmode"
  },
  "WPFToggleShowExt": {
    "Content": "File Explorer File Extensions",
    "Description": "Shows .file extensions in Explorer (.exe, .png, etc.)",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "HideFileExt",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "false"
      }
    ],
    "InvokeScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "UndoScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/showext"
  },
  "WPFToggleHiddenFiles": {
    "Content": "File Explorer Hidden Files",
    "Description": "Reveals hidden files in Explorer.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "Hidden",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      }
    ],
    "InvokeScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "UndoScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/hiddenfiles"
  },
  "WPFToggleVerboseLogon": {
    "Content": "Logon Verbose Mode",
    "Description": "Show detailed messages during startup/shutdown.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System",
        "Name": "VerboseStatus",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/verboselogon"
  },
  "WPFToggleNewOutlook": {
    "Content": "Microsoft Outlook New Version",
    "Description": "This will ensure the new Outlook application is used.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Microsoft\\Office\\16.0\\Outlook\\Preferences",
        "Name": "UseNewOutlook",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\Office\\16.0\\Outlook\\Options\\General",
        "Name": "HideNewOutlookToggle",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "true"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Office\\16.0\\Outlook\\Options\\General",
        "Name": "DoNewOutlookAutoMigration",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      },
      {
        "Path": "HKCU:\\Software\\Policies\\Microsoft\\Office\\16.0\\Outlook\\Preferences",
        "Name": "NewOutlookMigrationUserSetting",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/newoutlook"
  },
  "WPFToggleScrollbars": {
    "Content": "Scrollbars Always Visible",
    "Description": "If enabled, scrollbars will always be visible. If disabled, Windows will automatically hide scrollbars when not in use.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Control Panel\\Accessibility",
        "Name": "DynamicScrollbars",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/scrollbars"
  },
  "WPFMultiplaneOverlay": {
    "Content": "Multiplane Overlay",
    "Description": "Multiplane Overlay composes multiple image layers, which can sometimes cause issues with graphics cards. Changes to this preference are applied immediately.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Combobox",
    "ComboItems": "Enabled|Disabled (Compatibility)|Fully Disabled",
    "ComboDescriptions": {
      "Enabled": "Uses Windows' default overlay behavior.",
      "Disabled (Compatibility)": "Disables MPO using OverlayTestMode=5, the less aggressive compatibility method.",
      "Fully Disabled": "Disables MPO using OverlayTestMode=5 and DisableOverlays=1, the more aggressive method."
    },
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Dwm",
        "Name": "OverlayTestMode",
        "Type": "DWord",
        "DefaultValue": "0",
        "Values": {
          "Enabled": "<RemoveEntry>",
          "Disabled (Compatibility)": "5",
          "Fully Disabled": "5"
        }
      },
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\GraphicsDrivers",
        "Name": "DisableOverlays",
        "Type": "DWord",
        "DefaultValue": "0",
        "Values": {
          "Enabled": "<RemoveEntry>",
          "Disabled (Compatibility)": "<RemoveEntry>",
          "Fully Disabled": "1"
        }
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/multiplaneoverlay"
  },
  "WPFToggleMouseAcceleration": {
    "Content": "Mouse Acceleration",
    "Description": "Makes it so Cursor movement is affected by the speed of your physical mouse movements.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseSpeed",
        "Value": "1",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "true"
      },
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseThreshold1",
        "Value": "6",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "true"
      },
      {
        "Path": "HKCU:\\Control Panel\\Mouse",
        "Name": "MouseThreshold2",
        "Value": "10",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/mouseacceleration"
  },
  "WPFToggleNumLock": {
    "Content": "Num Lock on Startup",
    "Description": "Toggle the Num Lock key state when your computer starts.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKU:\\.Default\\Control Panel\\Keyboard",
        "Name": "InitialKeyboardIndicators",
        "Value": "2",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "false"
      },
      {
        "Path": "HKCU:\\Control Panel\\Keyboard",
        "Name": "InitialKeyboardIndicators",
        "Value": "2",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/numlock"
  },
  "WPFToggleWindowSnapping": {
    "Content": "Window Snapping",
    "Description": "Toggles the window snapping feature when dragging windows.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Control Panel\\Desktop",
        "Name": "WindowArrangementActive",
        "Value": "1",
        "Type": "String",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/windowsnapping"
  },
  "WPFToggleStandbyFix": {
    "Content": "S0 Sleep Network Connectivity",
    "Description": "Toggles network connectivity during S0 Sleep which is low power idle in modern laptops.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\SOFTWARE\\Policies\\Microsoft\\Power\\PowerSettings\\f15576e8-98b7-4186-b944-eafa664402d9",
        "Name": "ACSettingIndex",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/standbyfix"
  },
  "WPFToggleS3Sleep": {
    "Content": "S3 Sleep",
    "Description": "Toggles between Modern Standby and S3 Sleep, which cuts off power to the CPU while continuing to refresh the memory.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Power",
        "Name": "PlatformAoAcOverride",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/s3sleep"
  },
  "WPFToggleHideSettingsHome": {
    "Content": "Settings Home Page",
    "Description": "Toggles the Home Page in the Windows Settings app.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
        "Name": "SettingsPageVisibility",
        "Value": "show:home",
        "Type": "String",
        "OriginalValue": "hide:home",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/hidesettingshome"
  },
  "WPFToggleBingSearch": {
    "Content": "Start Menu Bing Search",
    "Description": "Toggles Bing web search results in Windows Search.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "BingSearchEnabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/bingsearch"
  },
  "WPFToggleLoginBlur": {
    "Content": "Logon Screen Acrylic Blur",
    "Description": "Toggles the acrylic blur effect on login screen background.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System",
        "Name": "DisableAcrylicBackgroundOnLogon",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/loginblur"
  },
  "WPFToggleDisableLockscreen": {
    "Content": "Lock Screen - Disable",
    "Description": "Skips the lock screen entirely and goes directly to the sign-in screen on boot and wake.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Personalization",
        "Name": "NoLockScreen",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "<RemoveEntry>"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/disablelockscreen"
  },
  "WPFToggleStartMenuRecommendations": {
    "Content": "Start Menu Recommendations",
    "Description": "Toggles the recommendations section in the Start Menu. WARNING: This will also disable Windows Spotlight on your Lock Screen as a side effect.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\current\\device\\Start",
        "Name": "HideRecommendedSection",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "true"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Microsoft\\PolicyManager\\current\\device\\Education",
        "Name": "IsEducationEnvironment",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "true"
      },
      {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
        "Name": "HideRecommendedSection",
        "Value": "0",
        "Type": "DWord",
        "OriginalValue": "1",
        "DefaultState": "true"
      }
    ],
    "InvokeScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "UndoScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/startmenurecommendations"
  },
  "WPFToggleStickyKeys": {
    "Content": "Sticky Keys",
    "Description": "Toggles the Sticky Keys, which activate when clicking shift rapidly.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Control Panel\\Accessibility\\StickyKeys",
        "Name": "Flags",
        "Value": "506",
        "Type": "DWord",
        "OriginalValue": "58",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/stickykeys"
  },
  "WPFToggleTaskbarAlignment": {
    "Content": "Taskbar Centered Icons",
    "Description": "Toggles the Taskbar alignment either to the left or center.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "TaskbarAl",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "InvokeScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "UndoScript": [
      "\n      Invoke-WinUtilExplorerUpdate -action \"restart\"\n      "
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/taskbaralignment"
  },
  "WPFToggleTaskbarSearch": {
    "Content": "Taskbar Search Icon",
    "Description": "Toggles the Search Button on the Taskbar.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Search",
        "Name": "SearchboxTaskbarMode",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/taskbarsearch"
  },
  "WPFToggleTaskView": {
    "Content": "Taskbar Task View Icon",
    "Description": "Toggles the Task View Button in the Taskbar.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
        "Name": "ShowTaskViewButton",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/taskview"
  },
  "WPFToggleGameMode": {
    "Content": "Game Mode",
    "Description": "Toggles Windows prioritizes gaming performance by allocating system resources to games.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKCU:\\Software\\Microsoft\\GameBar",
        "Name": "AllowAutoGameMode",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      },
      {
        "Path": "HKCU:\\Software\\Microsoft\\GameBar",
        "Name": "AutoGameModeEnabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "true"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/gamemode"
  },
  "WPFToggleLongPaths": {
    "Content": "Enable Long Paths",
    "Description": "Toggles support for file paths longer than 260 characters in Explorer.",
    "category": "Customize Preferences",
    "panel": "2",
    "Type": "Toggle",
    "registry": [
      {
        "Path": "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem",
        "Name": "LongPathsEnabled",
        "Value": "1",
        "Type": "DWord",
        "OriginalValue": "0",
        "DefaultState": "false"
      }
    ],
    "link": "https://winutil.christitus.com/code-reference/tweaks/customize-preferences/longpaths"
  },
  "WPFOOSUbutton": {
    "Content": "O&O ShutUp10++ - Run",
    "Description": "Downloads O&O ShutUp10++ (about 82 MB) from oo-software.com on every click and launches it. Nothing is installed; the file is saved under %LocalAppData%\\winutil.",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "Type": "Button",
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/oosubutton"
  },
  "WPFchangedns": {
    "Content": "DNS - Set to:",
    "category": "z__Advanced Tweaks - CAUTION",
    "panel": "1",
    "Type": "Combobox",
    "ComboItems": "Default DHCP Fastest Google Cloudflare Cloudflare_Malware Cloudflare_Malware_Adult Open_DNS Quad9 AdGuard_Ads_Trackers AdGuard_Ads_Trackers_Malware_Adult",
    "link": "https://winutil.christitus.com/code-reference/tweaks/z--advanced-tweaks---caution/changedns"
  },
  "WPFAddUltPerf": {
    "Content": "Ultimate Performance Profile - Enable",
    "category": "Performance Plans - NOT FOR LAPTOPS",
    "panel": "2",
    "Type": "Button",
    "ButtonWidth": "300",
    "link": "https://winutil.christitus.com/code-reference/tweaks/performance-plans---not-for-laptops/addultperf"
  },
  "WPFRemoveUltPerf": {
    "Content": "Ultimate Performance Profile - Disable",
    "category": "Performance Plans - NOT FOR LAPTOPS",
    "panel": "2",
    "Type": "Button",
    "ButtonWidth": "300",
    "link": "https://winutil.christitus.com/code-reference/tweaks/performance-plans---not-for-laptops/removeultperf"
  }
}
'@
$global:BatEmbedded['MainWindow.xaml'] = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name="Win" Title="BAT TOOLKIT" Width="1220" Height="800" MinWidth="960" MinHeight="620"
        WindowStartupLocation="CenterScreen" FontFamily="Segoe UI" FontSize="13"
        Background="{DynamicResource Bg}" Foreground="{DynamicResource Fg}">
  <Window.Resources>
    <!-- Theme tokens. Defaults = dark neutral gray. Data\themes.json holds dark and light
         and Set-BatTheme swaps these brushes at run time. -->
    <SolidColorBrush x:Key="Bg" Color="#121214"/>
    <SolidColorBrush x:Key="Side" Color="#18181B"/>
    <SolidColorBrush x:Key="Panel" Color="#1E1E22"/>
    <SolidColorBrush x:Key="Panel2" Color="#27272A"/>
    <SolidColorBrush x:Key="Line" Color="#323238"/>
    <SolidColorBrush x:Key="Fg" Color="#F4F4F5"/>
    <SolidColorBrush x:Key="Dim" Color="#A1A1AA"/>
    <SolidColorBrush x:Key="Accent" Color="#2DD4BF"/>
    <SolidColorBrush x:Key="Accent2" Color="#38BDF8"/>
    <SolidColorBrush x:Key="Hover" Color="#323238"/>
    <SolidColorBrush x:Key="OnHover" Color="#F4F4F5"/>
    <SolidColorBrush x:Key="OnAccent" Color="#09090B"/>


    <!-- Vector icons (24x24 grid, stroke only) -->
    <Geometry x:Key="IconMenu">M4,6 L20,6 M4,12 L20,12 M4,18 L20,18</Geometry>
    <Geometry x:Key="IconInstall">M12,3 L12,15 M7,10 L12,15 L17,10 M5,20 L19,20</Geometry>
    <Geometry x:Key="IconUpdate">M4,12 A8,8 0 0 1 18,6.3 M18,3 L18,6.5 L14.5,6.5 M20,12 A8,8 0 0 1 6,17.7 M6,21 L6,17.5 L9.5,17.5</Geometry>
    <Geometry x:Key="IconClean">M12,3 L14,10 L21,12 L14,14 L12,21 L10,14 L3,12 L10,10 Z</Geometry>
    <Geometry x:Key="IconTweaks">M4,8 L20,8 M4,16 L20,16 M8,5 L8,11 M16,13 L16,19</Geometry>
    <Geometry x:Key="IconFixes">M12,3 L19,6 L19,12 C19,16.5 16,19.5 12,21 C8,19.5 5,16.5 5,12 L5,6 Z M9,12 L11,14 L15,10</Geometry>
    <Geometry x:Key="IconDebloat">M4,7 L20,7 M9,7 L9,4 L15,4 L15,7 M6,7 L7,20 L17,20 L18,7 M10,11 L10,16 M14,11 L14,16</Geometry>
    <Geometry x:Key="IconSun">M8,12 A4,4 0 1 0 16,12 A4,4 0 1 0 8,12 M12,2 L12,4 M12,20 L12,22 M2,12 L4,12 M20,12 L22,12 M4.9,4.9 L6.3,6.3 M17.7,17.7 L19.1,19.1 M4.9,19.1 L6.3,17.7 M17.7,6.3 L19.1,4.9</Geometry>
    <Geometry x:Key="IconMoon">M20,14 A8,8 0 1 1 10,4 A6.5,6.5 0 0 0 20,14 Z</Geometry>
    <Geometry x:Key="IconAmoled">M4,12 A8,8 0 1 0 20,12 A8,8 0 1 0 4,12 M12,4 L12,20</Geometry>
    <Style x:Key="NavIcon" TargetType="Path">
      <Setter Property="Width" Value="24"/>
      <Setter Property="Height" Value="24"/>
      <Setter Property="Margin" Value="0,0,4,0"/>
      <Setter Property="Stretch" Value="None"/>
      <Setter Property="StrokeThickness" Value="1.8"/>
      <Setter Property="StrokeStartLineCap" Value="Round"/>
      <Setter Property="StrokeEndLineCap" Value="Round"/>
      <Setter Property="StrokeLineJoin" Value="Round"/>
      <Setter Property="Stroke" Value="{Binding Foreground, RelativeSource={RelativeSource AncestorType={x:Type Button}}}"/>
    </Style>
    <Style x:Key="ThemeSeg" TargetType="Button">
      <Setter Property="Foreground" Value="{DynamicResource Dim}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Height" Value="32"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="Bd" Background="Transparent" CornerRadius="8" Margin="2">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Hover}"/>
                <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
              </Trigger>
              <Trigger Property="Tag" Value="Selected">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Accent}"/>
                <Setter Property="Foreground" Value="{DynamicResource OnAccent}"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style x:Key="SegIcon" TargetType="Path" BasedOn="{StaticResource NavIcon}">
      <Setter Property="Margin" Value="0"/>
      <Setter Property="StrokeThickness" Value="1.7"/>
    </Style>
    <!-- Card used by the app catalog: clear contrast on hover -->
    <Style x:Key="AppCard" TargetType="Border">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="CornerRadius" Value="10"/>
      <Setter Property="Padding" Value="10,7"/>
      <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
          <Setter Property="Background" Value="{DynamicResource Panel2}"/>
          <Setter Property="BorderBrush" Value="{DynamicResource Accent}"/>
        </Trigger>
      </Style.Triggers>
    </Style>

    <Style TargetType="Button">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Background" Value="{DynamicResource Panel2}"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="Padding" Value="18,9"/>
      <Setter Property="Margin" Value="0,0,10,8"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Border x:Name="Bd" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="1" CornerRadius="10" Padding="{TemplateBinding Padding}">
              <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Hover}"/>
                <Setter TargetName="Bd" Property="BorderBrush" Value="{DynamicResource Accent}"/>
                <Setter Property="Foreground" Value="{DynamicResource OnHover}"/>
              </Trigger>
              <Trigger Property="IsPressed" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Bd" Property="BorderBrush" Value="{DynamicResource Accent}"/>
                <Setter Property="Foreground" Value="{DynamicResource OnAccent}"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter Property="Opacity" Value="0.4"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Sidebar buttons: Tag="Selected" shows the active page with an accent bar -->
    <Style x:Key="Nav" TargetType="Button">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="Height" Value="44"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Button">
            <Grid Margin="8,3">
              <Border x:Name="Bd" Background="{TemplateBinding Background}" CornerRadius="12"/>
              <Border x:Name="Ind" Width="4" Height="20" CornerRadius="2" HorizontalAlignment="Left" VerticalAlignment="Center"
                      Margin="3,0,0,0" Background="{DynamicResource Accent}" Visibility="Collapsed"/>
              <ContentPresenter HorizontalAlignment="Left" VerticalAlignment="Center" Margin="14,0,6,0"/>
            </Grid>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Panel2}"/>
              </Trigger>
              <Trigger Property="Tag" Value="Selected">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Panel2}"/>
                <Setter TargetName="Ind" Property="Visibility" Value="Visible"/>
                <Setter Property="Foreground" Value="{DynamicResource Accent}"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter Property="Opacity" Value="0.35"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Slim modern scroll bars -->
    <Style x:Key="ScrollRepeat" TargetType="RepeatButton">
      <Setter Property="OverridesDefaultStyle" Value="True"/>
      <Setter Property="IsTabStop" Value="False"/>
      <Setter Property="Focusable" Value="False"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="RepeatButton"><Border Background="Transparent"/></ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style x:Key="ScrollThumbStyle" TargetType="Thumb">
      <Setter Property="OverridesDefaultStyle" Value="True"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="Thumb">
            <Border x:Name="Tb" Background="{DynamicResource Dim}" Opacity="0.45" CornerRadius="4" Margin="2"/>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Tb" Property="Opacity" Value="1"/>
                <Setter TargetName="Tb" Property="Background" Value="{DynamicResource Accent}"/>
              </Trigger>
              <Trigger Property="IsDragging" Value="True">
                <Setter TargetName="Tb" Property="Opacity" Value="1"/>
                <Setter TargetName="Tb" Property="Background" Value="{DynamicResource Accent}"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style TargetType="ScrollBar">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="Width" Value="12"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ScrollBar">
            <Grid Background="Transparent">
              <Track x:Name="PART_Track" IsDirectionReversed="True">
                <Track.DecreaseRepeatButton><RepeatButton Style="{StaticResource ScrollRepeat}" Command="ScrollBar.PageUpCommand"/></Track.DecreaseRepeatButton>
                <Track.Thumb><Thumb Style="{StaticResource ScrollThumbStyle}"/></Track.Thumb>
                <Track.IncreaseRepeatButton><RepeatButton Style="{StaticResource ScrollRepeat}" Command="ScrollBar.PageDownCommand"/></Track.IncreaseRepeatButton>
              </Track>
            </Grid>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
      <Style.Triggers>
        <Trigger Property="Orientation" Value="Horizontal">
          <Setter Property="Width" Value="Auto"/>
          <Setter Property="Height" Value="12"/>
          <Setter Property="Template">
            <Setter.Value>
              <ControlTemplate TargetType="ScrollBar">
                <Grid Background="Transparent">
                  <Track x:Name="PART_Track" IsDirectionReversed="False">
                    <Track.DecreaseRepeatButton><RepeatButton Style="{StaticResource ScrollRepeat}" Command="ScrollBar.PageLeftCommand"/></Track.DecreaseRepeatButton>
                    <Track.Thumb><Thumb Style="{StaticResource ScrollThumbStyle}"/></Track.Thumb>
                    <Track.IncreaseRepeatButton><RepeatButton Style="{StaticResource ScrollRepeat}" Command="ScrollBar.PageRightCommand"/></Track.IncreaseRepeatButton>
                  </Track>
                </Grid>
              </ControlTemplate>
            </Setter.Value>
          </Setter>
        </Trigger>
      </Style.Triggers>
    </Style>

    <!-- Check boxes and radio buttons that follow the theme -->
    <Style TargetType="CheckBox">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="CheckBox">
            <StackPanel Orientation="Horizontal" Background="Transparent">
              <Border x:Name="Box" Width="18" Height="18" CornerRadius="5" BorderThickness="1.5" VerticalAlignment="Center"
                      BorderBrush="{DynamicResource Dim}" Background="Transparent">
                <Grid>
                  <Path x:Name="Mark" Data="M3,8 L6.5,11.5 L12.5,4.5" Stroke="{DynamicResource OnAccent}" StrokeThickness="2"
                        StrokeStartLineCap="Round" StrokeEndLineCap="Round" StrokeLineJoin="Round" Visibility="Collapsed"/>
                  <Path x:Name="Dash" Data="M3.5,7.5 L11.5,7.5" Stroke="{DynamicResource OnAccent}" StrokeThickness="2"
                        StrokeStartLineCap="Round" StrokeEndLineCap="Round" Visibility="Collapsed"/>
                </Grid>
              </Border>
              <ContentPresenter x:Name="Cp" Margin="10,0,0,0" VerticalAlignment="Center" RecognizesAccessKey="True"/>
            </StackPanel>
            <ControlTemplate.Triggers>
              <Trigger Property="HasContent" Value="False">
                <Setter TargetName="Cp" Property="Visibility" Value="Collapsed"/>
              </Trigger>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Box" Property="BorderBrush" Value="{DynamicResource Accent}"/>
              </Trigger>
              <Trigger Property="IsChecked" Value="{x:Null}">
                <Setter TargetName="Box" Property="Background" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Box" Property="BorderBrush" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Dash" Property="Visibility" Value="Visible"/>
              </Trigger>
              <Trigger Property="IsChecked" Value="True">
                <Setter TargetName="Box" Property="Background" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Box" Property="BorderBrush" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Mark" Property="Visibility" Value="Visible"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter Property="Opacity" Value="0.4"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style TargetType="RadioButton">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="RadioButton">
            <StackPanel Orientation="Horizontal" Background="Transparent">
              <Grid Width="18" Height="18" VerticalAlignment="Center">
                <Ellipse x:Name="Ring" StrokeThickness="1.5" Stroke="{DynamicResource Dim}" Fill="Transparent"/>
                <Ellipse x:Name="Dot" Width="8" Height="8" Fill="{DynamicResource Accent}" Visibility="Collapsed"/>
              </Grid>
              <ContentPresenter Margin="10,0,0,0" VerticalAlignment="Center" RecognizesAccessKey="True"/>
            </StackPanel>
            <ControlTemplate.Triggers>
              <Trigger Property="IsMouseOver" Value="True">
                <Setter TargetName="Ring" Property="Stroke" Value="{DynamicResource Accent}"/>
              </Trigger>
              <Trigger Property="IsChecked" Value="True">
                <Setter TargetName="Ring" Property="Stroke" Value="{DynamicResource Accent}"/>
                <Setter TargetName="Dot" Property="Visibility" Value="Visible"/>
              </Trigger>
              <Trigger Property="IsEnabled" Value="False">
                <Setter Property="Opacity" Value="0.4"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <!-- Combo box -->
    <Style TargetType="ComboBoxItem">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Padding" Value="12,8"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ComboBoxItem">
            <Border x:Name="Bd" Background="Transparent" CornerRadius="8" Margin="3,1" Padding="{TemplateBinding Padding}">
              <ContentPresenter/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsHighlighted" Value="True">
                <Setter TargetName="Bd" Property="Background" Value="{DynamicResource Panel2}"/>
              </Trigger>
              <Trigger Property="IsSelected" Value="True">
                <Setter Property="Foreground" Value="{DynamicResource Accent}"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>
    <Style TargetType="ComboBox">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="ComboBox">
            <Grid>
              <ToggleButton x:Name="Tg" Focusable="False" ClickMode="Press"
                            IsChecked="{Binding IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}">
                <ToggleButton.Template>
                  <ControlTemplate TargetType="ToggleButton">
                    <Border Background="{DynamicResource Panel2}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="10">
                      <Path HorizontalAlignment="Right" VerticalAlignment="Center" Margin="0,0,14,0" Data="M0,0 L4,4 L8,0"
                            Stroke="{DynamicResource Dim}" StrokeThickness="2" StrokeStartLineCap="Round" StrokeEndLineCap="Round"/>
                    </Border>
                  </ControlTemplate>
                </ToggleButton.Template>
              </ToggleButton>
              <ContentPresenter IsHitTestVisible="False" Content="{TemplateBinding SelectionBoxItem}"
                                Margin="14,0,36,0" VerticalAlignment="Center" HorizontalAlignment="Left"/>
              <Popup IsOpen="{Binding IsDropDownOpen, Mode=TwoWay, RelativeSource={RelativeSource TemplatedParent}}"
                     Placement="Bottom" AllowsTransparency="True" Focusable="False" PopupAnimation="Fade">
                <Border Margin="0,6,0,0" MinWidth="{Binding ActualWidth, ElementName=Tg}" MaxHeight="280"
                        Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1"
                        CornerRadius="12" Padding="4">
                  <ScrollViewer><StackPanel IsItemsHost="True"/></ScrollViewer>
                </Border>
              </Popup>
            </Grid>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style TargetType="TextBox">
      <Setter Property="Background" Value="{DynamicResource Panel2}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="CaretBrush" Value="{DynamicResource Accent}"/>
      <Setter Property="SelectionBrush" Value="{DynamicResource Accent2}"/>
      <Setter Property="Padding" Value="10,8"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="TextBox">
            <Border x:Name="Bd" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}"
                    BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="10" SnapsToDevicePixels="True">
              <ScrollViewer x:Name="PART_ContentHost" Focusable="False" Margin="{TemplateBinding Padding}"
                            HorizontalScrollBarVisibility="{TemplateBinding ScrollViewer.HorizontalScrollBarVisibility}"
                            VerticalScrollBarVisibility="{TemplateBinding ScrollViewer.VerticalScrollBarVisibility}"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsKeyboardFocused" Value="True">
                <Setter TargetName="Bd" Property="BorderBrush" Value="{DynamicResource Accent}"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style TargetType="ListBox">
      <Setter Property="Background" Value="{DynamicResource Panel2}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="Padding" Value="6"/>
    </Style>

    <Style TargetType="TabControl">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Padding" Value="0,14,0,0"/>
    </Style>

    <Style TargetType="TabItem">
      <Setter Property="Foreground" Value="{DynamicResource Dim}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Setter Property="Template">
        <Setter.Value>
          <ControlTemplate TargetType="TabItem">
            <Border x:Name="Bd" Padding="16,8" Margin="0,0,2,0" Background="Transparent"
                    BorderBrush="Transparent" BorderThickness="0,0,0,2">
              <ContentPresenter ContentSource="Header"/>
            </Border>
            <ControlTemplate.Triggers>
              <Trigger Property="IsSelected" Value="True">
                <Setter TargetName="Bd" Property="BorderBrush" Value="{DynamicResource Accent}"/>
                <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
              </Trigger>
            </ControlTemplate.Triggers>
          </ControlTemplate>
        </Setter.Value>
      </Setter>
    </Style>

    <Style TargetType="DataGridColumnHeader">
      <Setter Property="Background" Value="{DynamicResource Panel2}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Padding" Value="12,10"/>
      <Setter Property="FontWeight" Value="SemiBold"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="BorderThickness" Value="0,0,0,1"/>
    </Style>

    <Style TargetType="DataGrid">
      <Setter Property="Background" Value="{DynamicResource Panel}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="RowBackground" Value="{DynamicResource Panel}"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="HorizontalGridLinesBrush" Value="{DynamicResource Line}"/>
      <Setter Property="GridLinesVisibility" Value="Horizontal"/>
      <Setter Property="HeadersVisibility" Value="Column"/>
      <Setter Property="AutoGenerateColumns" Value="False"/>
      <Setter Property="CanUserAddRows" Value="False"/>
      <Setter Property="CanUserDeleteRows" Value="False"/>
      <Setter Property="SelectionMode" Value="Single"/>
      <Setter Property="RowHeight" Value="36"/>
    </Style>

    <Style TargetType="DataGridRow">
      <Setter Property="Background" Value="{DynamicResource Panel}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Cursor" Value="Hand"/>
      <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
          <Setter Property="Background" Value="{DynamicResource Panel2}"/>
        </Trigger>
        <Trigger Property="IsSelected" Value="True">
          <Setter Property="Background" Value="{DynamicResource Panel2}"/>
          <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
        </Trigger>
      </Style.Triggers>
    </Style>
    <Style TargetType="DataGridCell">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="VerticalContentAlignment" Value="Center"/>
      <Style.Triggers>
        <Trigger Property="IsSelected" Value="True">
          <Setter Property="Background" Value="Transparent"/>
          <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
        </Trigger>
      </Style.Triggers>
    </Style>
    <Style TargetType="ProgressBar">
      <Setter Property="Foreground" Value="{DynamicResource Accent}"/>
    </Style>

    <Style TargetType="Expander">
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Setter Property="Background" Value="{DynamicResource Panel}"/>
      <Setter Property="BorderBrush" Value="{DynamicResource Line}"/>
      <Setter Property="BorderThickness" Value="1"/>
      <Setter Property="Padding" Value="12,10"/>
      <Setter Property="Margin" Value="0,0,0,14"/>
    </Style>
    <Style TargetType="TextBlock" x:Key="Dimmed">
      <Setter Property="Foreground" Value="{DynamicResource Dim}"/>
    </Style>
    <DataTemplate x:Key="CleanRow">
      <Grid Margin="0,5,0,5">
        <Grid.ColumnDefinitions>
          <ColumnDefinition Width="30"/>
          <ColumnDefinition Width="*"/>
          <ColumnDefinition Width="82"/>
          <ColumnDefinition Width="82"/>
          <ColumnDefinition Width="90"/>
        </Grid.ColumnDefinitions>
        <CheckBox Grid.Column="0" IsChecked="{Binding Checked, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" VerticalAlignment="Top" Margin="0,3,0,0"/>
        <StackPanel Grid.Column="1" Margin="0,0,10,0">
          <TextBlock Text="{Binding Name}" FontWeight="SemiBold"/>
          <TextBlock Text="{Binding Desc}" Style="{StaticResource Dimmed}" TextWrapping="Wrap" Margin="0,2,0,0"/>
        </StackPanel>
        <TextBlock Grid.Column="2" Text="{Binding Speed}" Style="{StaticResource Dimmed}" VerticalAlignment="Top" Margin="0,2,0,0"/>
        <TextBlock Grid.Column="3" Text="{Binding Risk}" Style="{StaticResource Dimmed}" VerticalAlignment="Top" Margin="0,2,0,0"/>
        <TextBlock Grid.Column="4" Text="{Binding Size}" HorizontalAlignment="Right" VerticalAlignment="Top" Margin="0,2,0,0"/>
      </Grid>
    </DataTemplate>
    <DataTemplate x:Key="TweakRow">
      <Grid Margin="0,5,0,5">
        <Grid.ColumnDefinitions>
          <ColumnDefinition Width="30"/>
          <ColumnDefinition Width="*"/>
          <ColumnDefinition Width="140"/>
          <ColumnDefinition Width="80"/>
        </Grid.ColumnDefinitions>
        <CheckBox Grid.Column="0" IsChecked="{Binding Checked, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" IsEnabled="{Binding Enabled}" VerticalAlignment="Top" Margin="0,3,0,0"/>
        <StackPanel Grid.Column="1" Margin="0,0,10,0">
          <TextBlock Text="{Binding Name}" FontWeight="SemiBold"/>
          <TextBlock Text="{Binding Desc}" Style="{StaticResource Dimmed}" TextWrapping="Wrap" Margin="0,2,0,0"/>
        </StackPanel>
        <TextBlock Grid.Column="2" Text="{Binding Status}" ToolTip="{Binding Status}" TextTrimming="CharacterEllipsis" VerticalAlignment="Top" Margin="0,2,8,0"/>
        <TextBlock Grid.Column="3" Text="{Binding Risk}" Style="{StaticResource Dimmed}" VerticalAlignment="Top" Margin="0,2,0,0"/>
      </Grid>
    </DataTemplate>
  </Window.Resources>

  <Grid>
    <Grid.ColumnDefinitions>
      <ColumnDefinition Width="Auto"/>
      <ColumnDefinition Width="*"/>
    </Grid.ColumnDefinitions>

    <!-- SIDEBAR -->
    <Border x:Name="Sidebar" Grid.Column="0" Width="66" Margin="14" CornerRadius="18" Background="{DynamicResource Side}" BorderBrush="{DynamicResource Line}" BorderThickness="1">
      <DockPanel>
        <StackPanel DockPanel.Dock="Top" Margin="0,10,0,12">
          <Button x:Name="BtnToggle" Style="{StaticResource Nav}" ToolTip="Collapse / Expand sidebar">
            <StackPanel Orientation="Horizontal">
              <Path Style="{StaticResource NavIcon}" Data="{StaticResource IconMenu}"/>
              <TextBlock x:Name="SideTitle" Visibility="Collapsed" Text="BAT TOOLKIT" FontWeight="Bold" FontSize="15" Foreground="{DynamicResource Accent}"/>
            </StackPanel>
          </Button>
        </StackPanel>
        <StackPanel DockPanel.Dock="Bottom">
          <Border x:Name="AccentPanel" Visibility="Collapsed" Margin="12,4,12,6" Padding="10,8" CornerRadius="12" Background="{DynamicResource Panel2}" BorderBrush="{DynamicResource Line}" BorderThickness="1">
            <StackPanel>
              <TextBlock Text="Theme" FontSize="11" Style="{StaticResource Dimmed}" Margin="0,0,0,5"/>
              <Border CornerRadius="10" Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" Margin="0,0,0,12">
                <UniformGrid Rows="1">
                  <Button x:Name="BtnThemeDark" Style="{StaticResource ThemeSeg}" ToolTip="Dark"><Path Style="{StaticResource SegIcon}" Data="{StaticResource IconMoon}"/></Button>
                  <Button x:Name="BtnThemeLight" Style="{StaticResource ThemeSeg}" ToolTip="Light"><Path Style="{StaticResource SegIcon}" Data="{StaticResource IconSun}"/></Button>
                  <Button x:Name="BtnThemeAmoled" Style="{StaticResource ThemeSeg}" ToolTip="AMOLED black"><Path Style="{StaticResource SegIcon}" Data="{StaticResource IconAmoled}"/></Button>
                </UniformGrid>
              </Border>
              <TextBlock Text="Accent color" FontSize="11" Style="{StaticResource Dimmed}" Margin="0,0,0,7"/>
              <WrapPanel x:Name="AccentSwatches" HorizontalAlignment="Left"/>
            </StackPanel>
          </Border>
          <Button x:Name="BtnTheme" Style="{StaticResource Nav}" ToolTip="Cycle theme: Dark, Light, AMOLED black">
            <StackPanel Orientation="Horizontal">
              <Path x:Name="ThemeIcon" Style="{StaticResource NavIcon}" Data="{StaticResource IconSun}"/>
              <TextBlock x:Name="LblTheme" Visibility="Collapsed" Text="Theme: Dark"/>
            </StackPanel>
          </Button>
          <Border BorderBrush="{DynamicResource Line}" BorderThickness="0,1,0,0" Margin="14,6,14,0" Padding="0,12,0,14">
            <TextBlock x:Name="DriveInfo" Text="C:" Style="{StaticResource Dimmed}" TextWrapping="Wrap"/>
          </Border>
        </StackPanel>
        <StackPanel>
          <Button x:Name="NavInstall" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconInstall}"/><TextBlock x:Name="LblInstall" Visibility="Collapsed" Text="Install Apps"/></StackPanel></Button>
          <Button x:Name="NavUpdate" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconUpdate}"/><TextBlock x:Name="LblUpdate" Visibility="Collapsed" Text="Update Apps"/></StackPanel></Button>
          <Button x:Name="NavClean" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconClean}"/><TextBlock x:Name="LblClean" Visibility="Collapsed" Text="Clean C:"/></StackPanel></Button>
          <Button x:Name="NavTweaks" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconTweaks}"/><TextBlock x:Name="LblTweaks" Visibility="Collapsed" Text="Tweaks"/></StackPanel></Button>
          <Button x:Name="NavFixes" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconFixes}"/><TextBlock x:Name="LblFixes" Visibility="Collapsed" Text="Fixes and DNS"/></StackPanel></Button>
          <Button x:Name="NavDebloat" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><Path Style="{StaticResource NavIcon}" Data="{StaticResource IconDebloat}"/><TextBlock x:Name="LblDebloat" Visibility="Collapsed" Text="Debloat"/></StackPanel></Button>
        </StackPanel>
      </DockPanel>
    </Border>

    <!-- CONTENT -->
    <Grid x:Name="ContentRoot" Grid.Column="1" Margin="10,22,26,20">
     <Grid Grid.Column="0">
      <Grid.RowDefinitions>
        <RowDefinition Height="Auto"/>
        <RowDefinition Height="3"/>
        <RowDefinition Height="*"/>
        <RowDefinition Height="14"/>
        <RowDefinition Height="200" MinHeight="90"/>
      </Grid.RowDefinitions>

      <DockPanel Grid.Row="0" Margin="0,0,0,10">
        <StackPanel>
          <TextBlock x:Name="SectionTitle" FontSize="28" FontWeight="SemiBold" Foreground="{DynamicResource Accent}" Text="Install and Manage Apps"/>
          <TextBlock x:Name="SectionDesc" Style="{StaticResource Dimmed}" Text=""/>
        </StackPanel>
      </DockPanel>
      <ProgressBar x:Name="BusyBar" Grid.Row="1" Height="3" Background="Transparent" BorderThickness="0"
                   Foreground="{DynamicResource Accent}" IsIndeterminate="False"/>

      <Grid Grid.Row="2" Margin="0,16,0,0">

        <!-- INSTALL -->
        <Grid x:Name="PageInstall">
          <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
          <Border Grid.Row="0" Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" Padding="16,10" CornerRadius="14" Margin="0,0,0,14">
            <WrapPanel VerticalAlignment="Center">
              <TextBlock Text="Package source:" VerticalAlignment="Center" Margin="0,0,12,0" Style="{StaticResource Dimmed}"/>
              <RadioButton x:Name="RbWinget" Content="Winget" Margin="0,0,14,0" VerticalAlignment="Center"/>
              <RadioButton x:Name="RbChoco" Content="Chocolatey" Margin="0,0,14,0" VerticalAlignment="Center"/>
              <RadioButton x:Name="RbBoth" Content="Both merged" IsChecked="True" Margin="0,0,20,0" VerticalAlignment="Center"/>
              <TextBlock x:Name="PmStatus" VerticalAlignment="Center" Margin="0,0,14,0" Style="{StaticResource Dimmed}"/>
              <Button x:Name="BtnGetWinget" Content="Install Winget" Visibility="Collapsed"/>
              <Button x:Name="BtnGetChoco" Content="Install Chocolatey" Visibility="Collapsed"/>
            </WrapPanel>
          </Border>
          <TabControl Grid.Row="1" x:Name="InstallTabs">
            <TabItem Header="Search">
              <Grid>
                <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
                <DockPanel Margin="0,0,0,8">
                  <Button x:Name="BtnInstallSearch" DockPanel.Dock="Right" Margin="10,0,0,0" Content="Install Selected"/>
                  <Button x:Name="BtnSearch" DockPanel.Dock="Right" Margin="10,0,0,0" Content="Search"/>
                  <TextBox x:Name="TxtSearch" VerticalContentAlignment="Center"/>
                </DockPanel>
                <DataGrid x:Name="GridSearch" Grid.Row="1">
                  <DataGrid.Columns>
                    <DataGridTemplateColumn Width="40"><DataGridTemplateColumn.CellTemplate><DataTemplate>
                      <CheckBox IsChecked="{Binding Checked, UpdateSourceTrigger=PropertyChanged}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                    </DataTemplate></DataGridTemplateColumn.CellTemplate></DataGridTemplateColumn>
                    <DataGridTextColumn Header="Name" Binding="{Binding Name}" IsReadOnly="True" Width="2*"/>
                    <DataGridTextColumn Header="ID" Binding="{Binding Id}" IsReadOnly="True" Width="2*"/>
                    <DataGridTextColumn Header="Version" Binding="{Binding Version}" IsReadOnly="True" Width="*"/>
                    <DataGridTextColumn Header="Source" Binding="{Binding Source}" IsReadOnly="True" Width="*"/>
                  </DataGrid.Columns>
                </DataGrid>
              </Grid>
            </TabItem>

            <TabItem Header="Popular Apps">
              <Grid>
                <Grid.ColumnDefinitions><ColumnDefinition Width="*"/><ColumnDefinition Width="300"/></Grid.ColumnDefinitions>
                <Grid Grid.Column="0" Margin="0,0,16,0">
                  <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
                  <WrapPanel Margin="0,0,0,8">
                    <Button x:Name="BtnShowInstalled" Content="Show Installed Apps"/>
                    <Button x:Name="BtnClearCatalog" Content="Clear"/>
                    <Button x:Name="BtnExport" Content="Export"/>
                    <Button x:Name="BtnImport" Content="Import"/>
                    <TextBlock Text="Search:" Style="{StaticResource Dimmed}" VerticalAlignment="Center" Margin="10,0,8,8"/>
                    <TextBox x:Name="TxtCatalogSearch" Width="220" Margin="0,0,10,8" VerticalContentAlignment="Center" ToolTip="Filter the catalog by name, description or package id"/>
                  </WrapPanel>
                  <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                    <StackPanel x:Name="CatalogPanel"/>
                  </ScrollViewer>
                </Grid>
                <Border Grid.Column="1" Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="16">
                  <DockPanel>
                    <TextBlock x:Name="SelectedHeader" DockPanel.Dock="Top" Text="Selected Apps (0)" FontWeight="SemiBold" Margin="0,0,0,8"/>
                    <StackPanel DockPanel.Dock="Bottom" Margin="0,8,0,0">
                      <Button x:Name="BtnDeselectAll" Content="Deselect All" Margin="0,0,0,6"/>
                      <Button x:Name="BtnInstallCatalog" Content="Install Selected" Margin="0"/>
                    </StackPanel>
                    <ListBox x:Name="SelectedList"/>
                  </DockPanel>
                </Border>
              </Grid>
            </TabItem>

            <TabItem Header="Uninstall">
              <Grid>
                <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
                <DockPanel Margin="0,0,0,8">
                  <Button x:Name="BtnUninstall" DockPanel.Dock="Right" Margin="10,0,0,0" Content="Uninstall Selected"/>
                  <Button x:Name="BtnLoadInstalled" DockPanel.Dock="Left" Content="Load Installed Apps"/>
                  <TextBox x:Name="TxtFilterInstalled" VerticalContentAlignment="Center" ToolTip="Filter the list"/>
                </DockPanel>
                <DataGrid x:Name="GridInstalled" Grid.Row="1">
                  <DataGrid.Columns>
                    <DataGridTemplateColumn Width="40"><DataGridTemplateColumn.CellTemplate><DataTemplate>
                      <CheckBox IsChecked="{Binding Checked, UpdateSourceTrigger=PropertyChanged}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                    </DataTemplate></DataGridTemplateColumn.CellTemplate></DataGridTemplateColumn>
                    <DataGridTextColumn Header="Name" Binding="{Binding Name}" IsReadOnly="True" Width="2*"/>
                    <DataGridTextColumn Header="ID" Binding="{Binding Id}" IsReadOnly="True" Width="2*"/>
                    <DataGridTextColumn Header="Version" Binding="{Binding Version}" IsReadOnly="True" Width="*"/>
                    <DataGridTextColumn Header="Source" Binding="{Binding Source}" IsReadOnly="True" Width="*"/>
                  </DataGrid.Columns>
                </DataGrid>
              </Grid>
            </TabItem>
          </TabControl>
        </Grid>

        <!-- UPDATE -->
        <Grid x:Name="PageUpdate" Visibility="Collapsed">
          <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
          <WrapPanel Margin="0,0,0,8">
            <Button x:Name="BtnLoadUpd" Content="Load Installed Apps"/>
            <Button x:Name="BtnSelectUpd" Content="Select Updateable"/>
            <CheckBox x:Name="ChkSelAllUpd" Content="Select all" VerticalAlignment="Center" Margin="0,0,14,0"/>
            <Button x:Name="BtnUpdSel" Content="Update Selected"/>
            <Button x:Name="BtnUpdAll" Content="Update ALL"/>
            <TextBox x:Name="TxtFilterUpd" Width="220" VerticalContentAlignment="Center" ToolTip="Filter the list"/>
          </WrapPanel>
          <DataGrid x:Name="GridUpd" Grid.Row="1">
            <DataGrid.Columns>
              <DataGridTemplateColumn Width="40"><DataGridTemplateColumn.CellTemplate><DataTemplate>
                <CheckBox IsChecked="{Binding Checked, UpdateSourceTrigger=PropertyChanged}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
              </DataTemplate></DataGridTemplateColumn.CellTemplate></DataGridTemplateColumn>
              <DataGridTextColumn Header="Name" Binding="{Binding Name}" IsReadOnly="True" Width="2*"/>
              <DataGridTextColumn Header="ID" Binding="{Binding Id}" IsReadOnly="True" Width="2*"/>
              <DataGridTextColumn Header="Version" Binding="{Binding Version}" IsReadOnly="True" Width="*"/>
              <DataGridTextColumn Header="Available" Binding="{Binding Available}" IsReadOnly="True" Width="*"/>
              <DataGridTextColumn Header="Source" Binding="{Binding Source}" IsReadOnly="True" Width="*"/>
            </DataGrid.Columns>
          </DataGrid>
        </Grid>

        <!-- CLEAN -->
        <Grid x:Name="PageClean" Visibility="Collapsed">
          <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
          <StackPanel Margin="0,0,0,10">
            <WrapPanel Margin="0,0,0,6">
              <Button x:Name="BtnQuickClean" Content="Quick Clean"/>
              <Button x:Name="BtnAnalyze" Content="Analyze Sizes"/>
              <Button x:Name="BtnSafeDefaults" Content="Safe Defaults"/>
              <Button x:Name="BtnCleanAll" Content="Select All"/>
              <Button x:Name="BtnCleanNone" Content="Select None"/>
              <Button x:Name="BtnDeepClean" Content="Start Deep Clean"/>
            </WrapPanel>
            <StackPanel Orientation="Horizontal">
              <TextBlock Text="Group by:" Style="{StaticResource Dimmed}" VerticalAlignment="Center" Margin="0,0,12,0"/>
              <RadioButton x:Name="RbByCat" Content="Category" IsChecked="True" VerticalAlignment="Center" Margin="0,0,16,0"/>
              <RadioButton x:Name="RbByTime" Content="How long it takes" VerticalAlignment="Center" Margin="0,0,24,0"/>
              <TextBlock x:Name="CleanCounter" Style="{StaticResource Dimmed}" VerticalAlignment="Center"/>
            </StackPanel>
          </StackPanel>
          <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
            <StackPanel x:Name="CleanHost" Margin="0,0,8,0"/>
          </ScrollViewer>
        </Grid>

        <!-- TWEAKS -->
        <Grid x:Name="PageTweaks" Visibility="Collapsed">
          <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
          <StackPanel Margin="0,0,0,10">
            <WrapPanel Margin="0,0,0,6">
              <Button x:Name="BtnRestoreTweaks" Content="Create Restore Point"/>
              <Button x:Name="BtnRefreshTweaks" Content="Refresh Status"/>
              <Button x:Name="BtnTweakRecommended" Content="Select Recommended"/>
              <Button x:Name="BtnTweakNone" Content="Select None"/>
              <Button x:Name="BtnApplyTweaks" Content="Apply Selected"/>
              <Button x:Name="BtnUndoTweaks" Content="Undo Selected"/>
              <CheckBox x:Name="ChkTweakRestore" Content="Restore point before applying" IsChecked="True" VerticalAlignment="Center" Margin="4,0,0,8"/>
            </WrapPanel>
            <TextBlock x:Name="TweakCounter" Style="{StaticResource Dimmed}"/>
          </StackPanel>
          <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
            <StackPanel x:Name="TweakHost" Margin="0,0,8,0"/>
          </ScrollViewer>
        </Grid>

        <!-- FIXES / DNS -->
        <ScrollViewer x:Name="PageFixes" Visibility="Collapsed" VerticalScrollBarVisibility="Auto">
          <StackPanel>
            <TextBlock Text="Repair" FontSize="17" FontWeight="SemiBold" Margin="0,0,0,12" Foreground="{DynamicResource Accent}"/>
            <Border Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="18,16" Margin="0,0,0,14">
              <DockPanel><Button x:Name="BtnResetWU" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Reset Windows Update"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Stops the update services, renames SoftwareDistribution and catroot2, clears stuck BITS downloads and starts the services again."/></DockPanel>
            </Border>
            <Border Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="18,16" Margin="0,0,0,14">
              <DockPanel><Button x:Name="BtnResetNet" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Reset Network"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Flushes DNS, re-registers DNS and resets Winsock and the IP stack. A restart is needed afterwards."/></DockPanel>
            </Border>
            <Border Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="18,16" Margin="0,0,0,24">
              <DockPanel><Button x:Name="BtnRepairSys" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Scan and Repair System Files"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Runs DISM RestoreHealth then SFC /scannow. This can take a long time."/></DockPanel>
            </Border>
            <TextBlock Text="DNS" FontSize="17" FontWeight="SemiBold" Margin="0,0,0,12" Foreground="{DynamicResource Accent}"/>
            <Border Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="18,16">
              <StackPanel>
                <DockPanel Margin="0,0,0,8">
                  <Button x:Name="BtnApplyDns" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Apply DNS"/>
                  <ComboBox x:Name="CmbDns" Height="30" VerticalContentAlignment="Center"/>
                </DockPanel>
                <TextBlock x:Name="DnsInfo" Style="{StaticResource Dimmed}" TextWrapping="Wrap"/>
              </StackPanel>
            </Border>
          </StackPanel>
        </ScrollViewer>

        <!-- DEBLOAT -->
        <Grid x:Name="PageDebloat" Visibility="Collapsed">
          <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/></Grid.RowDefinitions>
          <WrapPanel Margin="0,0,0,8">
            <Button x:Name="BtnScanBloat" Content="Scan Installed Bloatware"/>
            <Button x:Name="BtnTickSafe" Content="Tick Safe Default Bloatware"/>
            <Button x:Name="BtnRemoveBloat" Content="Remove Selected"/>
            <Button x:Name="BtnRestoreBloat" Content="Create Restore Point"/>
            <Button x:Name="BtnExportBloat" Content="Export Preset"/>
            <Button x:Name="BtnImportBloat" Content="Import Preset"/>
            <TextBox x:Name="TxtFilterBloat" Width="200" Margin="0,0,10,8" VerticalContentAlignment="Center" ToolTip="Filter the list"/>
            <TextBlock x:Name="BloatCounter" Style="{StaticResource Dimmed}" VerticalAlignment="Center" Margin="0,0,0,8"/>
          </WrapPanel>
          <DataGrid x:Name="GridBloat" Grid.Row="1">
            <DataGrid.Columns>
              <DataGridTemplateColumn Width="40"><DataGridTemplateColumn.CellTemplate><DataTemplate>
                <CheckBox IsChecked="{Binding Checked, UpdateSourceTrigger=PropertyChanged}" HorizontalAlignment="Center" VerticalAlignment="Center"/>
              </DataTemplate></DataGridTemplateColumn.CellTemplate></DataGridTemplateColumn>
              <DataGridTextColumn Header="App" Binding="{Binding Name}" IsReadOnly="True" Width="2*"/>
              <DataGridTextColumn Header="Package" Binding="{Binding Id}" IsReadOnly="True" Width="3*"/>
              <DataGridTextColumn Header="Level" Binding="{Binding Risk}" IsReadOnly="True" Width="90"/>
              <DataGridTextColumn Header="Notes" Binding="{Binding Desc}" IsReadOnly="True" Width="2*"/>
            </DataGrid.Columns>
          </DataGrid>
        </Grid>
      </Grid>

      <GridSplitter Grid.Row="3" Height="6" HorizontalAlignment="Stretch" ResizeDirection="Rows" Background="Transparent"/>

      <!-- LOG -->
      <Border Grid.Row="4" Background="{DynamicResource Panel}" BorderBrush="{DynamicResource Line}" BorderThickness="1" CornerRadius="14" Padding="14,12">
        <DockPanel>
          <DockPanel DockPanel.Dock="Top" Margin="0,0,0,6">
            <Button x:Name="BtnCopyLog" DockPanel.Dock="Right" Margin="8,0,0,0" Padding="12,4" Content="Copy"/>
            <Button x:Name="BtnClearLog" DockPanel.Dock="Right" Margin="8,0,0,0" Padding="12,4" Content="Clear"/>
            <TextBlock Text="LOG" FontWeight="Bold" Foreground="{DynamicResource Accent}" VerticalAlignment="Center"/>
          </DockPanel>
          <TextBox x:Name="LogBox" IsReadOnly="True" FontFamily="Consolas" FontSize="12" TextWrapping="NoWrap"
                   VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Auto"/>
        </DockPanel>
      </Border>
     </Grid>
    </Grid>
  </Grid>
</Window>
'@
# ----- Logic\Core.ps1 -----
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
        Collapsed    = $true
        CatalogBoxes = New-Object System.Collections.ArrayList
        Version      = '0.2.1'
    }
    $global:BatUI = @{}
}

# ---------------------------------------------------------------- LOG
function Write-BatLog {
    param([string]$Message, [ValidateSet('INFO', 'OK', 'WARN', 'ERR', 'CMD', 'STEP', 'OUT')][string]$Level = 'INFO')
    if ($null -eq $Message) { return }
    $Sync.Log.Enqueue(('[{0}] [{1,-4}] {2}' -f (Get-Date -Format 'HH:mm:ss'), $Level, $Message))
}

# Mirrors log lines to the console window with colors so the terminal doubles as a live monitor.
# Set BAT_QUIET=1 to turn it off.
function Write-BatConsole {
    param([string]$Text)
    if ($env:BAT_QUIET) { return }
    foreach ($ln in ($Text -split "`r?`n")) {
        if (-not $ln) { continue }
        $color = 'Gray'
        if ($ln -match '^\[[^\]]*\] \[(\w+)\s*\]') {
            switch ($Matches[1]) {
                'OK' { $color = 'Green' }
                'WARN' { $color = 'Yellow' }
                'ERR' { $color = 'Red' }
                'CMD' { $color = 'Cyan' }
                'STEP' { $color = 'White' }
                'OUT' { $color = 'DarkGray' }
            }
        }
        try { Write-Host $ln -ForegroundColor $color } catch { }
    }
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
            Write-BatConsole $sb.ToString()
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
    if ($global:BatEmbedded) { $rs.SessionStateProxy.SetVariable('BatEmbedded', $global:BatEmbedded) }
    if ($global:BatRoot) { $rs.SessionStateProxy.SetVariable('BatRoot', $global:BatRoot) }
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


# ----- Logic\Apps.ps1 -----
# =====================================================================
# Apps.ps1  -  Winget / Chocolatey: setup, search, list, install, remove
# =====================================================================

function Install-BatWinget {
    Write-BatLog 'Installing winget (App Installer)...' 'STEP'
    try {
        Add-AppxPackage -RegisterByFamilyName -MainPackage 'Microsoft.DesktopAppInstaller_8wekyb3d8bbwe' -ErrorAction Stop
    }
    catch { Write-BatLog "Register step: $($_.Exception.Message)" 'WARN' }
    if (-not (Test-BatCommand winget)) {
        try {
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            $tmp = Join-Path $env:TEMP 'bat-winget'
            New-Item -ItemType Directory -Force -Path $tmp | Out-Null
            $bundle = Join-Path $tmp 'AppInstaller.msixbundle'
            Write-BatLog 'Downloading App Installer bundle' 'INFO'
            Invoke-WebRequest -UseBasicParsing -Uri 'https://aka.ms/getwinget' -OutFile $bundle
            Add-AppxPackage -Path $bundle -ErrorAction Stop
        }
        catch { Write-BatLog "Winget install failed: $($_.Exception.Message)" 'ERR' }
    }
    Update-BatPath
    if (Test-BatCommand winget) { Write-BatLog 'winget is ready' 'OK' } else { Write-BatLog 'winget still not found - sign out and in or reboot then retry' 'ERR' }
}

function Install-BatChoco {
    Write-BatLog 'Installing Chocolatey...' 'STEP'
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) 2>&1 | Out-Null
    }
    catch { Write-BatLog "Chocolatey install failed: $($_.Exception.Message)" 'ERR' }
    Update-BatPath
    if (Test-BatCommand choco) { Write-BatLog 'Chocolatey is ready' 'OK' } else { Write-BatLog 'Chocolatey still not found' 'ERR' }
}

# Parses the fixed width table printed by winget (search / list / upgrade)
function ConvertFrom-BatWingetTable {
    param([string[]]$Lines)
    $idx = -1
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match '^Name\s+Id\s+Version') { $idx = $i; break }
    }
    if ($idx -lt 0) { return @() }
    $hdr = $Lines[$idx]
    $cols = [regex]::Matches($hdr, '\S+')
    $names = @($cols | ForEach-Object { $_.Value })
    $starts = @($cols | ForEach-Object { $_.Index })
    $rows = New-Object System.Collections.ArrayList
    for ($i = $idx + 1; $i -lt $Lines.Count; $i++) {
        $ln = $Lines[$i]
        if ($ln -match 'upgrades? available' -or $ln -match 'following packages') { break }
        if ($ln.Length -le $starts[1]) { continue }
        # Adjust index offset when wide East-Asian/Unicode characters shift visual column widths
        $shift = 0
        for ($k = 0; $k -lt [Math]::Min($starts[1], $ln.Length); $k++) {
            if ([int][char]$ln[$k] -gt 0x2E80) { $shift++ }
        }
        $o = [ordered]@{}
        for ($c = 0; $c -lt $names.Count; $c++) {
            $s = if ($c -eq 0) { 0 } else { [Math]::Max(0, $starts[$c] - $shift) }
            $e = if ($c -lt $names.Count - 1) { [Math]::Max($s, $starts[$c + 1] - $shift) } else { $ln.Length }
            if ($s -ge $ln.Length) { $o[$names[$c]] = ''; continue }
            if ($e -gt $ln.Length) { $e = $ln.Length }
            $o[$names[$c]] = $ln.Substring($s, $e - $s).Trim()
        }
        if ($o['Id']) { [void]$rows.Add([pscustomobject]$o) }
    }
    $rows.ToArray()
}

function Search-BatPackages {
    param([string]$Query, [string]$Mode = 'both')
    $safeQuery = ($Query -replace '["&|;<>^`]', '').Trim()
    if (-not $safeQuery) { return @() }
    $out = @()
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        $r = Invoke-BatCmd 'winget' "search `"$safeQuery`" --accept-source-agreements" -Silent
        $rows = @(ConvertFrom-BatWingetTable $r.Lines)
        Write-BatLog "winget: $($rows.Count) result(s)" 'INFO'
        foreach ($x in $rows) { $out += [pscustomobject]@{ Name = $x.Name; Id = $x.Id; Version = $x.Version; Available = ''; Source = 'winget' } }
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        $r = Invoke-BatCmd 'choco' "search `"$safeQuery`" --limit-output" -Silent
        $n = 0
        foreach ($l in $r.Lines) {
            $p = $l -split '\|'
            if ($p.Count -ge 2) { $n++; $out += [pscustomobject]@{ Name = $p[0]; Id = $p[0]; Version = $p[1]; Available = ''; Source = 'choco' } }
        }
        Write-BatLog "choco: $n result(s)" 'INFO'
    }
    $out
}

# Installed packages (+ Available column when an update exists)
function Get-BatInstalled {
    param([string]$Mode = 'both')
    $out = @()
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        $r = Invoke-BatCmd 'winget' 'list --accept-source-agreements' -Silent
        $rows = @(ConvertFrom-BatWingetTable $r.Lines)
        Write-BatLog "winget: $($rows.Count) installed item(s)" 'INFO'
        foreach ($x in $rows) {
            $out += [pscustomobject]@{ Name = $x.Name; Id = $x.Id; Version = $x.Version; Available = "$($x.Available)"; Source = 'winget' }
        }
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        $verRes = Invoke-BatCmd 'choco' '--version' -Silent
        $chocoMajor = 2
        if ($verRes.Lines -and $verRes.Lines[0] -match '^(\d+)\.') { $chocoMajor = [int]$Matches[1] }
        $listArgs = if ($chocoMajor -lt 2) { 'list --local-only --limit-output' } else { 'list --limit-output' }
        $r = Invoke-BatCmd 'choco' $listArgs -Silent
        $o = Invoke-BatCmd 'choco' 'outdated --limit-output' -Silent
        $avail = @{}
        foreach ($l in $o.Lines) { $p = $l -split '\|'; if ($p.Count -ge 3) { $avail[$p[0]] = $p[2] } }
        $n = 0
        foreach ($l in $r.Lines) {
            $p = $l -split '\|'
            if ($p.Count -ge 2) {
                $n++
                $a = ''
                if ($avail.ContainsKey($p[0])) { $a = $avail[$p[0]] }
                $out += [pscustomobject]@{ Name = $p[0]; Id = $p[0]; Version = $p[1]; Available = $a; Source = 'choco' }
            }
        }
        Write-BatLog "choco: $n installed item(s)" 'INFO'
    }
    if ($Mode -eq 'both') { $out = @(Remove-BatDuplicatePackages -Rows $out) }
    $out
}

function ConvertTo-BatKey {
    param([string]$Text)
    (("$Text").ToLower() -replace '\.(install|portable|commandline)$', '') -replace '[^a-z0-9]', ''
}

# winget lists everything in Add/Remove Programs, including apps Chocolatey installed.
# Keep the choco row and drop the winget twin so each program shows once.
function Remove-BatDuplicatePackages {
    param($Rows)
    $chocoKeys = @($Rows | Where-Object { $_.Source -eq 'choco' } | ForEach-Object { ConvertTo-BatKey $_.Id } | Where-Object { $_.Length -ge 3 })
    foreach ($r in $Rows) {
        if ($r.Source -ne 'winget') { $r; continue }
        $nameKey = ConvertTo-BatKey $r.Name
        $idKey = ConvertTo-BatKey (($r.Id -split '\.')[-1])
        $dup = $false
        foreach ($k in $chocoKeys) {
            if ($nameKey -eq $k -or $idKey -eq $k -or ($k.Length -ge 5 -and $nameKey.StartsWith($k))) { $dup = $true; break }
        }
        if (-not $dup) { $r }
    }
}

function Get-BatPkgCommand {
    param([string]$Action, [string]$Source, [string]$Id)
    $safeId = ($Id -replace '["&|;<>^`]', '').Trim()
    if ($Source -eq 'winget') {
        $common = '--silent --accept-source-agreements'
        switch ($Action) {
            'install'   { return @('winget', "install --id `"$safeId`" -e --accept-package-agreements $common") }
            'uninstall' { return @('winget', "uninstall --id `"$safeId`" -e $common") }
            'upgrade'   { return @('winget', "upgrade --id `"$safeId`" -e --accept-package-agreements $common") }
        }
    }
    else {
        switch ($Action) {
            'install'   { return @('choco', "install $safeId -y --no-progress") }
            'uninstall' { return @('choco', "uninstall $safeId -y --no-progress") }
            'upgrade'   { return @('choco', "upgrade $safeId -y --no-progress") }
        }
    }
}

# Items: objects with Name, Source (winget|choco), Id
function Invoke-BatPackageOps {
    param([object[]]$Items, [string]$Action)
    $ok = 0
    $bad = 0
    foreach ($it in $Items) {
        Write-BatLog ('{0}: {1} [{2}]' -f $Action.ToUpper(), $it.Name, $it.Source) 'STEP'
        $cmd = Get-BatPkgCommand -Action $Action -Source $it.Source -Id $it.Id
        $r = Invoke-BatCmd $cmd[0] $cmd[1]
        if ($r.ExitCode -eq 0) { Write-BatLog "Success: $($it.Name)" 'OK'; $ok++ }
        else { Write-BatLog "Exit code $($r.ExitCode): $($it.Name)" 'ERR'; $bad++ }
    }
    Write-BatLog "Summary: $ok succeeded and $bad failed" 'INFO'
}

# ----- Logic\Update.ps1 -----
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

# ----- Logic\Clean.ps1 -----
# =====================================================================
# Clean.ps1  -  data driven cleanup engine (operations live in
#               Data\cleanup.json: explicit paths or named handlers)
# =====================================================================

function Test-BatSafePath {
    param([string]$Path)
    try { $full = [IO.Path]::GetFullPath($Path).TrimEnd('\') } catch { return $false }
    if (-not $full -or $full -match '^[A-Za-z]:$') { return $false }
    $deny = @(
        $env:SystemRoot, "$env:SystemRoot\System32", "$env:SystemRoot\WinSxS", "$env:SystemRoot\SysWOW64",
        $env:USERPROFILE, $env:ProgramFiles, ${env:ProgramFiles(x86)}, $env:ProgramData,
        $env:LOCALAPPDATA, $env:APPDATA, "$env:SystemDrive\Users"
    ) | Where-Object { $_ } | ForEach-Object { $_.TrimEnd('\') }
    foreach ($d in $deny) { if ($full -ieq $d) { return $false } }
    $true
}

function Get-BatItemSize {
    param([string]$Path)
    $i = Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    if (-not $i) { return [long]0 }
    if (-not $i.PSIsContainer) { return [long]$i.Length }
    $m = Get-ChildItem -LiteralPath $Path -Recurse -Force -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
    if ($m.Sum) { return [long]$m.Sum }
    [long]0
}

function Resolve-BatPattern {
    param([string]$Pattern)
    $expanded = [Environment]::ExpandEnvironmentVariables($Pattern)
    if ($expanded -match '[\*\?]') {
        return @(Resolve-Path -Path $expanded -ErrorAction SilentlyContinue | ForEach-Object { $_.ProviderPath })
    }
    if (Test-Path -LiteralPath $expanded) { return @($expanded) }
    @()
}

function Get-BatPatternSize {
    param([string]$Pattern)
    [long]$sum = 0
    foreach ($t in (Resolve-BatPattern $Pattern)) {
        if (Test-BatSafePath $t) { $sum += Get-BatItemSize $t }
    }
    $sum
}

# Deletes the CONTENTS of folders (or the matching files) and returns bytes freed
function Clear-BatPath {
    param([string]$Pattern)
    [long]$freed = 0
    foreach ($t in (Resolve-BatPattern $Pattern)) {
        if (-not (Test-BatSafePath $t)) { Write-BatLog "Skipped protected path: $t" 'WARN'; continue }
        $item = Get-Item -LiteralPath $t -Force -ErrorAction SilentlyContinue
        if (-not $item) { continue }
        $before = Get-BatItemSize $t
        Write-BatLog "Remove-Item -Recurse -Force  $t" 'CMD'
        if ($item.PSIsContainer) {
            Get-ChildItem -LiteralPath $t -Force -ErrorAction SilentlyContinue |
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
        }
        else {
            Remove-Item -LiteralPath $t -Force -ErrorAction SilentlyContinue
        }
        $after = Get-BatItemSize $t
        $gain = $before - $after
        if ($gain -gt 0) { $freed += $gain }
        Write-BatLog ("  {0}  ({1})" -f $t, (Format-BatBytes $gain)) 'INFO'
    }
    $freed
}

# Total shadow copy storage in use (bytes), 0 when it cannot be read
function Get-BatShadowUsed {
    try {
        $m = Get-CimInstance -ClassName Win32_ShadowStorage -ErrorAction Stop | Measure-Object -Property UsedSpace -Sum
        if ($m.Sum) { return [long]$m.Sum }
    }
    catch { }
    [long]0
}

# Runs one named handler. Returns the bytes it freed when that can be measured.
function Invoke-BatSpecial {
    param([string]$Name)
    switch ($Name) {
        'RecycleBin' {
            $before = Get-BatSpecialSize -Name 'RecycleBin'
            Write-BatLog 'Clear-RecycleBin -Force' 'CMD'
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Write-BatLog 'Recycle Bin emptied' 'INFO'
            if ($before) { return [long]$before }
        }
        'FlushDns' { Invoke-BatCmd 'ipconfig' '/flushdns' | Out-Null }
        'ComponentCleanup' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup' | Out-Null }
        'ResetBase' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup /ResetBase' | Out-Null }
        'HibernateOff' {
            $before = Get-BatSpecialSize -Name 'HibernateOff'
            Invoke-BatCmd 'powercfg.exe' '-h off' | Out-Null
            $after = Get-BatSpecialSize -Name 'HibernateOff'
            if ($before -gt $after) { return [long]($before - $after) }
        }
        'EventLogs' {
            $logs = & wevtutil.exe el 2>$null
            $n = 0
            foreach ($l in $logs) { & wevtutil.exe cl $l 2>$null; $n++ }
            Write-BatLog "Cleared $n event log(s)" 'INFO'
        }
        'WindowsOld' {
            $d = Join-Path $env:SystemDrive 'Windows.old'
            if (Test-Path -LiteralPath $d) {
                $before = Get-BatItemSize $d
                Invoke-BatCmd 'takeown.exe' "/F `"$d`" /R /A /D Y" -Silent | Out-Null
                Invoke-BatCmd 'icacls.exe' "`"$d`" /grant *S-1-5-32-544:F /T /C /Q" -Silent | Out-Null
                Remove-Item -LiteralPath $d -Recurse -Force -ErrorAction SilentlyContinue
                $after = [long]0
                if (Test-Path -LiteralPath $d) { $after = Get-BatItemSize $d; Write-BatLog 'Windows.old partly removed (some files locked)' 'WARN' }
                else { Write-BatLog 'Windows.old removed' 'INFO' }
                if ($before -gt $after) { return [long]($before - $after) }
            }
            else { Write-BatLog 'Windows.old not found' 'INFO' }
        }
        'OptimizeDrive' {
            $letter = $env:SystemDrive.TrimEnd(':')
            $media = 'Unspecified'
            try { $media = [string](Get-Partition -DriveLetter $letter -ErrorAction Stop | Get-Disk -ErrorAction Stop | Get-PhysicalDisk -ErrorAction Stop | Select-Object -First 1).MediaType } catch { }
            try {
                if ($media -eq 'HDD') {
                    Write-BatLog "Optimize-Volume -DriveLetter $letter -Defrag  (HDD)" 'CMD'
                    Optimize-Volume -DriveLetter $letter -Defrag -ErrorAction Stop
                }
                else {
                    Write-BatLog "Optimize-Volume -DriveLetter $letter -ReTrim  ($media)" 'CMD'
                    Optimize-Volume -DriveLetter $letter -ReTrim -ErrorAction Stop
                }
                Write-BatLog "Drive $letter optimized" 'OK'
            }
            catch { Write-BatLog "Optimize drive failed: $($_.Exception.Message)" 'ERR' }
        }
        'ShadowOldest' {
            $before = Get-BatShadowUsed
            Invoke-BatCmd 'vssadmin.exe' "delete shadows /for=$($env:SystemDrive) /oldest /quiet" | Out-Null
            $after = Get-BatShadowUsed
            if ($before -gt $after) { return [long]($before - $after) }
        }
        'OldLogs' {
            $cut = (Get-Date).AddDays(-30)
            [long]$bytes = 0; $n = 0
            foreach ($r in @("$env:SystemRoot\Logs", "$env:SystemRoot\Temp")) {
                if (-not (Test-Path -LiteralPath $r)) { continue }
                Write-BatLog "Scanning $r for .log/.etl older than 30 days" 'CMD'
                $files = Get-ChildItem -LiteralPath $r -Recurse -Force -File -ErrorAction SilentlyContinue |
                    Where-Object { ($_.Extension -eq '.log' -or $_.Extension -eq '.etl') -and $_.LastWriteTime -lt $cut }
                foreach ($f in $files) {
                    $len = $f.Length
                    Remove-Item -LiteralPath $f.FullName -Force -ErrorAction SilentlyContinue
                    if (-not (Test-Path -LiteralPath $f.FullName)) { $bytes += $len; $n++ }
                }
            }
            Write-BatLog ("Removed {0} old log file(s) ({1})" -f $n, (Format-BatBytes $bytes)) 'OK'
            return [long]$bytes
        }
        'BrokenShortcuts' {
            $roots = @(
                [Environment]::GetFolderPath('Desktop'),
                [Environment]::GetFolderPath('CommonDesktopDirectory'),
                (Join-Path $env:APPDATA 'Microsoft\Windows\Start Menu\Programs'),
                (Join-Path $env:ProgramData 'Microsoft\Windows\Start Menu\Programs')
            )
            $sh = New-Object -ComObject WScript.Shell
            $n = 0
            foreach ($r in $roots) {
                if (-not $r -or -not (Test-Path -LiteralPath $r)) { continue }
                Write-BatLog "Checking shortcuts in $r" 'CMD'
                foreach ($f in (Get-ChildItem -LiteralPath $r -Filter '*.lnk' -Recurse -Force -File -ErrorAction SilentlyContinue)) {
                    $target = $null
                    try { $target = $sh.CreateShortcut($f.FullName).TargetPath } catch { continue }
                    if (-not $target -or $target -match '^(shell:|\\\\)') { continue }
                    $drive = Split-Path -Path $target -Qualifier -ErrorAction SilentlyContinue
                    if (-not $drive -or -not (Test-Path -LiteralPath $drive)) { continue }
                    if (-not (Test-Path -LiteralPath $target)) {
                        Write-BatLog ("  broken: {0}  ->  {1}" -f $f.FullName, $target) 'INFO'
                        Remove-Item -LiteralPath $f.FullName -Force -ErrorAction SilentlyContinue
                        $n++
                    }
                }
            }
            Write-BatLog "Removed $n broken shortcut(s)" 'OK'
        }
        default { Write-BatLog "Unknown handler: $Name" 'WARN' }
    }
}

function Get-BatSpecialSize {
    param([string]$Name)
    switch ($Name) {
        'WindowsOld' {
            $d = Join-Path $env:SystemDrive 'Windows.old'
            if (Test-Path -LiteralPath $d) { return Get-BatItemSize $d }
            return [long]0
        }
        'HibernateOff' {
            $h = Join-Path $env:SystemDrive 'hiberfil.sys'
            if (Test-Path -LiteralPath $h) { return Get-BatItemSize $h }
            return [long]0
        }
        'OldLogs' {
            $cut = (Get-Date).AddDays(-30)
            [long]$sum = 0
            foreach ($r in @("$env:SystemRoot\Logs", "$env:SystemRoot\Temp")) {
                if (-not (Test-Path -LiteralPath $r)) { continue }
                $m = Get-ChildItem -LiteralPath $r -Recurse -Force -File -ErrorAction SilentlyContinue |
                    Where-Object { ($_.Extension -eq '.log' -or $_.Extension -eq '.etl') -and $_.LastWriteTime -lt $cut } |
                    Measure-Object -Property Length -Sum
                if ($m.Sum) { $sum += [long]$m.Sum }
            }
            return $sum
        }
        'RecycleBin' {
            try {
                $sh = New-Object -ComObject Shell.Application
                $bin = $sh.NameSpace(10)
                [long]$sum = 0
                foreach ($it in $bin.Items()) { $sum += [long]$it.Size }
                return $sum
            }
            catch { return [long]0 }
        }
        default { return $null }
    }
}

function Measure-BatOps {
    param([object[]]$Ops)
    foreach ($op in $Ops) {
        [long]$bytes = 0
        $paths = @($op.paths | Where-Object { $_ })
        $measurable = ($paths.Count -gt 0)
        foreach ($p in $paths) { $bytes += Get-BatPatternSize $p }
        if ($op.special) {
            $spBytes = Get-BatSpecialSize -Name $op.special
            if ($null -ne $spBytes) {
                $bytes += $spBytes
                $measurable = $true
            }
        }
        if ($measurable) { Write-BatLog ('{0}: {1}' -f $op.name, (Format-BatBytes $bytes)) 'INFO' }
        [pscustomobject]@{ Id = $op.id; Bytes = $bytes; Measurable = $measurable }
    }
}

function Invoke-BatCleanOps {
    param([object[]]$Ops)
    [long]$total = 0
    foreach ($op in $Ops) {
        Write-BatLog "Cleaning: $($op.name)" 'STEP'
        [long]$freed = 0
        $stopped = @()
        foreach ($s in @($op.services)) {
            if (-not $s) { continue }
            $svc = Get-Service -Name $s -ErrorAction SilentlyContinue
            if ($svc -and $svc.Status -eq 'Running') {
                Write-BatLog "Stop-Service -Name $s -Force" 'CMD'
                Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
                $stopped += $s
                Write-BatLog "  stopped service $s" 'INFO'
            }
        }
        foreach ($p in @($op.paths)) {
            if ($p) { $freed += (Clear-BatPath -Pattern $p) }
        }
        if ($op.special) {
            $sp = @(Invoke-BatSpecial -Name $op.special) | Where-Object { $_ -is [long] } | Select-Object -Last 1
            if ($null -ne $sp -and $sp -gt 0) { $freed += [long]$sp }
        }
        foreach ($s in $stopped) {
            Write-BatLog "Start-Service -Name $s" 'CMD'
            Start-Service -Name $s -ErrorAction SilentlyContinue
            Write-BatLog "  started service $s" 'INFO'
        }
        $total += $freed
        if ($freed -gt 0) { Write-BatLog ('  freed {0}' -f (Format-BatBytes $freed)) 'OK' }
    }
    Write-BatLog ('Total freed (measured paths): {0}' -f (Format-BatBytes $total)) 'OK'
}

# ----- Logic\Fixes.ps1 -----
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
    $stamp = Get-Date -Format 'yyyyMMddHHmmss'
    foreach ($d in @("$env:SystemRoot\SoftwareDistribution", "$env:SystemRoot\System32\catroot2")) {
        if (Test-Path -LiteralPath $d) {
            $leaf = Split-Path $d -Leaf
            Get-ChildItem -Path (Split-Path $d -Parent) -Filter "$leaf.bak*" -Force -ErrorAction SilentlyContinue |
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            $bakName = "$leaf.bak-$stamp"
            try {
                Rename-Item -LiteralPath $d -NewName $bakName -ErrorAction Stop
                Write-BatLog "  renamed $d to $bakName" 'OK'
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
            # Clear both IPv4 and IPv6 DNS first so stale DHCPv6 servers do not leak
            Set-DnsClientServerAddress -InterfaceIndex $a.ifIndex -ResetServerAddresses -ErrorAction Stop
            if (@($IPv4).Count -eq 0) {
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

# ----- Logic\Debloat.ps1 -----
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

# ----- Logic\Tweaks.ps1 -----
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

# ----- UI\Gui.ps1 -----
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
function Get-BatTweakItems {
    foreach ($i in @($global:Bat.TweakItems)) { if ($null -ne $i) { $i } }
}

function Update-BatTweakCounter {
    if (-not $BatUI.TweakCounter) { return }
    $all = @(Get-BatTweakItems)
    $sel = @($all | Where-Object { $_.Checked })
    $careful = @($sel | Where-Object { $_.Risk -eq 'Careful' }).Count
    $applied = @($all | Where-Object { $_.Status -eq 'Applied' }).Count
    $BatUI.TweakCounter.Text = "$($sel.Count) selected ($careful careful)   |   $applied of $($all.Count) already applied on this PC"
}

function Show-BatTweakGroups {
    $panel = $BatUI.TweakHost
    $panel.Children.Clear()
    $global:Bat.TweakGroups = New-Object System.Collections.ArrayList
    $items = @(Get-BatTweakItems)
    $cats = New-Object System.Collections.ArrayList
    foreach ($c in 'Essential Tweaks', 'Customize Preferences', 'Advanced Tweaks - CAUTION', 'Performance Plans - NOT FOR LAPTOPS') {
        if (@($items | Where-Object { $_.Group -eq $c }).Count -gt 0) { [void]$cats.Add($c) }
    }
    foreach ($i in $items) { if (-not $cats.Contains($i.Group)) { [void]$cats.Add($i.Group) } }
    $template = $BatUI.Win.FindResource('TweakRow')
    $first = $true
    foreach ($c in $cats) {
        $rows = @($items | Where-Object { $_.Group -eq $c })
        $list = New-Object 'System.Collections.Generic.List[BatItem]'
        foreach ($i in $rows) { $list.Add($i) }
        $grp = New-BatGroupHeader -Title ('{0}   ({1})' -f $c, $rows.Count) -Rows $list
        [void]$global:Bat.TweakGroups.Add($grp)
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

function Start-BatTweakScan {
    $list = @(Get-BatTweakItems | ForEach-Object { $_.Data })
    if ($list.Count -eq 0) { return }
    Invoke-BatAsync -Title 'Detect tweak status' -ArgumentList @(, $list) `
        -Work { param($list) Get-BatTweakStates -Tweaks $list } `
        -OnDone {
            param($r)
            $map = @{}
            foreach ($x in @($r)) { if ($x) { $map[$x.Id] = $x.State } }
            foreach ($i in (Get-BatTweakItems)) {
                if (-not $i.Enabled) { continue }
                $st = $map[$i.Id]
                if ($st -eq 'Applied') { $i.Status = 'Applied' }
                elseif ($st -eq 'Partial') { $i.Status = 'Partly applied' }
                elseif ($st -eq 'Off') { $i.Status = 'Not applied' }
                elseif ($i.Data.Type -eq 'Button') { $i.Status = 'Run action' }
                else { $i.Status = 'Unknown' }
            }
            $global:Bat.TweaksScanned = $true
            Update-BatTweakCounter
        }
}

function Start-BatTweakAction {
    param([string]$Mode)
    $sel = @(Get-BatTweakItems | Where-Object { $_.Checked -and $_.Enabled })
    if ($sel.Count -eq 0) { Write-BatLog 'Select at least one tweak first' 'WARN'; return }
    $careful = @($sel | Where-Object { $_.Risk -eq 'Careful' })
    if ($careful.Count -gt 0) {
        $names = ($careful | ForEach-Object { '- ' + $_.Name }) -join "`n"
        if (-not (Show-BatConfirm "These selected tweaks are marked CAREFUL:`n`n$names`n`nContinue?")) { return }
    }
    $list = @($sel | ForEach-Object { $_.Data })
    if ($Mode -eq 'Apply') {
        $rp = [bool]$BatUI.ChkTweakRestore.IsChecked
        Invoke-BatAsync -Title "Apply $($list.Count) tweak(s)" -ArgumentList @($list, $rp) `
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
    $u.BtnRefreshTweaks.Add_Click({ Start-BatTweakScan })
    $u.BtnTweakRecommended.Add_Click({ foreach ($i in (Get-BatTweakItems)) { $i.Checked = ($i.Enabled -and $i.Risk -eq 'Safe' -and $i.Status -ne 'Applied') } })
    $u.BtnTweakNone.Add_Click({ foreach ($i in (Get-BatTweakItems)) { $i.Checked = $false } })
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


Start-BatToolkit
