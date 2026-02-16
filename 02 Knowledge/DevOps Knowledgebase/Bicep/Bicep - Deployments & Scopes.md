---
tag: [ azure, bicep, arm, iac ]
---

# Bicep - Deployments & Scopes

## Scopes
Bicep can target:
- **Resource group**
- **Subscription**
- **Management group**
- **Tenant** (rare, but possible)

## Setting target scope
- `targetScope = 'resourceGroup'` (common)
- Subscription-scope is used for RG creation, policy assignments, etc.

## Cross-scope deployments
- Modules can deploy at different scopes:
  - Deploy RGs at subscription scope, then deploy resources to those RGs.

## Incremental vs Complete
- ARM deployments are **incremental by default**
- “Complete” mode exists but is sharp; use only when you mean it.

Backlinks:
- [[Bicep]]
- [[Bicep - Existing Resources]]
