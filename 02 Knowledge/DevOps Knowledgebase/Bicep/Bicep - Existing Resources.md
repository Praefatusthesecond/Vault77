---
tag: [ azure, bicep, iac ]
---

# Bicep - Existing Resources

## `existing` keyword
Use when a resource already exists and you want to reference it:
- RGs created elsewhere
- Key Vaults managed by a platform team
- Shared VNets, Log Analytics workspaces

## Good uses
- Reference shared resources to avoid duplicating ownership
- Build “consumer” modules that plug into a platform landing zone

## Caution
- `existing` doesn't “import” resources like Terraform; it just references them.
- If you need governance/ownership: manage via separate Bicep layer or deployment stack.

Backlinks:
- [[Bicep]]
- [[Bicep - Deployments & Scopes]]
