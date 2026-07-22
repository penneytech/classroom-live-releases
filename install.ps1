# One-command student install for the Classroom Live extension (Windows):
#   irm https://raw.githubusercontent.com/penneytech/classroom-live-releases/main/install.ps1 | iex
# (irm|iex runs in-memory, so it works even under a Restricted execution policy.)
# Downloads the latest released VSIX and installs it into VS Code. After this one run,
# the extension keeps itself up to date automatically.
$ErrorActionPreference = "Stop"

$url = "https://github.com/penneytech/classroom-live-releases/releases/latest/download/classroom-live-student.vsix"
$vsix = Join-Path $env:TEMP "classroom-live-student.vsix"

Write-Host "Downloading the Classroom Live extension..."
Invoke-WebRequest -Uri $url -OutFile $vsix

# The installer adds `code` to PATH by default, but only for NEW terminals — and lab images
# sometimes skip it — so check the standard install locations directly as a fallback.
$code = $null
if (Get-Command code -ErrorAction SilentlyContinue) {
  $code = "code"
} else {
  $candidates = @(
    (Join-Path $env:LOCALAPPDATA "Programs\Microsoft VS Code\bin\code.cmd"),
    (Join-Path $env:ProgramFiles "Microsoft VS Code\bin\code.cmd")
  )
  $code = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}
if (-not $code) {
  Write-Host "Could not find VS Code. Install VS Code first, then run this again."
  exit 1
}

& $code --install-extension $vsix | Out-Null
Remove-Item $vsix -ErrorAction SilentlyContinue
Write-Host ""
Write-Host "Done! Restart VS Code - you'll see the Classroom icon in the left sidebar."
