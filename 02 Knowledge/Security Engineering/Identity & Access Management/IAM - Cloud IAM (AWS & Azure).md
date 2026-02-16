---
tags: [security, iam, cloud]
---
Back to [[IAM - Overview]]

# Cloud IAM

## AWS IAM

- Users
- Roles
- Policies
- Trust relationships
- STS (temporary credentials)

Risk:
Overly permissive policies.

---

## Azure IAM

- Azure AD / Entra ID
- Service principals
- Managed identities
- Role assignments
- Conditional access

Risk:
Global administrator sprawl.

---

## Best Practices

- Use roles, not users
- Avoid wildcard permissions
- Separate environments
- Use temporary credentials
