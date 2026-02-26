#!/usr/bin/env bash
set -euo pipefail

info(){ echo "[INFO] $*"; }
warn(){ echo "[WARN] $*" >&2; }
err(){ echo "[ERR ] $*" >&2; }

REPO_URL="https://github.com/<YOUR-USER>/<YOUR-REPO>.git"
INSTALL_DIR="${HOME}/Documents/Obsidian/<YOUR-REPO>"
NO_INSTALL_DEPS="false"
NO_OPEN_OBSIDIAN="false"

usage() {
  cat <<EOF
Usage: install.sh [--repo <url>] [--dir <path>] [--no-install-deps] [--no-open-obsidian]

Defaults:
  --repo  ${REPO_URL}
  --dir   ${INSTALL_DIR}
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo) REPO_URL="$2"; shift 2 ;;
    --dir) INSTALL_DIR="$2"; shift 2 ;;
    --no-install-deps) NO_INSTALL_DEPS="true"; shift 1 ;;
    --no-open-obsidian) NO_OPEN_OBSIDIAN="true"; shift 1 ;;
    -h|--help) usage; exit 0 ;;
    *) err "Unknown arg: $1"; usage; exit 1 ;;
  esac
done

has_cmd(){ command -v "$1" >/dev/null 2>&1; }

install_git() {
  if has_cmd git; then info "Git found."; return; fi
  [[ "$NO_INSTALL_DEPS" == "true" ]] && { err "Git missing and --no-install-deps set."; exit 1; }

  if has_cmd brew; then
    info "Installing Git via Homebrew..."
    brew install git
    return
  fi
  if has_cmd apt-get; then
    info "Installing Git via apt..."
    sudo apt-get update
    sudo apt-get install -y git
    return
  fi
  if has_cmd dnf; then
    info "Installing Git via dnf..."
    sudo dnf install -y git
    return
  fi
  if has_cmd pacman; then
    info "Installing Git via pacman..."
    sudo pacman -Sy --noconfirm git
    return
  fi

  err "No supported package manager found. Install git manually and re-run."
  exit 1
}

install_ollama() {
  if has_cmd ollama; then info "Ollama found."; return; fi
  [[ "$NO_INSTALL_DEPS" == "true" ]] && { err "Ollama missing and --no-install-deps set."; exit 1; }

  warn "Ollama not found."
  warn "Auto-install is intentionally not done here (varies by distro and security policies)."
  warn "Install Ollama from https://ollama.com/ then re-run."
  exit 1
}

clone_or_update() {
  if [[ -d "$INSTALL_DIR" ]]; then
    if [[ ! -d "$INSTALL_DIR/.git" ]]; then
      err "Install dir exists but is not a git repo: $INSTALL_DIR"
      err "Move it aside or choose a different --dir."
      exit 1
    fi
    info "Repo exists. Pulling latest..."
    (cd "$INSTALL_DIR" && git pull)
  else
    info "Cloning repo..."
    mkdir -p "$(dirname "$INSTALL_DIR")"
    git clone "$REPO_URL" "$INSTALL_DIR"
  fi
}

run_setup() {
  local setup="$INSTALL_DIR/bootstrap/setup.sh"
  if [[ ! -f "$setup" ]]; then
    err "Missing bootstrap/setup.sh in repo. Ensure you added the setup scripts."
    exit 1
  fi
  info "Running vault setup..."
  bash "$setup"
}

open_obsidian_best_effort() {
  [[ "$NO_OPEN_OBSIDIAN" == "true" ]] && return

  # macOS: use open + obsidian://
  if has_cmd open; then
    info "Opening Obsidian (best-effort)..."
    local encoded
    encoded="$(python3 - <<PY
import urllib.parse
print(urllib.parse.quote(r'''$INSTALL_DIR'''))
PY
)"
    open "obsidian://open?path=$encoded" >/dev/null 2>&1 || true
    return
  fi

  # Linux: xdg-open
  if has_cmd xdg-open; then
    info "Opening Obsidian (best-effort)..."
    local encoded
    encoded="$(python3 - <<PY
import urllib.parse
print(urllib.parse.quote(r'''$INSTALL_DIR'''))
PY
)"
    xdg-open "obsidian://open?path=$encoded" >/dev/null 2>&1 || true
    return
  fi

  warn "Could not auto-open Obsidian. Open it manually and choose 'Open folder as vault'."
}

info "Target install directory: $INSTALL_DIR"
install_git
install_ollama
clone_or_update
run_setup
open_obsidian_best_effort

info "Done. If Obsidian didn’t open: Obsidian → Open folder as vault → $INSTALL_DIR"