---
tag: [ observability, grafana, auth, sso, oidc, ldap ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Auth (SSO, LDAP, OIDC)

## Why central auth
- Offboarding becomes reliable
- Role mapping via groups
- MFA policies live in your IdP

## Common approaches
- OIDC (Azure AD / Entra ID, Okta, etc.)
- LDAP (legacy but common on-prem)
- SAML (also common in enterprise environments)

## Best practices
- Group-to-role mapping (viewer/editor/admin) with least privilege
- Separate “break-glass” local admin account, protected & audited
- Document the mapping and ownership

Related:
- [[Grafana - RBAC & Security]]
