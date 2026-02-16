---
tags: [security, secure-sdlc, code-review]
parent: Secure SDLC - Overview
---
Back to [[Secure SDLC - Overview]]

# Secure Code Review

Manual review focused on security logic.

Look for:
- Authentication logic flaws
- Authorization bypass
- Input validation
- Improper error handling
- Logging sensitive data

---

## Checklist Approach

- Are secrets hardcoded?
- Are external inputs validated?
- Are permissions least privilege?
- Are logs sanitized?

Combine manual review with automated scanning.
