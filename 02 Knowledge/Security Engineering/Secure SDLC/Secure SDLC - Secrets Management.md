---
tags: [security, secure-sdlc, secrets]
parent: Secure SDLC - Overview
---
Back to [[Secure SDLC - Overview]]

# Secrets Management in SDLC

Secrets include:
- API keys
- Database credentials
- Tokens
- SSH keys

---

## Common Failures

- Hardcoded credentials in repo
- Secrets in CI logs
- Shared long-lived tokens
- Static service principals

---

## Best Practices

- Use dedicated secret stores
- Rotate automatically
- Use short-lived credentials
- Implement least privilege
- Prevent secret commits via hooks

---

## DevSecOps Pattern

CI pipeline retrieves secret dynamically from vault.
Secret never stored in code.
Secret never logged.
