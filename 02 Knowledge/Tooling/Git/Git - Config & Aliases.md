---
type: reference
topic: git
tags: [git, config, aliases]
status: evergreen
created: 2026-02-04
parent: Git Overview
---
Back to [[Git - Overview]]

# Git Config & Aliases

## Recommended sane defaults
```bash
git config -- global init.defaultBranch main
git config -- global fetch.prune true
git config -- global pull.rebase true
git config -- global rebase.autoStash true
git config -- global rerere.enabled true
```

## Helpful aliases

```bash
git config -- global alias.st "status - sb" git config -- global alias.lg "log -- oneline -- graph -- decorate -- all" git config -- global alias.co "checkout" git config -- global alias.br "branch" git config -- global alias.sw "switch" git config -- global alias.ci "commit" git config -- global alias.unstage "restore -- staged"
```

## Identify yourself (important in teams)

```bash
git config -- global user.name "Dennis Van Vlerken" git config -- global user.email "<your- email>"
```

