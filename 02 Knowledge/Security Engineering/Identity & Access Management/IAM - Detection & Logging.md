---
tags: [security, iam, detection]
---
Back to [[IAM - Overview]]

# IAM Logging & Detection

Log:

- Failed login attempts
- Role changes
- Privilege escalations
- New service principals
- Token issuance anomalies

---

## Cloud Examples

AWS:
- CloudTrail

Azure:
- Entra ID sign-in logs
- Audit logs

---

## Detection Goals

- Detect suspicious role grants
- Detect brute force attempts
- Detect unusual geographic logins
