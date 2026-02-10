# Obsidian Vault (GitHub Sync) — Setup & Usage Guide

This repo contains an **Obsidian vault** that is shared via **GitHub**.  
Goal: you can clone it on any machine and be up and running with the same notes + structure, with safe syncing via Git.

---

## What’s in this repo

- `*.md` notes (your content)
-  `.obsidian/` settings (workspace, hotkeys, plugins, etc.)
- A `.gitignore` to avoid syncing junk (caches, local-only stuff)
---

## Prerequisites

### Install Obsidian
- Download and install Obsidian: https://obsidian.md/

### Install Git
- **Windows:** install Git for Windows (includes Git Bash)
- **macOS:** install via Xcode command line tools or Homebrew
- **Linux:** install via your distro package manager

Confirm it works:
```bash
git --version
```

## Quick Start (Clone + Open Vault)

### 1) Clone the repo

Choose a folder where you keep vaults.

#### Windows (PowerShell)

`cd $HOME\Documents git clone https://github.com/<YOUR-USER>/<YOUR-REPO>.git`

#### macOS/Linux

`cd ~/Documents git clone https://github.com/<YOUR-USER>/<YOUR-REPO>.git`

### 2) Open the vault in Obsidian

1. Open **Obsidian**
    
2. Choose **Open folder as vault**
    
3. Select the cloned repo folder
    

That’s it — notes should appear immediately.

## Usage guidelines

**Please make a new branch to use for yourself.**

I will maintain the default `main` to add items that serve to build up generic IT knowledge.

If you want to contribute in that way, make a PR to sync it with main, I'll check it and merge if it checks out :) 

## License

This knowledgebase is licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0).

You are free to share and adapt the material, provided appropriate credit is given.

