---
type: guide
topic: git
tags: [git, security, secrets]
status: evergreen
created: 2026-02-04
---
↑[[Git (Root)]]

# Git Security

## Don’t leak secrets
Rules:
- Never commit `.env` with real values
- Treat logs and debug dumps as sensitive
- Add secret patterns to `.gitignore`

If you leaked a secret:
1. Rotate the secret immediately
2. Remove it from history using a history- rewrite tool (and coordinate with the team)

## Signed commits (integrity)
Consider enabling GPG or SSH signing for commits/tags if your org supports it.

## Safer pushing
Prefer:
- protected `main`
- PR required
- CI required before merge
- minimal permissions on CI tokens

## Verify what you’re about to push
```bash
git log -- oneline -- decorate - n 10
git diff origin/main...HEAD
```

