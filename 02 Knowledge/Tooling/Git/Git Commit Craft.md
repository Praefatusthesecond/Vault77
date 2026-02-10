---
type: guide
topic: git
tags: [git, commits]
---
↑[[Git (Root)]]

# Git Commit Craft

## The goal
Make commits:
- reviewable
- bisectable
- easy to revert

## Atomic commits
One commit = one logical change.
Avoid mixing formatting, refactors, and features unless needed.

## Commit message format (practical)
```text
type: short summary

Why / context (optional)
What changed (optional)
```
Types:

- `feat:` new functionality
    
- `fix:` bug fix
    
- `chore:` maintenance
    
- `refactor:` behavior- neutral code changes
    
- `docs:` documentation
    
- `test:` tests
    

## Staging like a surgeon

Use patch mode:

`git add - p`

## Fixups while working
```bash
git commit -- fixup <hash>
git rebase - i -- autosquash origin/main
```
