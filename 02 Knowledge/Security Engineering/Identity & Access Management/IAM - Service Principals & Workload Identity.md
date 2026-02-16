---
tags: [security, iam, workload-identity]
---
Back to [[IAM - Overview]]

# Service Principals & Workload Identity

Machine identities for automation.

Used by:
- CI/CD pipelines
- Applications
- Containers
- Kubernetes workloads

---

## Risks

- Long-lived secrets
- Static credentials
- Excessive privileges

---

## Secure Pattern

Use:
- Federated workload identity
- Short-lived tokens
- Managed identities
