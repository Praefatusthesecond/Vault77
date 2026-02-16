---
tags: [security, secure-sdlc, policy]
parent: Secure SDLC - Overview
---
Back to [[Secure SDLC - Overview]]

# Security Gates

Security gates prevent vulnerable code from merging or deploying.

Examples:

- Block merge if SAST fails
- Block deployment if container has critical CVEs
- Block Terraform if policy violations detected
- Require signed commits

---

## Policy as Code

Security policies written as code.

Examples:
- No public S3 buckets
- No privileged containers
- No open RDP to internet

Automated enforcement reduces human error.
