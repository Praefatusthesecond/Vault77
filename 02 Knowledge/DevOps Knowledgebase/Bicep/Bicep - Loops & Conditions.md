---
tag: [ azure, bicep, iac ]
---

# Bicep - Loops & Conditions

## Loops
Use loops to deploy multiple similar resources.
- Loop over arrays of objects for subnets, NSG rules, private endpoints, etc.

## Conditions
- `if` can conditionally deploy resources or modules
- Use to toggle features (diagnostics, optional components)

## Practical tips
- Prefer “data-driven” loops (array of objects) over hard-coded repeated blocks
- Keep conditions at module boundaries where possible to reduce complexity

Backlinks:
- [[Bicep]]
- [[Bicep - Modules Pattern Library]]
