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
2. Make it executable: `chmod +x Lume-*-linux-x64.AppImage`
3. Run: `./Lume-*-linux-x64.AppImage`

### 🪟 Windows
1. Download `Lume Setup *.exe` from Releases
2. Run the installer

### 🍎 macOS
1. Download the `.dmg` for your architecture (ARM64 for Apple Silicon, x64 for Intel)
2. Drag Lume to your Applications folder
3. On first launch, right-click and select "Open" to bypass Gatekeeper

---

## 🛠️ Development Setup

1. **Clone the repository:**
    ```bash
    git clone https://github.com/GLYSATVIK/Lume-Autozoom-for-effortless-tutorials..git
    cd Lume
    ```

2. **Install dependencies:**
    ```bash
    npm install
    ```

3. **Set up FFmpeg** (required for recording and export):
    - Place the FFmpeg binary in `binaries/[os]/` directory.

4. **Run in development mode:**
    ```bash
    npm run dev
    ```

---

## ⌨️ Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Play/Pause | `Space` |
| Undo | `Ctrl+Z` |
| Redo | `Ctrl+Shift+Z` |
| Export | `Ctrl+Shift+E` |
| Duplicate Region | `Ctrl+D` |
| Delete Region | `Delete` / `Backspace` |
| Fullscreen Preview | `F` |

---

## 📜 License

This project is licensed under the [GPL-3.0 License](LICENSE).

© 2026 GLYSATVIK. All rights reserved.
