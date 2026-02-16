---
type: runbook
topic: git
status: evergreen
tags: [git, recovery, reflog]
created: 2026-02-04
parent: Git Overview
---
Back to [[Git - Overview]]

# Git Debugging & Recovery

## Your best friend: reflog
If you “lost” commits:
```bash
git reflog
# find the hash, then:
git cherry- pick <hash>
# or reset (destructive):
git reset -- hard <hash>
```

## Undoing changes (modern commands)

### Unstage a file

`git restore -- staged <file>`

### Discard local changes to a file

`git restore <file>`

### Restore deleted file from last commit

`git restore -- source=HEAD -- <file>`

## Reset vs revert

- `git reset` rewrites local history (danger on shared branches)
    
- `git revert` creates a new commit that undoes a commit (safe for shared branches)
    

`git revert <hash>`

## “I committed to the wrong branch”

Option A: move the commit (clean)

`git switch correct- branch git cherry- pick <hash> git switch wrong- branch git reset -- hard HEAD~1`

## “I need one commit from another branch”

```bash
git cherry- pick <hash>
```


