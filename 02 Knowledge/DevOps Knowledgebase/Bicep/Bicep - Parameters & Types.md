---
tag: [ azure, bicep, iac ]
---

# Bicep - Parameters & Types

## Parameters
- `param location string = resourceGroup().location`
- Add constraints: `@minLength`, `@maxLength`, `@allowed`, `@secure()`

## Types & objects
- Prefer `object` and structured inputs for tags, naming, SKUs.
- Define reusable “configuration objects”:
  - `param tags object`
  - `param naming object`
  - `param sku object`

## Secure inputs
- Use `@secure()` for secrets, but prefer Key Vault references where possible.

## Parameter files
- Use `.bicepparam` or JSON parameter files (depends on your tooling choice)
- Keep per-environment params in `environments/<env>/`

Backlinks:
- [[Bicep]]
- [[Bicep - Outputs]]
