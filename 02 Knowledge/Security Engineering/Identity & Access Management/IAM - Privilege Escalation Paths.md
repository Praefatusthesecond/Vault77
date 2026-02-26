---
tags: [security, iam, escalation]
parent: "IAM - Overview"
---
Back to [[IAM - Overview]]

# IAM Privilege Escalation

Common Cloud Escalation Techniques:

- PassRole abuse
- Policy attachment abuse
- Access to secret storing admin creds
- Create new role with elevated rights
- Token theft
- Metadata service abuse

---

## Detection

- Monitor policy changes
- Alert on role modifications
- Detect creation of new admin roles
