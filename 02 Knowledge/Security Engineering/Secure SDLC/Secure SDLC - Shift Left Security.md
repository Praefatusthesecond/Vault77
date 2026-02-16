---
tags: [security, secure-sdlc, shift-left]
parent: Secure SDLC - Overview
---
Back to [[Secure SDLC - Overview]]

# Shift Left Security

Shift Left means integrating security earlier in development.

The earlier a vulnerability is found, the cheaper it is to fix.

---

## Examples

Instead of:
Manual penetration test before go-live.

Do:
- Static code scanning during pull request.
- Dependency scanning on every commit.
- IaC scanning before merge.
- Container image scanning before push.

---

## DevSecOps Implementation

- Pre-commit hooks
- PR security scanning
- Pipeline security gates
- Infrastructure scanning (Terraform/Bicep)
- Policy as Code enforcement

---

## Benefits

- Reduced remediation cost
- Faster delivery cycles
- Fewer emergency patches
- Better audit posture
