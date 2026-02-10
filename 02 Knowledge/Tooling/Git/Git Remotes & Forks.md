---
type: guide
topic: git
tags: [git, remotes]
status: evergreen
created: 2026-02-04
---
↑[[Git (Root)]]

# Git Remotes & Forks

## Common pattern
- `origin`: your fork / your repo
- `upstream`: the canonical repo

```bash
git remote - v
git remote add upstream <url>
git fetch upstream
```
## Sync your main with upstream

`git switch main git fetch upstream git rebase upstream/main git push origin main`

## Clean up deleted remote branches locally

```bash
git fetch -- prune
```

