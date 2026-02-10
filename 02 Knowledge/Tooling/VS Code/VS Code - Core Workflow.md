---
type: knowledge
tags: [ tooling, vscode, workflow ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Core Workflow

This note defines the **baseline VS Code workflow** used across DevOps, Infra, Markdown, and scripting work.
If this muscle memory is solid, everything else becomes faster and safer.

---

## Mental Model (important)

VS Code is not “just an editor”:
- Files are **views**
- Commands are **discoverable**
- Almost everything is a **command**
- Settings are **layered**

If you remember only one thing:  
👉 *When stuck, open the Command Palette.*

---

## Command Palette (the brain)
**Shortcut**
- Windows/Linux: `Ctrl + Shift + P`
- macOS: `Cmd + Shift + P`

Use it to:
- Change language mode
- Run formatting
- Manage Git
- Reload window
- Open settings
- Run tasks
- Access extensions

If you don’t know the shortcut: **Command Palette knows it**

---

## Navigation (fast movement)

### Files
- Quick Open: `Ctrl + P`
- Go to symbol in file: `Ctrl + Shift + O`
  - Type `:` to group by category
- Go to line: `Ctrl + G`

### Code Intelligence
- Go to definition: `F12`
- Peek definition: `Alt + F12`
- Find references: `Shift + F12`
- Rename symbol (safe refactor): `F2`

👉 Prefer **Rename Symbol** over search/replace whenever possible.

---

## Editing essentials

### Multi- cursor
- Add cursor: `Alt + Click`
- Select next occurrence: `Ctrl + D`
- Select all occurrences: `Ctrl + Shift + L`
- Column select: `Shift + Alt + Drag`

### Line operations
- Duplicate line: `Shift + Alt + ↓ / ↑`
- Move line: `Alt + ↓ / ↑`
- Delete line: `Ctrl + Shift + K`
- Toggle comment: `Ctrl + /`

---

## Formatting (do not skip this)
- Format document: `Shift + Alt + F`
- Format selection: `Ctrl + K Ctrl + F`

**Best practice**
- Enable format- on- save *per workspace*
- Use `.editorconfig` when working in teams

---

## Settings hierarchy (this matters)

1. **User Settings** - global, personal
2. **Workspace Settings** - per repo (preferred for teams)
3. **Folder Settings** - per folder in multi- root workspaces

👉 Infra repos should rely on **workspace settings**, not personal ones.

---

## Terminal integration
- Toggle terminal: `` Ctrl + ` ``
- Multiple terminals supported
- Runs in project context
- Ideal for Terraform, Git, PowerShell, Ansible, etc.

---

## When things feel “off”
- Reload window: `Ctrl + Shift + P → Reload Window`
- Check language mode (bottom- right)
- Check workspace settings
- Check active profile

---

## Golden rules
- Use Command Palette when unsure
- Prefer semantic refactors over regex
- Let the editor work *with* you, not against you