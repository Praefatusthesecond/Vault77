---
tag: [ observability, grafana, security, rbac ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# RBAC & security

## Threat model (practical)
Grafana is a **window into your systems**. If someone can query sensitive data sources, dashboards become a data-exfil tool.

## Core controls
- Principle of least privilege:
  - Folder-level permissions
  - Data source permissions (where supported)
- Separate admin duties from dashboard viewers
- Control plugin installation (plugins are code)
- Audit:
  - user activity (where possible)
  - provisioning changes via Git

## Recommended defaults
- SSO with group-based roles. See [[Grafana - Auth (SSO, LDAP, OIDC)]]
- Disable anonymous access unless you *really* mean it.
- Use service accounts for integrations; rotate tokens.

Related:
- [[Grafana - Provisioning]]
- [[Grafana - Alerting]]
