---
type: knowledge
tags: [ tooling, vscode, profiles, settings ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Profiles & Settings Sync

Profiles prevent extension and setting chaos.
They are essential if you do **multiple types of work**.

---

## What a profile contains
- Extensions
- Settings
- Keybindings
- UI state

Profiles do **not** affect:
- Projects
- Git repos
- Files

---

## Why profiles matter

Without profiles:
- Conflicting extensions
- Slow startup
- Wrong formatters
- Noise everywhere

With profiles:
- Clean mental context
- Faster editor
- Intentional tooling

---

## Recommended profiles

### DevOps Profile
- Terraform
- YAML
- PowerShell
- Git tooling
- Docker / Remote

### Writing / Knowledge Profile
- Markdown tooling
- Spellcheck
- Obsidian- style editing
- Minimal UI

### Windows- only Profile
- PowerShell
- WinRM
- Registry / services tooling

---

## Creating a profile
1. Command Palette
2. `Profiles: Create Profile`
3. Start from:
   - Default
   - Existing profile
   - Empty

Name it intentionally.

---

## Switching profiles
- Status bar (bottom left)
- Instant, no restart required

Switch profiles when switching **mental modes**.

---

## Settings Sync

Settings Sync keeps:
- Profiles
- Extensions
- Settings
- Keybindings

Synced across:
- Work machines
- Home machines
- Laptops

---

## Best practices
- Keep Default profile minimal
- Use profiles aggressively
- Don’t overload a single profile
- Treat profiles like toolkits

---

## Anti- pattern
“One giant profile with everything installed”

That leads to:
- Slow editor
- Cognitive overload
- Formatting fights

Profiles exist to stop this.

---