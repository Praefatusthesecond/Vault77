---
type: reference
topic: git
tags: [git, gitignore]
status: evergreen
created: 2026-02-04
parent: Git Overview
---
Back to [[Git - Overview]]

# Git Ignore Patterns

## Key idea
Ignore build outputs, caches, local IDE config, secrets.

## Common examples
```gitignore
# OS
.DS_Store
Thumbs.db

# Logs
*.log

# Dependencies
node_modules/

# Build output
dist/
bin/
obj/

# Env
.env
.env.*

# IDE
.vscode/
.idea/
```

## If you already committed a file, ignore won’t remove it

You must untrack it:

```bash
git rm -- cached <file>
```
