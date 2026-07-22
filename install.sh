#!/bin/sh
# One-command student install for the Classroom Live extension (macOS / Linux):
#   curl -fsSL https://raw.githubusercontent.com/penneytech/classroom-live-releases/main/install.sh | sh
# Downloads the latest released VSIX and installs it into VS Code. After this one run,
# the extension keeps itself up to date automatically.
set -e

URL="https://github.com/penneytech/classroom-live-releases/releases/latest/download/classroom-live-student.vsix"
VSIX="$(mktemp -d)/classroom-live-student.vsix"

echo "Downloading the Classroom Live extension..."
curl -fsSL "$URL" -o "$VSIX"

# The `code` CLI isn't on PATH on macOS until the user runs "Install 'code' command in PATH",
# which students never have — so fall back to the app bundle's copy directly.
if command -v code >/dev/null 2>&1; then
  CODE="code"
elif [ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]; then
  CODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
else
  echo "Could not find VS Code. Install VS Code first, then run this again."
  exit 1
fi

"$CODE" --install-extension "$VSIX" >/dev/null
rm -f "$VSIX"
echo ""
echo "Done! Restart VS Code — you'll see the Classroom icon in the left sidebar."
