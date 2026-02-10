---
type: reference
area: tooling
topic: git
tags: [git, commands, cheatsheet]
status: evergreen
created: 2026-02-04
---
↑[[Git (Root)]]

# Git Commands

A practical, copy- paste friendly reference grouped by **intent**, not by Git internals.

---

## Repo setup & cloning

### Initialize a repo
```bash
git init
```

### Clone a repo

```bash
git clone <url> git clone <url> <folder>`
```
### Check remotes

```bash
git remote - v
```
---

## Status & inspection

### Repo status (short + branch)

```bash
git status - sb
```

### Show differences

```bash
git diff              # working tree vs index git diff -- staged     # index vs last commit git diff main..HEAD
```

### Log (human friendly)

```bash
git log -- oneline -- graph -- decorate -- all
```

### Show a commit

```bash
git show <hash>
```

---

## Branching & switching

### List branches

```bash
git branch git branch - a
```

### Create + switch

```bash
git switch - c feat/my- feature
```

### Switch branches

```bash
git switch main
```

### Delete branch

```bash
git branch - d feat/my- feature git branch - D feat/my- feature   # force
```

---

## Staging & committing

### Stage files

```bash
git add <file> git add .
```

### Stage interactively (recommended)

```bash
git add - p
```

### Commit

```bash
git commit - m "feat: add xyz"
```

### Amend last commit

```bash
git commit -- amend
```

### Amend without changing message

```bash
git commit -- amend -- no- edit
```

---

## Pulling & fetching (safe defaults)

### Fetch only (no changes)

```bash
git fetch git fetch -- prune
```

### Pull with rebase (recommended)

```bash
git pull -- rebase
```

### Pull explicitly

```bash
git pull origin main
```

---

## Merging & rebasing

### Merge a branch

```bash
git merge feat/my- feature
```

### Rebase onto main

```bash
git rebase origin/main
```

### Continue / abort rebase

```bash
git rebase -- continue git rebase -- abort
```

---

## Pushing

### First push (set upstream)

```bash
git push - u origin HEAD
```

### Normal push

```bash
git push
```

### Push after rebase (safe force)

```bash
git push -- force- with- lease
```

---

## Undoing things (modern commands)

### Unstage a file

```bash
git restore -- staged <file>
```

### Discard local changes

```bash
git restore <file>
```

### Restore file from last commit

```bash
git restore -- source=HEAD -- <file>
```

---

## Reset vs revert

### Reset (local, destructive)

```bash
git reset -- soft HEAD~1 git reset -- mixed HEAD~1 git reset -- hard HEAD~1
```

### Revert (safe on shared branches)

```bash
git revert <commit>
```

---

## Stashing

### Stash changes

```bash
git stash git stash push - m "wip: message"
```

### List stashes

```bash
git stash list
```

### Apply stash

```bash
git stash pop git stash apply stash@{0}
```

---

## Cherry- picking

### Pick one commit

```bash
git cherry- pick <hash>
```

### Pick a range

```bash
git cherry- pick <hash1>..<hash2>
```

---

## Reflog (panic button)

### Show reflog

```bash
git reflog
```

### Recover lost commit

```bash
git cherry- pick <hash> # or git reset -- hard <hash>
```

---

## Tags & releases

### Create tag

```bash
git tag v1.2.0 git tag - a v1.2.0 - m "Release 1.2.0"
```

### Push tags

```bash
git push origin v1.2.0 git push -- tags
```

### List tags

```bash
git tag
```

---

## Remotes & syncing forks

### Add upstream

```bash
git remote add upstream <url>
```

### Sync with upstream

```bash
git fetch upstream git rebase upstream/main
```

---

## Cleaning & maintenance

### Remove untracked files

```bash
git clean - n     # dry run git clean - fd
```

### Remove ignored files too

```bash
git clean - fdx
```

---

## Configuration & aliases

### Common good defaults

```bash
git config -- global pull.rebase true git config -- global rebase.autoStash true git config -- global fetch.prune true
```

### Useful aliases

```bash
git config -- global alias.st "status - sb" git config -- global alias.lg "log -- oneline -- graph -- decorate -- all" git config -- global alias.unstage "restore -- staged"
```

---

## One- liners you’ll thank yourself for

```bash
git diff origin/main...HEAD git log origin/main..HEAD -- oneline git branch -- merged git branch -- no- merged
```

---

## Linked notes

- [[Git (Root)]]
    
- [[Git Daily Workflow]]
    
- [[Git Debugging & Recovery]]
    
- [[Git Pull, Merge, Rebase]]
