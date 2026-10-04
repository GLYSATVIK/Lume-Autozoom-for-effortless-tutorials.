# Lume Rebranding Script - replaces all ScreenArc references and rewrites git history
$ErrorActionPreference = "Stop"
Set-Location "C:\Extensions\Lume\Lume"

Write-Host "=== STEP 1: Rename icon files ===" -ForegroundColor Cyan
git mv "public/screenarc-appicon.png" "public/lume-appicon.png"
git mv "public/screenarc-appicon-tray.png" "public/lume-appicon-tray.png"

Write-Host "=== STEP 2: Text replacements across all source files ===" -ForegroundColor Cyan

# Get all text files to process (exclude node_modules, .git, binaries, images)
$files = Get-ChildItem -Recurse -File -Include *.ts,*.tsx,*.json,*.md,*.html,*.js,*.css,*.plist |
    Where-Object { $_.FullName -notmatch '(node_modules|\.git|dist|dist-electron)' }

foreach ($f in $files) {
    $content = Get-Content -Path $f.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }
    $original = $content

    # URL replacements (specific before general)
    $content = $content -replace 'https://github\.com/tamnguyenvan/screenarc-assets/releases/download/v0\.0\.1/', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials./releases/download/v0.0.1/'
    $content = $content -replace 'https://github\.com/tamnguyenvan/screenarc/graphs/contributors', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials./graphs/contributors'
    $content = $content -replace 'https://github\.com/tamnguyenvan/screenarc/releases/latest', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials./releases/latest'
    $content = $content -replace 'https://github\.com/tamnguyenvan/screenarc\.git', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials..git'
    $content = $content -replace 'https://github\.com/tamnguyenvan/screenarc', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'
    $content = $content -replace 'https://github\.com/extencil/screenarc', 'https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'
    $content = $content -replace 'https://raw\.githubusercontent\.com/tamnguyenvan/screenarc/main/', 'https://raw.githubusercontent.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials./main/'
    $content = $content -replace 'https://img\.shields\.io/github/v/release/tamnguyenvan/screenarc', 'https://img.shields.io/github/v/release/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'
    $content = $content -replace 'https://img\.shields\.io/github/license/tamnguyenvan/screenarc', 'https://img.shields.io/github/license/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'
    $content = $content -replace 'https://img\.shields\.io/github/downloads/tamnguyenvan/screenarc', 'https://img.shields.io/github/downloads/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'
    $content = $content -replace 'contrib\.rocks/image\?repo=tamnguyenvan/screenarc', 'contrib.rocks/image?repo=GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.'

    # App identity
    $content = $content -replace 'com\.screenarc\.app', 'com.lume.app'
    $content = $content -replace '"productName": "ScreenArc"', '"productName": "Lume"'

    # Icon file references
    $content = $content -replace 'screenarc-appicon-tray\.png', 'lume-appicon-tray.png'
    $content = $content -replace 'screenarc-appicon\.png', 'lume-appicon.png'
    $content = $content -replace 'screenarc-appicon\.ico', 'lume-appicon.ico'
    $content = $content -replace 'screenarc-appicon\.icns', 'lume-appicon.icns'

    # Directory and file naming
    $content = $content -replace '\.screenarc', '.lume'
    $content = $content -replace 'ScreenArc-recording-', 'Lume-recording-'
    $content = $content -replace 'ScreenArc-\*-', 'Lume-*-'
    $content = $content -replace 'ScreenArc-\$\{version\}', 'Lume-${version}'
    $content = $content -replace '/\^ScreenArc-recording-', '/^Lume-recording-'

    # Storage keys
    $content = $content -replace 'screenarc_lastActivePresetId', 'lume_lastActivePresetId'

    # Package name
    $content = $content -replace '"name": "screenarc"', '"name": "lume"'
    $content = $content -replace '"name": "lume"', '"name": "lume"'

    # Export filename
    $content = $content -replace 'return `ScreenArc-', 'return `Lume-'

    # Git clone commands in docs
    $content = $content -replace 'git clone https://github\.com/tamnguyenvan/screenarc\.git', 'git clone https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials..git'
    $content = $content -replace 'cd screenarc', 'cd Lume'

    # Repo name in update checker
    $content = $content -replace "const repoName = 'screenarc'", "const repoName = 'Lume-Autozoom-for-effortless-tutorials.'"

    # Brand name replacements (careful order - specific first)
    $content = $content -replace 'ScreenArc is recording\.\.\.', 'Lume is recording...'
    $content = $content -replace 'ScreenArc needs Accessibility', 'Lume needs Accessibility'
    $content = $content -replace 'warning about ScreenArc', 'warning about Lume'
    $content = $content -replace 'Contributing to ScreenArc', 'Contributing to Lume'
    $content = $content -replace 'contributing to ScreenArc', 'contributing to Lume'
    $content = $content -replace 'making ScreenArc better', 'making Lume better'
    $content = $content -replace 'ScreenArc stands on', 'Lume stands on'
    $content = $content -replace 'Install ScreenArc', 'Install Lume'
    $content = $content -replace 'Run ScreenArc', 'Run Lume'
    $content = $content -replace 'the ScreenArc app', 'the Lume app'
    $content = $content -replace 'release of ScreenArc', 'release of Lume'

    # Generic brand name (title case)
    $content = $content -replace '\*\*ScreenArc\*\*', '**Lume**'
    $content = $content -replace '# ScreenArc', '# Lume'
    $content = $content -replace '<title>ScreenArc</title>', '<title>Lume</title>'
    $content = $content -replace '>ScreenArc<', '>Lume<'
    $content = $content -replace 'alt="ScreenArc', 'alt="Lume'
    $content = $content -replace '"ScreenArc"', '"Lume"'

    # Remaining loose references
    $content = $content -replace 'ScreenArc -', 'Lume -'
    $content = $content -replace 'ScreenArc ', 'Lume '

    # Author attribution
    $content = $content -replace 'Created with ❤️ by Tam Nguyen\.', 'Created with ❤️ by GLYSATVIK.'
    $content = $content -replace 'Tam Nguyen', 'GLYSATVIK'
    $content = $content -replace 'tamnguyenvan', 'GLYSATVIK'

    # Lowercase screenarc (remaining)
    $content = $content -replace 'screenarc', 'lume'

    if ($content -ne $original) {
        Set-Content -Path $f.FullName -Value $content -NoNewline
        Write-Host "  Updated: $($f.FullName)"
    }
}

