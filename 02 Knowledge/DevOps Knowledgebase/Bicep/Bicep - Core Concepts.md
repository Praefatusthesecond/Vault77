---
tag: [ azure, bicep, iac ]
---

# Bicep - Core Concepts

## Mental model
- You declare **desired resources**
- Bicep compiles into **ARM template JSON**
- Azure Resource Manager executes the deployment (incremental by default)

## Key building blocks
- `param` — input to templates
- `var` — local computed value
- `resource` — resource declaration (type + apiVersion inferred by tooling)
- `module` — reuse another bicep file
- `output` — emit values to be consumed by pipeline or parent module

## Common patterns
- **Naming conventions** via `var` and string interpolation
- **Tags everywhere** (centralize tags in one object)
- **Modules per “unit”** (network, identity, compute, monitoring)

## Compilation
- `az bicep build` compiles `.bicep` → ARM JSON
- Bicep deployments still appear in Azure as ARM deployments

## Gotchas
- Bicep is *declarative*, but some resources still have “imperative-feel” quirks (role assignments, certain extensions).
- Dependencies are usually inferred, but `dependsOn` exists for edge cases.

Backlinks:
- [[Bicep]]
- [[Bicep - Deployments & Scopes]]