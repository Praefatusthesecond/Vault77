---
type: howto
topic: git
tags: [git, workflow]
---
↑[[Git (Root)]]

# Git Daily Workflow

## Start of day
```bash
git status
git fetch -- prune
git switch main
git pull -- rebase
```
## Create a branch

`git switch - c feat/<short- name>`

## Work loop (small commits)

`git status git add - p git commit - m "feat: <what changed>"`

## Keep branch up to date (preferred)

`git fetch git rebase origin/main`

## Push / update PR

`git push - u origin HEAD # after rebasing: git push -- force- with- lease`

## End of day hygiene

- Make sure `git status` is clean or you intentionally stashed.
    
- Write a short PR description while context is fresh.
    

## Stash when you must

`git stash push - m "wip: <reason>" git switch main # later: git stash pop`