Write-Host "=== STEP 3: Rewrite README.md ===" -ForegroundColor Cyan
$readme = @"
# Lume 🎬

<div align="center">
  <h3>✨ Autozoom for effortless tutorials ✨</h3>
</div>

<div align="center">
  <img src="https://img.shields.io/badge/License-GPL--3.0-blue.svg?style=for-the-badge" alt="License" />
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-green?style=for-the-badge" alt="Platform" />
  <img src="https://img.shields.io/badge/Made%20with-Electron-47848F?style=for-the-badge" alt="Electron" />
</div>

---

**Lume** is a smart screen recording and editing tool that makes professional video creation effortless. It automatically tracks your mouse movements and clicks, creating smooth cinematic pan-and-zoom animations that keep viewers focused on what matters. **No manual keyframing needed!**

Perfect for developers, educators, and content creators who want to produce stunning tutorials, demos, and presentations.

## ⭐ Features

- 🎥 **Flexible Capture**: Record your full screen, a specific window, or a custom area with seamless multi-monitor support.
- 👤 **Webcam Overlay**: Add a personal touch by including your webcam feed in the recording.
- 🎬 **Cinematic Mouse Tracking**: Automatically generates smooth pan-and-zoom effects that follow your mouse clicks.
- 🎨 **Powerful Editor**: A visual timeline to trim clips, customize frames, backgrounds (colors, gradients, wallpapers), shadows, and more.
- 📏 **Instant Aspect Ratios**: Switch between 16:9 (YouTube), 9:16 (Shorts/TikTok), and 1:1 (Instagram) with a single click.
- 💾 **Preset System**: Save your favorite styles and apply them instantly to future projects.
- 📤 **High-Quality Export**: Export as MP4 or GIF with resolutions up to 4K.
- 🎛️ **Video Filters**: Adjust brightness, contrast, and saturation directly in preview and export.
- 🌙 **Light & Dark Mode**: Full theme support with customizable accent colors.

---

## 🚀 Installation

### 🐧 Linux

#### Prerequisites
- **X11 Display Server Required** - Lume currently doesn't support Wayland.

#### Steps
1. Download the latest AppImage from Releases
2. Make it executable: ``chmod +x Lume-*-linux-x64.AppImage``
3. Run: ``./Lume-*-linux-x64.AppImage``

### 🪟 Windows
1. Download ``Lume Setup *.exe`` from Releases
2. Run the installer

### 🍎 macOS
1. Download the ``.dmg`` for your architecture (ARM64 for Apple Silicon, x64 for Intel)
2. Drag Lume to your Applications folder
3. On first launch, right-click and select "Open" to bypass Gatekeeper

---

## 🛠️ Development Setup

1. **Clone the repository:**
    ``````bash
    git clone https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials..git
    cd Lume
    ``````

2. **Install dependencies:**
    ``````bash
    npm install
    ``````

3. **Set up FFmpeg** (required for recording and export):
    - Place the FFmpeg binary in ``binaries/[os]/`` directory.

