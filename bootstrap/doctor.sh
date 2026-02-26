#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$REPO_ROOT/env/.env"

OLLAMA_HOST="http://127.0.0.1:11434"
OLLAMA_MODEL="qwen2.5-3b-copilot-ctx1k:latest"

if [[ -f "$ENV_FILE" ]]; then
  # shellcheck disable=SC1090
  set +u; source "$ENV_FILE"; set -u
  OLLAMA_HOST="${OLLAMA_HOST:-$OLLAMA_HOST}"
  OLLAMA_MODEL="${OLLAMA_MODEL:-$OLLAMA_MODEL}"
fi

ok(){ echo "[ OK ] $*"; }
fail(){ echo "[FAIL] $*"; }

command -v ollama >/dev/null 2>&1 && ok "ollama CLI in PATH" || fail "ollama CLI missing"

curl -fsS "$OLLAMA_HOST/api/tags" >/dev/null 2>&1 && ok "Ollama API reachable" || fail "Ollama API not reachable (start 'ollama serve' or Ollama app)"

BASE_NAME="${OLLAMA_MODEL%%:*}"
if ollama list | awk '{print $1}' | grep -q "^${BASE_NAME}$"; then
  ok "Model listed: $BASE_NAME"
else
  fail "Model missing: run ollama create $BASE_NAME -f ollama/Modelfile.qwen2.5-3b-copilot-ctx1k"
fi

# Smoke test (non-stream)
if curl -fsS "$OLLAMA_HOST/api/generate" \
  -H "Content-Type: application/json" \
  -d "{\"model\":\"$OLLAMA_MODEL\",\"prompt\":\"Reply with one word: OK\",\"stream\":false}" \
  | grep -q "OK"; then
  ok "Generate API smoke test"
else
  fail "Generate API smoke test failed (model/endpoint issue)"
fi
