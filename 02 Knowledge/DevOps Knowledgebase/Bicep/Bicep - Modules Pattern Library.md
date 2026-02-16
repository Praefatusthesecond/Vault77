---
tag: [ azure, bicep, iac, patterns ]
---

# Bicep - Modules Pattern Library

## Baseline patterns
### 1) Tag + naming object passed everywhere
- `param tags object`
- `param naming object`

### 2) “Foundation” vs “Workload” separation
- Foundation: rg, vnet, identity, logging, policy hooks
- Workload: app service, function, container app, aks, db

### 3) Diagnostics as opt-in module
- One module that attaches diagnostic settings to many resources

### 4) Role assignment module (careful)
- RBAC often needs stable principal IDs and can be sensitive to timing.

## Anti-patterns
- Giant monolith templates
- Secrets in params/outputs
- Too many conditional branches in one file

Backlinks:
- [[Bicep]]
- [[Bicep - Files & Modules]]
- [[Bicep - Linting & Validation]]
