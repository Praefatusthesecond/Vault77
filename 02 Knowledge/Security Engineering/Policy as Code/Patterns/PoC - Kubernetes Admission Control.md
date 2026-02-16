---
tags: [ policy-as-code, kubernetes, patterns ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Kubernetes Admission Control

Admission control enforces rules at cluster entry.

## Flow
1. Request sent to API server
2. Admission webhook evaluates
3. Request allowed or denied

## Typical enforcement
- Security contexts
- Image provenance
- Resource limits
- Namespace isolation

## Strategy
- Start in audit mode
- Move critical policies to deny
- Document exceptions

Admission control is your last line of defense.
