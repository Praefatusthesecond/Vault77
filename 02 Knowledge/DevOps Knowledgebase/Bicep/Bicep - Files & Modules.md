---
tag: [ azure, bicep, iac, devops ]
---

# Bicep - Files & Modules

## Recommended repo structure
- `infra/` (Bicep root)
  - `main.bicep` (or environment entrypoints)
  - `modules/` (reusable)
  - `shared/` (naming, tags, helpers)
  - `environments/` (params per env)

## Module basics
- `module` declares a child deployment referencing another `.bicep`
- You pass `params` into modules; modules can return `outputs`

## Versioning modules
Options:
- Same repo path reference (simple)
- Publish compiled artifacts or use Bicep registries (advanced)
- Pin versions for stability in shared org environments

## Practical guidance
- Keep modules **small and composable**
- Avoid “mega module” that deploys everything
- A module should define **a bounded set of resources** with clear inputs/outputs

Backlinks:
- [[Bicep]]
- [[Bicep - Modules Pattern Library]]