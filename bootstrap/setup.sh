#!/usr/bin/env bash
set -euo pipefail

info(){ echo "[INFO] $*"; }
warn(){ echo "[WARN] $*" >&2; }
err(){ echo "[ERR ] $*" >&2; }

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_DIR="$REPO_ROOT/env"
ENV_FILE="$ENV_DIR/.env"
ENV_EX="$ENV_DIR/.env.example"
MODELFILE="$REPO_ROOT/ollama/Modelfile.qwen2.5-3b-copilot-ctx1k"

mkdir -p "$ENV_DIR"

if [[ ! -f "$ENV_FILE" ]]; then
  [[ -f "$ENV_EX" ]] || { err "Missing env/.env.example"; exit 1; }
  cp "$ENV_EX" "$ENV_FILE"
  info "Created env/.env from env/.env.example"
else
  info "env/.env already exists"
fi

# shellcheck disable=SC1090
set +u
source "$ENV_FILE"
set -u

OLLAMA_HOST="${OLLAMA_HOST:-http://127.0.0.1:11434}"
OLLAMA_MODEL="${OLLAMA_MODEL:-qwen2.5-3b-copilot-ctx1k:latest}"

info "Ollama host : $OLLAMA_HOST"
info "Ollama model: $OLLAMA_MODEL"

command -v ollama >/dev/null 2>&1 || { err "Ollama CLI not found. Install Ollama and re-run."; exit 1; }

# API reachable?
if curl -fsS "$OLLAMA_HOST/api/tags" >/dev/null 2>&1; then
  info "Ollama API reachable"
else
  warn "Ollama API not reachable at $OLLAMA_HOST. Start it (e.g. 'ollama serve') and re-run if needed."
fi

# Ensure model exists
BASE_NAME="${OLLAMA_MODEL%%:*}"
if ollama list | awk '{print $1}' | grep -q "^${BASE_NAME}$"; then
  info "Model present: $BASE_NAME"
else
  [[ -f "$MODELFILE" ]] || { err "Missing $MODELFILE"; exit 1; }
  info "Model not found. Creating from Modelfile..."
  ollama create "$BASE_NAME" -f "$MODELFILE"
  info "Created model: $BASE_NAME"
fi

# Best-effort patch of Copilot settings: use python to avoid jq dependency
PLUGINS_DIR="$REPO_ROOT/.obsidian/plugins"
if [[ ! -d "$PLUGINS_DIR" ]]; then
  warn "No .obsidian/plugins folder found. Open vault once, enable Copilot plugin, then re-run."
else
  python3 "$REPO_ROOT/scripts/patch_copilot_settings.py" \
    --plugins-dir "$PLUGINS_DIR" \
    --ollama-host "$OLLAMA_HOST" \
    --ollama-model "$OLLAMA_MODEL" || true
fi

info "Setup complete. Open this folder as a vault in Obsidian."
info "If Copilot wasn't auto-patched: set Provider=Ollama, Host=$OLLAMA_HOST, Model=$OLLAMA_MODEL in Copilot settings."
