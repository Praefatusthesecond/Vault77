#requires -Version 5.1
[CmdletBinding()]
param(
  # Repo you want to install from (set this to your real repo URL in the committed file)
  [Parameter()]
  [string]$RepoUrl = "https://github.com/<YOUR-USER>/<YOUR-REPO>.git",

  # Default install location
  [Parameter()]
  [string]$InstallDir = "$HOME\Documents\Obsidian\<YOUR-REPO>",

  # Don't attempt to install dependencies (Git/Ollama). Fail if missing.
  [Parameter()]
  [switch]$NoInstallDeps,

  # Don't try to open Obsidian at the end.
  [Parameter()]
  [switch]$NoOpenObsidian
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Info { param([string]$Message) Write-Host "[INFO] $Message" }
function Write-Warn { param([string]$Message) Write-Host "[WARN] $Message" -ForegroundColor Yellow }
function Write-Err  { param([string]$Message) Write-Host "[ERR ] $Message" -ForegroundColor Red }

function Test-CommandExists {
  param([Parameter(Mandatory)][string]$Name)
  return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Test-WinGetAvailable {
  return (Test-CommandExists -Name "winget")
}

function Install-GitIfMissing {
  if (Test-CommandExists -Name "git") {
    Write-Info "Git found."
    return
  }
  if ($NoInstallDeps) {
    throw "Git missing and -NoInstallDeps was set."
  }

  if (Test-WinGetAvailable) {
    Write-Info "Installing Git via winget..."
    winget install --id Git.Git -e --source winget
  } else {
    throw "winget not available. Install Git manually (Git for Windows), then re-run."
  }

  if (-not (Test-CommandExists -Name "git")) {
    throw "Git install did not succeed or PATH not updated. Close/reopen terminal and re-run."
  }
}

function Install-OllamaIfMissing {
  if (Test-CommandExists -Name "ollama") {
    Write-Info "Ollama found."
    return
  }
  if ($NoInstallDeps) {
    throw "Ollama missing and -NoInstallDeps was set."
  }

  if (Test-WinGetAvailable) {
    Write-Info "Installing Ollama via winget..."
    winget install --id Ollama.Ollama -e --source winget
  } else {
    throw "winget not available. Install Ollama manually from https://ollama.com/ then re-run."
  }

  if (-not (Test-CommandExists -Name "ollama")) {
    throw "Ollama install did not succeed or PATH not updated. Close/reopen terminal and re-run."
  }
}

function Update-OrCloneRepo {
  param(
    [Parameter(Mandatory)][string]$Url,
    [Parameter(Mandatory)][string]$Path
  )

  if (Test-Path $Path) {
    if (-not (Test-Path (Join-Path $Path ".git"))) {
      throw "InstallDir exists but is not a git repo: $Path. Move it aside or choose a different -InstallDir."
    }
    Write-Info "Repo already exists. Pulling latest..."
    Push-Location $Path
    try { git pull } finally { Pop-Location }
  } else {
    Write-Info "Cloning repo..."
    $parent = Split-Path $Path -Parent
    if ($parent) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    git clone $Url $Path
  }
}

function Invoke-VaultSetup {
  param([Parameter(Mandatory)][string]$Path)

  $setup = Join-Path $Path "bootstrap\setup.ps1"
  if (-not (Test-Path $setup)) {
    throw "Missing bootstrap/setup.ps1 in repo at $Path. Add the setup scripts first."
  }

  Write-Info "Running vault setup..."
  powershell -ExecutionPolicy Bypass -File $setup
}

function Open-ObsidianVault {
  param([Parameter(Mandatory)][string]$Path)

  if ($NoOpenObsidian) { return }

  # Best effort: Obsidian URI handler should be registered if Obsidian is installed.
  try {
    $encodedPath = [Uri]::EscapeDataString($Path)
    Write-Info "Opening Obsidian (best-effort)..."
    Start-Process "obsidian://open?path=$encodedPath" -ErrorAction SilentlyContinue | Out-Null
  } catch {
    Write-Warn "Could not auto-open Obsidian. Open it manually → 'Open folder as vault' → $Path"
  }
}

# --- Main ---
Write-Info "Target install directory: $InstallDir"

Install-GitIfMissing
Install-OllamaIfMissing
Update-OrCloneRepo -Url $RepoUrl -Path $InstallDir
Invoke-VaultSetup -Path $InstallDir
Open-ObsidianVault -Path $InstallDir

Write-Info "Done. If Obsidian didn’t open: Obsidian → Open folder as vault → $InstallDir"