---
type: index
area: tooling
topic: git
tags: [git, vcs, tooling]
---

# Git

Git is the *truth engine* of your work: history, collaboration, recovery, and “how did this break?” all in one place.

## What this section contains
- [[Git Mental Model]] — how Git *actually* thinks
- [[Git Daily Workflow]] — 90% of what you do, clean and repeatable
- [[Git Branching Strategy]] — keep teams sane
- [[Git Pull, Merge, Rebase]] — the “don’t lose commits” guide
- [[Git Commit Craft]] — messages, atomic commits, review- friendly history
- [[Git Debugging & Recovery]] — reflog, reset, restore, cherry- pick… your parachute
- [[Git Remotes & Forks]] — origin/upstream patterns
- [[Git Config & Aliases]] — quality- of- life settings
- [[Git Security]] — signing, secrets, safe defaults
- [[Git Ignore Patterns]] — stop committing junk
- [[Git CI/CD Integration Notes]] — practical DevOps notes

## Quick decision tree
### “I just want to sync”
- Have local commits you want to keep? → `git pull -- rebase`
- Don’t care about local changes? → `git reset -- hard origin/main` (⚠️ destructive)

### “I messed up”
- Lost a commit? → `git reflog` then `git cherry- pick <hash>`
- Wrong branch? → `git switch - c fix- branch` then push

## Dashboards (Dataview)
### Git notes by type
```dataview
LIST
FROM "02 Knowledge/Tooling/Git"
WHERE type != null
SORT file.name ASC
```
## Recently edited Git notes
```dataview
TABLE file.mtime AS "Last edited"
FROM "02 Knowledge/Tooling/Git"
SORT file.mtime DESC
LIMIT 10
```



