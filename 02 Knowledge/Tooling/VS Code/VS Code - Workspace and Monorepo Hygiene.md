---
type: knowledge
tags: [ tooling, vscode, workspace, monorepo ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Workspace & Monorepo Hygiene

This note exists to prevent **editor entropy** in large repos, mono- repos, and long- lived projects.

Good hygiene = faster navigation, fewer mistakes, calmer brain.

---

## Workspaces vs folders

### Folder
- Single root
- Simple projects
- Minimal configuration

### Workspace (`.code- workspace`)
- Multiple roots
- Per- project settings
- Per- project tasks
- Per- project extensions

👉 Use workspaces for anything non- trivial.

---

## When to create a workspace
- Monorepos
- Infra + app combo repos
- Obsidian vaults
- Any repo with multiple “domains”

---

## Example workspace file

```json
{
  "folders": [
    { "path": "terraform" },
    { "path": "scripts" },
    { "path": "docs" }
  ],
  "settings": {
    "editor.formatOnSave": true
  }
}
```

Commit this file when it benefits the team.

---
## Folder naming discipline

Avoid:

- `misc`
    
- `old`
    
- `temp`
    
- `new2`
    

Prefer:

- `scripts/`
    
- `modules/`
    
- `docs/`
    
- `playbooks/`
    
- `pipelines/`
    

Folders are **interfaces**, not junk drawers.

---

## Exclude noise (critical)

In workspace settings:

```json
{
  "files.exclude": {
    "**/.terraform": true,
    "**/.git": true,
    "**/node_modules": true
  }
}
```

This:

- Speeds search
    
- Reduces visual clutter
    
- Prevents accidental edits
---
## Search scope discipline

Always ask:

- Am I searching the _entire repo_?
    
- Or just `docs/`?
    
- Or just `modules/`?
    

Scoped search = fewer “oops” moments.

## Multi- root workspaces & Git

VS Code handles:

- Multiple repos
    
- Separate Git histories
    
- Independent status indicators
    

Just be conscious of _which root_ you’re editing.

---

## Hygiene rules

- One workspace per mental context
    
- Exclude generated files
    
- Commit workspace config when useful
    
- Don’t let the tree become a landfill
    

Clean tree → clean thinking.