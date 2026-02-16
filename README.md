# Obsidian DevOps Vault — AI-Enabled (GitHub Sync)

This repository contains a structured **Obsidian knowledge vault** with:

- Structured PARA-style folders
    
- Dataview-based indexes
    
- AI integration via **Obsidian Copilot**
    
- Local LLM powered by **Ollama**
    
- Git-based sync & version control
    

The goal is simple:

> Clone → Run one command → Open in Obsidian → AI works.

---

# 📦 What’s Included

- `*.md` notes (knowledge base content)
    
- `.obsidian/` (workspace + plugin configuration)
    
- Copilot configuration (Ollama-based)
    
- A custom Ollama model definition:
    
    - `qwen2.5-3b-copilot-ctx1k`
        
- Bootstrap scripts for:
    
    - Setup
        
    - Updates
        
    - Troubleshooting
        
- `.gitignore` configured to avoid syncing junk
    

---

# 🔧 Prerequisites

## 1️⃣ Install Obsidian

Download:  
[https://obsidian.md/](https://obsidian.md/)

---

## 2️⃣ Install Git

**Windows**

- Install Git for Windows (includes Git Bash)
    

**macOS**

```bash
xcode-select --install
```
**Linux**

```bash
sudo apt install git
```
Verify:

```bash
git --version
```
---

## 3️⃣ Install Ollama

Download:  
[https://ollama.com/](https://ollama.com/)

After installation, confirm:

```powershell
ollama --version`
```
On Linux you may need to start the server:

```bash
ollama serve
```
---

# 🚀 Quick Start (Fully Automated Setup)

## 1️⃣ Clone the repository

### Windows (PowerShell)

```powershell
cd $HOME\Documents git clone https://github.com/<YOUR-USER>/<YOUR-REPO>.git cd <YOUR-REPO>`
```
### macOS / Linux
```bash
cd ~/Documents git clone https://github.com/<YOUR-USER>/<YOUR-REPO>.git cd <YOUR-REPO>`
```
---

## 2️⃣ Run Setup Script

### Windows

```powershell
-ExecutionPolicy Bypass -File .\bootstrap\setup.ps1
```
### macOS / Linux

```bash
./bootstrap/setup.sh
```
The setup script will:

- Verify Ollama is installed
    
- Ensure Ollama API is reachable
    
- Build the custom model:
    
    `qwen2.5-3b-copilot-ctx1k`
    
- Patch Copilot plugin settings (best effort)
    
- Verify the model responds
    

---

## 3️⃣ Open Vault in Obsidian

1. Open Obsidian
    
2. Click **Open folder as vault**
    
3. Select this repository folder
    

Done.

---

# 🤖 AI Configuration Details

This vault uses:

- **Provider:** Ollama
    
- **Model:** `qwen2.5-3b-copilot-ctx1k:latest`
    
- **Context:** 1k tokens
    
- **Temperature:** 0.1 (focused / deterministic responses)
    

If Copilot is not auto-configured:

Open:

`Settings → Copilot`

Set:

- Provider → **Ollama**
    
- Host → `http://127.0.0.1:11434`
    
- Model → `qwen2.5-3b-copilot-ctx1k:latest`
    

---

# 🔄 Updating the Vault

To get updates:

```
git pull
```
Then re-run setup to verify AI:

### Windows

```powershell
.\bootstrap\update.ps1`
```
### macOS/Linux

```bash
./bootstrap/update.sh`
```
This ensures:

- Model still exists
    
- Settings remain correct
    
- No AI breakage after update
    

---

# 🩺 Troubleshooting

Run the diagnostic tool:

### Windows

```powershell
.\bootstrap\doctor.ps1
```
### macOS/Linux

```bash
./bootstrap/doctor.sh
```
It checks:

- Ollama installed
    
- API reachable
    
- Model present
    
- Model generates correctly
    

---

# 🌿 Branching & Contributions

## Recommended workflow

Create your own branch:

```git
git checkout -b your-name
```
Use that branch for personal notes.

`main` is maintained as the canonical structured knowledgebase.

If you want to contribute improvements:

- Create a PR to `main`
    
- Keep structure consistent
    
- Maintain tagging conventions
    

---

# 📁 Vault Structure

```text
00 Meta
01 Inbox
02 Knowledge
03 Projects
04 Areas
05 Resources
99 Archive
Daily Notes
```
Indexes rely on:

- Dataview Community Plugin
    
- Pre-configured plugin settings
    

---

# 🔐 License

This knowledgebase is licensed under:

**Creative Commons Attribution 4.0 International (CC BY 4.0)**

You are free to:

- Share
    
- Adapt
    
- Build upon
    

As long as proper credit is given.

---

# 🧠 Philosophy

This vault is designed to be:

- Portable
    
- Deterministic
    
- Version-controlled
    
- AI-assisted
    
- Locally powered
    
- GitHub-synced
    

It should feel like:

> A personal DevSecOps brain you can clone anywhere.