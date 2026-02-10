---
type: guide
topic: git
tags: [git, strategy]
---
↑[[Git (Root)]]

# Git Branching Strategy

## Recommended default (simple + scalable)
- `main`: always releasable
- short- lived branches:
  - `feat/<name>`
  - `fix/<name>`
  - `chore/<name>`
- PR required into `main`

## Rules that prevent pain
- Keep branches short- lived (hours/days, not weeks)
- Rebase your branch onto `origin/main` before merge (if your org allows it)
- Squash merge for “messy” dev branches; merge commit for long- running feature branches

## Naming
- Use kebab- case for readability:
  - `feat/add- zabbix- agent- discovery`

## When to use release branches
Use if you ship versions and need hotfixes while new work continues:
- `release/1.2`
- `hotfix/1.2.1`

## Trunk- based lite (for high velocity teams)
- Everyone integrates into `main` daily
- Feature flags for incomplete work
- Very small PRs