---
tags: [security, secure-sdlc, scanning]
parent: Secure SDLC - Overview
---
Back to [[Secure SDLC - Overview]]

# Security Testing Types

## SAST (Static Application Security Testing)

Analyzes source code without execution.

Detects:
- Injection flaws
- Hardcoded secrets
- Insecure cryptography
- Unsafe patterns

Runs during:
- Pull request
- CI pipeline

---

## DAST (Dynamic Application Security Testing)

Tests running applications.

Detects:
- Runtime vulnerabilities
- Misconfigurations
- Exposed endpoints

Runs during:
- Staging testing
- Pre-production validation

---

## SCA (Software Composition Analysis)

Scans dependencies.

Detects:
- Known CVEs
- License violations
- Vulnerable third-party packages

Critical for supply chain defense.

---

## Infrastructure Scanning

- Terraform scanning
- Kubernetes manifest scanning
- Container image scanning
