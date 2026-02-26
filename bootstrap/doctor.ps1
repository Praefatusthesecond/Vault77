Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

function Check($name, $ok, $hint) {
  if ($ok) { Write-Host "[ OK ] $name" }
  else     { Write-Host "[FAIL] $name`n      -> $hint" -ForegroundColor Yellow }
}

$RepoRoot = Split-Path -Parent $PSScriptRoot
$EnvFile  = Join-Path (Join-Path $RepoRoot "env") ".env"

$OllamaHost = "http://127.0.0.1:11434"
$ModelName  = "qwen2.5-3b-copilot-ctx1k:latest"

if (Test-Path $EnvFile) {
  Get-Content $EnvFile | ForEach-Object {
    $line = $_.Trim()
    if ($line -eq "" -or $line.StartsWith("#")) { return }
    $parts = $line.Split("=",2)
    if ($parts.Count -ne 2) { return }
    if ($parts[0].Trim() -eq "OLLAMA_HOST")  { $OllamaHost = $parts[1].Trim() }
    if ($parts[0].Trim() -eq "OLLAMA_MODEL") { $ModelName  = $parts[1].Trim() }
  }
}

$ollama = Get-Command ollama -ErrorAction SilentlyContinue
Check "Ollama CLI in PATH" ($null -ne $ollama) "Install Ollama and ensure 'ollama' is in PATH."

try {
  Invoke-RestMethod -Uri "$OllamaHost/api/tags" -TimeoutSec 5 | Out-Null
  Check "Ollama API reachable" $true ""
} catch {
  Check "Ollama API reachable" $false "Start Ollama. Windows: open Ollama app. Linux: run 'ollama serve'."
}

try {
  $list = & ollama list 2>$null | Out-String
  Check "Model listed (best-effort)" ($list -match [regex]::Escape($ModelName.Split(":")[0])) "Run: ollama create $($ModelName.Split(':')[0]) -f ollama/Modelfile.qwen2.5-3b-copilot-ctx1k"
} catch {
  Check "Model listed (best-effort)" $false "Ollama may not be running."
}

# Smoke test generate
try {
  $body = @{ model=$ModelName; prompt="Reply with one word: OK"; stream=$false } | ConvertTo-Json
  $r = Invoke-RestMethod -Uri "$OllamaHost/api/generate" -Method POST -Body $body -ContentType "application/json" -TimeoutSec 20
  $ok = ($r.response -match "OK")
  Check "Generate API smoke test" $ok "Try pulling/creating the model and re-check."
} catch {
  Check "Generate API smoke test" $false "Model may be missing or the API is blocked by firewall."
}
