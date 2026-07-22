# Classroom Live — Student Extension

## Install (one time)

Make sure [VS Code](https://code.visualstudio.com/) is installed first. Then:

**Windows** — open **PowerShell** and paste this line, then press Enter:

```powershell
irm https://raw.githubusercontent.com/penneytech/classroom-live-releases/main/install.ps1 | iex
```

**Mac** — open **Terminal** and paste this line, then press Enter:

```sh
curl -fsSL https://raw.githubusercontent.com/penneytech/classroom-live-releases/main/install.sh | sh
```

Restart VS Code when it finishes — you'll see the Classroom icon in the left sidebar.

You only ever do this once: from then on the extension updates itself automatically.

## Manual install (if the command doesn't work)

1. Download [classroom-live-student.vsix](https://github.com/penneytech/classroom-live-releases/releases/latest/download/classroom-live-student.vsix)
2. In VS Code: Extensions panel (puzzle-piece icon) → `...` menu at the top → **Install from VSIX...** → pick the downloaded file
3. Restart VS Code

## About this repo

This repo holds compiled releases only — no source code. Installed extensions check it on
launch and self-update from the latest release; course content is served from `course.json`.