4. **Run in development mode:**
    ``````bash
    npm run dev
    ``````

---

## ⌨️ Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Play/Pause | ``Space`` |
| Undo | ``Ctrl+Z`` |
| Redo | ``Ctrl+Shift+Z`` |
| Export | ``Ctrl+Shift+E`` |
| Duplicate Region | ``Ctrl+D`` |
| Delete Region | ``Delete`` / ``Backspace`` |
| Fullscreen Preview | ``F`` |

---

## 📜 License

This project is licensed under the [GPL-3.0 License](LICENSE).

© 2026 GLYSATVIK. All rights reserved.
"@
Set-Content -Path "C:\Extensions\Lume\Lume\README.md" -Value $readme

Write-Host "=== STEP 4: Rewrite CONTRIBUTING.md ===" -ForegroundColor Cyan
$contributing = @"
# Contributing to Lume

First off, thank you for considering contributing to Lume! Every contribution helps make this tool better for creators everywhere.

## How to Contribute

1.  **Fork the repository**
2.  **Clone your fork:** ``git clone https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials..git``
3.  **Create a feature branch:** ``git checkout -b feature/my-awesome-feature``
4.  **Make your changes** and commit them with clear, descriptive messages
5.  **Push to your fork:** ``git push origin feature/my-awesome-feature``
6.  **Open a Pull Request** against the ``main`` branch

## Code Style
- Use TypeScript for all new code
- Follow the existing code patterns and naming conventions
- Run ``npm run lint`` before submitting

## Bug Reports
Please open an issue with a clear description, steps to reproduce, and your environment details.
"@
Set-Content -Path "C:\Extensions\Lume\Lume\CONTRIBUTING.md" -Value $contributing

Write-Host "=== STEP 5: Rewrite AboutTab.tsx ===" -ForegroundColor Cyan
$aboutTab = @"
import { useState, useEffect } from 'react'
import { Button } from '../ui/button'
import { BrandGithub } from 'tabler-icons-react'

export function AboutTab() {
  const [appVersion, setAppVersion] = useState('...')

  useEffect(() => {
    window.electronAPI.getVersion().then((version) => {
      setAppVersion(version)
    })
  }, [])

  const openLink = (url: string) => {
    window.electronAPI.openExternal(url)
  }

  return (
    <div className="p-8 text-center flex flex-col items-center justify-center h-full">
      <img src="media://lume-appicon.png" alt="Lume Logo" className="w-24 h-24 mb-4 rounded-3xl shadow-lg" />
      <h2 className="text-2xl font-bold text-foreground">Lume</h2>
      <p className="text-sm text-muted-foreground mb-6">Version {appVersion}</p>

      <div className="text-sm text-foreground space-y-2">
        <p>Created with ❤️ by GLYSATVIK.</p>
        <p>Autozoom for effortless tutorials — record, edit, and export with cinematic flair.</p>
      </div>

      <div className="mt-8 flex items-center gap-4">
        <Button variant="secondary" onClick={() => openLink('https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials.')}>
          <BrandGithub className="w-4 h-4 mr-2" />
          GitHub Repository
        </Button>
      </div>

      <p className="absolute bottom-4 text-xs text-muted-foreground">Built with Electron, React, and TypeScript.</p>
    </div>
  )
}
"@
Set-Content -Path "C:\Extensions\Lume\Lume\src\components\settings\AboutTab.tsx" -Value $aboutTab

Write-Host "=== STEP 6: Commit rebranding ===" -ForegroundColor Cyan
git add -A
git commit -m "chore: rebrand ScreenArc to Lume across entire codebase" --quiet

Write-Host "=== STEP 7: Rewrite ALL git history authors ===" -ForegroundColor Cyan
# Use git filter-branch to rewrite every commit's author/committer
$env:FILTER_BRANCH_SQUELCH_WARNING = "1"
git filter-branch -f --env-filter '
    export GIT_AUTHOR_NAME="GLYSATVIK"
    export GIT_AUTHOR_EMAIL="codeforcessatvik@gmail.com"
    export GIT_COMMITTER_NAME="GLYSATVIK"
    export GIT_COMMITTER_EMAIL="codeforcessatvik@gmail.com"
' -- --all

Write-Host "=== STEP 8: Cleanup filter-branch refs ===" -ForegroundColor Cyan
git for-each-ref --format="%(refname)" refs/original/ | ForEach-Object { git update-ref -d $_ }
git reflog expire --expire=now --all
git gc --prune=now

Write-Host ""
Write-Host "=== ALL DONE ===" -ForegroundColor Green
Write-Host "Verifying..." -ForegroundColor Yellow
git log --format="%an <%ae>" | Sort-Object -Unique
Write-Host ""
git log --oneline -5
