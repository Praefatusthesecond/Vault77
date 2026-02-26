---
tags: [security, cicd, detection]
parent: "LDR - Overview"
---
Back to [[LDR - Overview]]

# CI/CD Logging

CI pipelines are high-value attack targets.

Monitor:

- Runner registration
- Secret access
- Artifact uploads
- Branch protection changes
- Failed authentication attempts

---

## Detection Examples

Alert if:
- Pipeline modifies IAM roles
- New runner registered
- Artifact checksum mismatch
