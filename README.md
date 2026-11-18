<div align="center">

# 🦇 BatToolkit

### The Ultimate Windows Optimization, Debloating & Setup Utility

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg?style=for-the-badge\&logo=powershell)](https://microsoft.com/powershell)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/Elmoshy/Bat_Toolkit?style=for-the-badge)](https://github.com/Elmoshy/Bat_Toolkit/stargazers)
[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-0078D6?style=for-the-badge\&logo=windows)](https://microsoft.com/windows)

An open-source, lightweight Windows toolkit designed to streamline software installation, remove pre-installed bloatware, and optimize system performance with a single command.

---

### 🚀 Quick Start

Open **PowerShell as Administrator** and run:

```powershell
irm https://tinyurl.com/bat-toolkit | iex
```

**Or via direct GitHub URL:**

```powershell
irm https://raw.githubusercontent.com/Elmoshy/Bat_Toolkit/main/BatToolkit.ps1 | iex
```

## 🌟 Key Features

* **📦 App Installer:** Quickly install popular applications using `winget` and `chocolatey`, categorized for essential tools, browsers, development suites, and gaming

* **🗑️ Smart Debloater:** Scan and remove unnecessary pre-installed Windows UWP apps while safeguarding vital system components

* **⚡ System Tweaks:** Enhance responsiveness, improve privacy settings, and disable unwanted background telemetry

* **🧹 Cache Cleaner:** Reclaim disk space by clearing temporary files, logs, and system garbage

## 🛡️ Built-in Safety Controls

BatToolkit enforces a **Hard Protection List** to prevent accidental removal of core Windows components and help maintain system stability

* Windows Store & Installer (`Microsoft.WindowsStore`, `Microsoft.DesktopAppInstaller`)

* Windows Security Center (`Microsoft.SecHealthUI`)

* Core Runtimes & Shell Extensions (`Microsoft.VCLibs`, `.NET Native`, `WebView2`)

## 🛠️ Included Applications

| **Category**       | **Apps**                                                                                                        |
| ------------------ | --------------------------------------------------------------------------------------------------------------- |
| **Essentials**     | 7-Zip, VLC, Notepad++, Everything, SumatraPDF, PowerToys, Bitwarden, WinRAR, ShareX, qBittorrent                |
| **Browsers**       | Google Chrome, Mozilla Firefox, Brave, Opera, Vivaldi, Tor Browser                                              |
| **Development**    | VS Code, Git, GitHub Desktop, Python 3.12, Node.js LTS, PowerShell 7, Windows Terminal, Docker Desktop, Postman |
| **Utilities**      | WinDirStat, CPU-Z, HWMonitor, Rufus, Balena Etcher, AutoHotkey, MSI Afterburner, TeamViewer, AnyDesk            |
| **Communications** | Discord, Telegram, WhatsApp, Zoom, Microsoft Teams, Slack, Thunderbird                                          |
| **Multimedia**     | OBS Studio, Audacity, Spotify, HandBrake, GIMP, Inkscape, Krita, Blender                                        |
| **Gaming**         | Steam, Epic Games Launcher, GOG Galaxy, EA app, Ubisoft Connect                                                 |

## 🤝 Contributing

Contributions are welcome! If you want to add new apps, improve scripts, or report bugs:

1. Fork the Repository
2. Create a Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit Changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for details

</div>
