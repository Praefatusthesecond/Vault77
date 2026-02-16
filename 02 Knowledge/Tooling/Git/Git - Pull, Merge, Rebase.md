---
type: guide
topic: git
tags: [git, rebase, merge]
parent: Git Overview
---
Back to [[Git - Overview]]

# Git Pull, Merge, Rebase

## Safest default for `git pull`
For most workflows where you want a linear history:
```bash
git config -- global pull.rebase true
git config -- global rebase.autoStash true
```
## What `git pull` actually does

- `git fetch`
    
- then either **merge** (default) or **rebase** (if configured)
    

## Merge

Pros:

- preserves “what happened”
    
- safest for shared branches  
    Cons:
    
- more merge commits / noisier history
    

## Rebase

Pros:

- clean, linear history
    
- easier `git bisect`  
    Cons:
    
- rewrites commit hashes
    

## “Force push” but safely

Use this after rebasing a branch you own:

`git push -- force- with- lease`

`-- force- with- lease` refuses to overwrite remote changes you don’t have locally.

## Conflict handling flow

```bash
git rebase origin/main
# resolve files
git add <files>
git rebase -- continue
# or:
git rebase -- abort
```

