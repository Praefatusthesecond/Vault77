#requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Info($m) { Write-Host "[INFO] $m" }
function Write-Warn($m) { Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Write-Err ($m) { Write-Host "[ERR ] $m" -ForegroundColor Red }

$RepoRoot = Split-Path -Parent $PSScriptRoot
$EnvDir   = Join-Path $RepoRoot "env"
$EnvFile  = Join-Path $EnvDir ".env"
$EnvEx    = Join-Path $EnvDir ".env.example"
$ModelFile= Join-Path (Join-Path $RepoRoot "ollama") "Modelfile.qwen2.5-3b-copilot-ctx1k"

if (!(Test-Path $EnvDir)) { New-Item -ItemType Directory -Path $EnvDir | Out-Null }

if (!(Test-Path $EnvFile)) {
  if (!(Test-Path $EnvEx)) { throw "Missing env/.env.example" }
  Copy-Item $EnvEx $EnvFile
  Write-Info "Created env/.env from env/.env.example"
} else {
  Write-Info "env/.env already exists"
}

# Load env/.env (simple KEY=VALUE parser)
$envMap = @{}
Get-Content $EnvFile | ForEach-Object {
  $line = $_.Trim()
  if ($line -eq "" -or $line.StartsWith("#")) { return }
  $parts = $line.Split("=",2)
  if ($parts.Count -ne 2) { return }
  $k = $parts[0].Trim()
  $v = $parts[1].Trim()
  $envMap[$k] = $v
}

$OllamaHost = $envMap["OLLAMA_HOST"]
if (!$OllamaHost) { $OllamaHost = "http://127.0.0.1:11434" }
$ModelName  = $envMap["OLLAMA_MODEL"]
if (!$ModelName) { $ModelName = "qwen2.5-3b-copilot-ctx1k:latest" }

Write-Info "Ollama host : $OllamaHost"
Write-Info "Ollama model: $ModelName"

# --- Check Ollama CLI ---
$ollama = Get-Command ollama -ErrorAction SilentlyContinue
if (!$ollama) {
  Write-Err "Ollama CLI not found in PATH. Install Ollama, then re-run this script."
  exit 1
}

# --- Ensure Ollama daemon reachable ---
try {
  Invoke-RestMethod -Uri "$OllamaHost/api/tags" -Method GET -TimeoutSec 5 | Out-Null
  Write-Info "Ollama API reachable"
} catch {
  Write-Warn "Ollama API not reachable at $OllamaHost."
  Write-Warn "Start Ollama, then re-run. (Windows: launch Ollama app; Linux: `ollama serve`)"
  # Continue anyway; model creation may still work if daemon starts late
}

# --- Ensure model exists (create from Modelfile if missing) ---
$modelList = & ollama list 2>$null | Out-String
if ($modelList -match [regex]::Escape($ModelName.Split(":")[0])) {
  Write-Info "Model seems present (ollama list contains base name)"
} else {
  if (!(Test-Path $ModelFile)) { throw "Missing $ModelFile" }
  Write-Info "Model not found. Creating from Modelfile..."
  # IMPORTANT: ollama create accepts one arg (name), -f supplies modelfile
  & ollama create ($ModelName.Split(":")[0]) -f $ModelFile
  Write-Info "Created model: $($ModelName.Split(':')[0]) (tag defaults to latest)"
}

# --- Patch Obsidian Copilot plugin settings if we can find them ---
$pluginsDir = Join-Path (Join-Path $RepoRoot ".obsidian") "plugins"
if (!(Test-Path $pluginsDir)) {
  Write-Warn "No .obsidian/plugins folder found. Open the vault once in Obsidian and enable Copilot plugin, then re-run."
} else {
  # Auto-detect a plugin folder containing 'copilot' in its name
  $copilotDir = $null
  if ($envMap["COPILOT_PLUGIN_DIR"] -and (Test-Path (Join-Path $pluginsDir $envMap["COPILOT_PLUGIN_DIR"]))) {
    $copilotDir = Join-Path $pluginsDir $envMap["COPILOT_PLUGIN_DIR"]
  } else {
    $candidate = Get-ChildItem -Path $pluginsDir -Directory | Where-Object { $_.Name -match "copilot" } | Select-Object -First 1
    if ($candidate) { $copilotDir = $candidate.FullName }
  }

  if (!$copilotDir) {
    Write-Warn "Could not auto-detect Copilot plugin folder. Set COPILOT_PLUGIN_DIR in env/.env if needed."
  } else {
    Write-Info "Copilot plugin folder: $copilotDir"

    # Find likely settings JSON files
    $jsonFiles = Get-ChildItem -Path $copilotDir -Recurse -File |
      Where-Object { $_.Name -in @("data.json","settings.json","config.json") }

    if (!$jsonFiles) {
      Write-Warn "No obvious Copilot settings JSON found under $copilotDir. You may need to configure endpoint/model manually in Obsidian."
    } else {
      foreach ($f in $jsonFiles) {
        try {
          $raw = Get-Content $f.FullName -Raw
          $obj = $raw | ConvertFrom-Json
        } catch { continue }

        $changed = $false

        # Heuristic patches (only if fields exist)
        foreach ($key in @("ollamaHost","baseUrl","host","url","endpoint")) {
          if ($obj.PSObject.Properties.Name -contains $key) {
            $obj.$key = $OllamaHost
            $changed = $true
          }
        }
        foreach ($key in @("ollamaModel","model","modelName")) {
          if ($obj.PSObject.Properties.Name -contains $key) {
            $obj.$key = $ModelName
            $changed = $true
          }
        }

        if ($changed) {
          ($obj | ConvertTo-Json -Depth 20) | Set-Content -Path $f.FullName -Encoding UTF8
          Write-Info "Patched $($f.Name) with Ollama host/model (best-effort)"
        }
      }
    }
  }
}

Write-Info "Setup complete."
Write-Info "Next: open this repo folder as a vault in Obsidian."
Write-Info "If Copilot isn't configured automatically, set Provider=Ollama, Host=$OllamaHost, Model=$ModelName in Copilot settings."
