#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "[INFO] Pulling latest changes..."
git pull

echo "[INFO] Re-running setup verification..."
bash "$REPO_ROOT/bootstrap/setup.sh"
