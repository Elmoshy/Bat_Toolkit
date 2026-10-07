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
    {"id":"inet-cache","group":"Quick","name":"Internet cache (INetCache)","desc":"Legacy Windows internet cache","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\Windows\\INetCache"]},
    {"id":"dns-cache","group":"Quick","name":"DNS resolver cache","desc":"Runs ipconfig /flushdns","risk":"Safe","safe":true,"speed":"Instant","special":"FlushDns"},
    {"id":"wu-cache","group":"System","name":"Windows Update download cache","desc":"SoftwareDistribution\\Download (services are stopped then restarted)","risk":"Safe","safe":true,"speed":"Seconds","services":["wuauserv","bits"],"paths":["%SystemRoot%\\SoftwareDistribution\\Download"]},
    {"id":"delivery-opt","group":"System","name":"Delivery Optimization cache","desc":"Peer to peer update cache","risk":"Safe","safe":true,"speed":"Seconds","services":["dosvc"],"paths":["%SystemRoot%\\ServiceProfiles\\NetworkService\\AppData\\Local\\Microsoft\\Windows\\DeliveryOptimization\\Cache","%ProgramData%\\Microsoft\\Windows\\DeliveryOptimization\\Cache"]},
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
    {"id":"app-onedrive-logs","group":"Advanced","name":"OneDrive logs","desc":"Log files only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Microsoft\\OneDrive\\logs"]},
    {"id":"cache-opera","group":"Quick","name":"Opera cache","desc":"Cache folder of Opera Stable","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Opera Software\\Opera Stable\\Cache"]},
    {"id":"store-cache","group":"System","name":"Microsoft Store cache","desc":"Local cache of the Store app, rebuilt automatically","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\Packages\\Microsoft.WindowsStore_8wekyb3d8bbwe\\LocalCache"]},
    {"id":"gpu-vendor-cache","group":"Advanced","name":"GPU vendor shader caches","desc":"NVIDIA DXCache and GLCache and AMD DxCache, rebuilt by games","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\NVIDIA\\DXCache","%LOCALAPPDATA%\\NVIDIA\\GLCache","%LOCALAPPDATA%\\AMD\\DxCache"]},
    {"id":"app-epic-webcache","group":"Advanced","name":"Epic Games Launcher web cache","desc":"Launcher web cache only","risk":"Safe","safe":true,"speed":"Seconds","paths":["%LOCALAPPDATA%\\EpicGamesLauncher\\Saved\\webcache*"]},
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
  "palette": "Sage peridot morning  #345C32 deep green  #9CAC54 peridot  #A7F0DD mint  #97CD97 sage",
  "themes": {
    "dark": {
      "Bg": "#0E1A11",
      "Side": "#14261A",
      "Panel": "#1A2F1F",
      "Panel2": "#345C32",
      "Line": "#2F5434",
      "Fg": "#E6F5EC",
      "Dim": "#9DB8A5",
      "Accent": "#A7F0DD",
      "Accent2": "#9CAC54",
      "Hover": "#97CD97",
      "OnHover": "#0E1A11",
      "OnAccent": "#0E1A11"
    },
    "light": {
      "Bg": "#F1F7EE",
      "Side": "#E3EFDC",
      "Panel": "#FFFFFF",
      "Panel2": "#D9EAD2",
      "Line": "#C3D9BA",
      "Fg": "#1B3320",
      "Dim": "#5F7A63",
      "Accent": "#345C32",
      "Accent2": "#9CAC54",
      "Hover": "#A7F0DD",
      "OnHover": "#12281A",
      "OnAccent": "#FFFFFF"
    }
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
    <!-- Theme tokens. Defaults = dark. Data\themes.json holds dark and light (Sage peridot morning)
         and Set-BatTheme swaps these brushes at run time. -->
    <SolidColorBrush x:Key="Bg" Color="#0E1A11"/>
    <SolidColorBrush x:Key="Side" Color="#14261A"/>
    <SolidColorBrush x:Key="Panel" Color="#1A2F1F"/>
    <SolidColorBrush x:Key="Panel2" Color="#345C32"/>
    <SolidColorBrush x:Key="Line" Color="#2F5434"/>
    <SolidColorBrush x:Key="Fg" Color="#E6F5EC"/>
    <SolidColorBrush x:Key="Dim" Color="#9DB8A5"/>
    <SolidColorBrush x:Key="Accent" Color="#A7F0DD"/>
    <SolidColorBrush x:Key="Accent2" Color="#9CAC54"/>
    <SolidColorBrush x:Key="Hover" Color="#97CD97"/>
    <SolidColorBrush x:Key="OnHover" Color="#0E1A11"/>
    <SolidColorBrush x:Key="OnAccent" Color="#0E1A11"/>

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
                <Setter TargetName="Bd" Property="BorderBrush" Value="{DynamicResource Hover}"/>
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
                <Path x:Name="Mark" Data="M3,8 L6.5,11.5 L12.5,4.5" Stroke="{DynamicResource OnAccent}" StrokeThickness="2"
                      StrokeStartLineCap="Round" StrokeEndLineCap="Round" StrokeLineJoin="Round" Visibility="Collapsed"/>
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
    </Style>

    <Style TargetType="TabControl">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Padding" Value="0,14,0,0"/>
    </Style>

    <Style TargetType="TabItem">
      <Setter Property="Foreground" Value="{DynamicResource Dim}"/>
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
      <Setter Property="RowHeight" Value="34"/>
    </Style>

    <Style TargetType="DataGridRow">
      <Setter Property="Background" Value="{DynamicResource Panel}"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Style.Triggers>
        <Trigger Property="IsMouseOver" Value="True">
          <Setter Property="Background" Value="{DynamicResource Panel2}"/>
        </Trigger>
        <Trigger Property="IsSelected" Value="True">
          <Setter Property="Background" Value="{DynamicResource Panel2}"/>
          <Setter Property="Foreground" Value="{DynamicResource Accent}"/>
        </Trigger>
      </Style.Triggers>
    </Style>
    <Style TargetType="DataGridCell">
      <Setter Property="Background" Value="Transparent"/>
      <Setter Property="BorderThickness" Value="0"/>
      <Setter Property="Foreground" Value="{DynamicResource Fg}"/>
      <Style.Triggers>
        <Trigger Property="IsSelected" Value="True">
          <Setter Property="Background" Value="Transparent"/>
          <Setter Property="Foreground" Value="{DynamicResource Accent}"/>
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
  </Window.Resources>

  <Grid>
    <Grid.ColumnDefinitions>
      <ColumnDefinition Width="Auto"/>
      <ColumnDefinition Width="*"/>
    </Grid.ColumnDefinitions>

    <!-- SIDEBAR -->
    <Border x:Name="Sidebar" Grid.Column="0" Width="236" Margin="14" CornerRadius="18" Background="{DynamicResource Side}" BorderBrush="{DynamicResource Line}" BorderThickness="1">
      <DockPanel>
        <StackPanel DockPanel.Dock="Top" Margin="0,10,0,12">
          <Button x:Name="BtnToggle" Style="{StaticResource Nav}" ToolTip="Collapse / Expand sidebar">
            <StackPanel Orientation="Horizontal">
              <TextBlock Text="&#x2630;" Width="28" FontSize="16"/>
              <TextBlock x:Name="SideTitle" Text="BAT TOOLKIT" FontWeight="Bold" FontSize="15" Foreground="{DynamicResource Accent}"/>
            </StackPanel>
          </Button>
        </StackPanel>
        <StackPanel DockPanel.Dock="Bottom">
          <Button x:Name="BtnTheme" Style="{StaticResource Nav}" ToolTip="Switch between the dark and light theme">
            <StackPanel Orientation="Horizontal">
              <TextBlock x:Name="ThemeIcon" Text="&#x263E;" Width="28" FontSize="15"/>
              <TextBlock x:Name="LblTheme" Text="Light theme"/>
            </StackPanel>
          </Button>
          <Border BorderBrush="{DynamicResource Line}" BorderThickness="0,1,0,0" Margin="14,6,14,0" Padding="0,12,0,14">
            <TextBlock x:Name="DriveInfo" Text="C:" Style="{StaticResource Dimmed}" TextWrapping="Wrap"/>
          </Border>
        </StackPanel>
        <StackPanel>
          <Button x:Name="NavInstall" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F4E6;" Width="28"/><TextBlock x:Name="LblInstall" Text="Install Apps"/></StackPanel></Button>
          <Button x:Name="NavUpdate" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F504;" Width="28"/><TextBlock x:Name="LblUpdate" Text="Update Apps"/></StackPanel></Button>
          <Button x:Name="NavClean" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F9F9;" Width="28"/><TextBlock x:Name="LblClean" Text="Clean C:"/></StackPanel></Button>
          <Button x:Name="NavTweaks" Style="{StaticResource Nav}" IsEnabled="False"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F6E0;" Width="28"/><TextBlock x:Name="LblTweaks" Text="Tweaks (paused)"/></StackPanel></Button>
          <Button x:Name="NavFixes" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F527;" Width="28"/><TextBlock x:Name="LblFixes" Text="Fixes and DNS"/></StackPanel></Button>
          <Button x:Name="NavDebloat" Style="{StaticResource Nav}"><StackPanel Orientation="Horizontal"><TextBlock Text="&#x1F5D1;" Width="28"/><TextBlock x:Name="LblDebloat" Text="Debloat"/></StackPanel></Button>
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
          <Border Grid.Row="0" Background="{DynamicResource Panel}" Padding="16,10" CornerRadius="14" Margin="0,0,0,14">
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
                  </WrapPanel>
                  <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                    <StackPanel x:Name="CatalogPanel"/>
                  </ScrollViewer>
                </Grid>
                <Border Grid.Column="1" Background="{DynamicResource Panel}" CornerRadius="14" Padding="16">
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
              <RadioButton x:Name="RbByTime" Content="How long it takes" VerticalAlignment="Center"/>
            </StackPanel>
          </StackPanel>
          <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
            <StackPanel x:Name="CleanHost" Margin="0,0,8,0"/>
          </ScrollViewer>
        </Grid>

        <!-- FIXES / DNS -->
        <ScrollViewer x:Name="PageFixes" Visibility="Collapsed" VerticalScrollBarVisibility="Auto">
          <StackPanel>
            <TextBlock Text="Repair" FontSize="17" FontWeight="SemiBold" Margin="0,0,0,12" Foreground="{DynamicResource Accent}"/>
            <Border Background="{DynamicResource Panel}" CornerRadius="14" Padding="18,16" Margin="0,0,0,14">
              <DockPanel><Button x:Name="BtnResetWU" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Reset Windows Update"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Stops the update services, renames SoftwareDistribution and catroot2, clears stuck BITS downloads and starts the services again."/></DockPanel>
            </Border>
            <Border Background="{DynamicResource Panel}" CornerRadius="14" Padding="18,16" Margin="0,0,0,14">
              <DockPanel><Button x:Name="BtnResetNet" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Reset Network"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Flushes DNS, re-registers DNS and resets Winsock and the IP stack. A restart is needed afterwards."/></DockPanel>
            </Border>
            <Border Background="{DynamicResource Panel}" CornerRadius="14" Padding="18,16" Margin="0,0,0,24">
              <DockPanel><Button x:Name="BtnRepairSys" DockPanel.Dock="Right" Margin="12,0,0,0" Content="Scan and Repair System Files"/>
                <TextBlock TextWrapping="Wrap" VerticalAlignment="Center" Style="{StaticResource Dimmed}"
                           Text="Runs DISM RestoreHealth then SFC /scannow. This can take a long time."/></DockPanel>
            </Border>
            <TextBlock Text="DNS" FontSize="17" FontWeight="SemiBold" Margin="0,0,0,12" Foreground="{DynamicResource Accent}"/>
            <Border Background="{DynamicResource Panel}" CornerRadius="14" Padding="18,16">
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
      <Border Grid.Row="4" Background="{DynamicResource Panel}" CornerRadius="14" Padding="14,12">
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
        $o = [ordered]@{}
        for ($c = 0; $c -lt $names.Count; $c++) {
            $s = $starts[$c]
            $e = if ($c -lt $names.Count - 1) { $starts[$c + 1] } else { $ln.Length }
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
    $out = @()
    if ($Mode -ne 'choco' -and (Test-BatCommand winget)) {
        $r = Invoke-BatCmd 'winget' "search `"$Query`" --accept-source-agreements" -Silent
        $rows = @(ConvertFrom-BatWingetTable $r.Lines)
        Write-BatLog "winget: $($rows.Count) result(s)" 'INFO'
        foreach ($x in $rows) { $out += [pscustomobject]@{ Name = $x.Name; Id = $x.Id; Version = $x.Version; Available = ''; Source = 'winget' } }
    }
    if ($Mode -ne 'winget' -and (Test-BatCommand choco)) {
        $r = Invoke-BatCmd 'choco' "search `"$Query`" --limit-output" -Silent
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
        $r = Invoke-BatCmd 'choco' 'list --limit-output' -Silent
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
    $out
}

function Get-BatPkgCommand {
    param([string]$Action, [string]$Source, [string]$Id)
    if ($Source -eq 'winget') {
        $common = '--silent --accept-source-agreements'
        switch ($Action) {
            'install'   { return @('winget', "install --id `"$Id`" -e --accept-package-agreements $common") }
            'uninstall' { return @('winget', "uninstall --id `"$Id`" -e $common") }
            'upgrade'   { return @('winget', "upgrade --id `"$Id`" -e --accept-package-agreements $common") }
        }
    }
    else {
        switch ($Action) {
            'install'   { return @('choco', "install $Id -y --no-progress") }
            'uninstall' { return @('choco', "uninstall $Id -y --no-progress") }
            'upgrade'   { return @('choco', "upgrade $Id -y --no-progress") }
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
    if ($full.Length -le 10) { return $false }
    if ($full -match '^[A-Za-z]:$') { return $false }
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

function Invoke-BatSpecial {
    param([string]$Name)
    switch ($Name) {
        'RecycleBin' {
            Write-BatLog 'Clear-RecycleBin -Force' 'CMD'
            Clear-RecycleBin -Force -ErrorAction SilentlyContinue
            Write-BatLog 'Recycle Bin emptied' 'INFO'
        }
        'FlushDns' { Invoke-BatCmd 'ipconfig' '/flushdns' | Out-Null }
        'ComponentCleanup' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup' | Out-Null }
        'ResetBase' { Invoke-BatCmd 'dism.exe' '/Online /Cleanup-Image /StartComponentCleanup /ResetBase' | Out-Null }
        'HibernateOff' { Invoke-BatCmd 'powercfg.exe' '-h off' | Out-Null }
        'EventLogs' {
            $logs = & wevtutil.exe el 2>$null
            $n = 0
            foreach ($l in $logs) { & wevtutil.exe cl $l 2>$null; $n++ }
            Write-BatLog "Cleared $n event log(s)" 'INFO'
        }
        'WindowsOld' {
            $d = Join-Path $env:SystemDrive 'Windows.old'
            if (Test-Path -LiteralPath $d) {
                Invoke-BatCmd 'takeown.exe' "/F `"$d`" /R /A /D Y" -Silent | Out-Null
                Invoke-BatCmd 'icacls.exe' "`"$d`" /grant *S-1-5-32-544:F /T /C /Q" -Silent | Out-Null
                Remove-Item -LiteralPath $d -Recurse -Force -ErrorAction SilentlyContinue
                if (Test-Path -LiteralPath $d) { Write-BatLog 'Windows.old partly removed (some files locked)' 'WARN' }
                else { Write-BatLog 'Windows.old removed' 'INFO' }
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
            Invoke-BatCmd 'vssadmin.exe' "delete shadows /for=$($env:SystemDrive) /oldest /quiet" | Out-Null
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

function Measure-BatOps {
    param([object[]]$Ops)
    foreach ($op in $Ops) {
        [long]$bytes = 0
        $paths = @($op.paths | Where-Object { $_ })
        foreach ($p in $paths) { $bytes += Get-BatPatternSize $p }
        Write-BatLog ('{0}: {1}' -f $op.name, (Format-BatBytes $bytes)) 'INFO'
        [pscustomobject]@{ Id = $op.id; Bytes = $bytes; Measurable = ($paths.Count -gt 0) }
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
        if ($op.special) { Invoke-BatSpecial -Name $op.special }
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

Start-BatToolkit
