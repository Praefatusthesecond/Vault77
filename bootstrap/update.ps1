Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Info($m) { Write-Host "[INFO] $m" }

$RepoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $RepoRoot

Write-Info "Pulling latest changes..."
git pull

Write-Info "Running setup steps to re-verify Ollama + settings..."
& (Join-Path $PSScriptRoot "setup.ps1")
