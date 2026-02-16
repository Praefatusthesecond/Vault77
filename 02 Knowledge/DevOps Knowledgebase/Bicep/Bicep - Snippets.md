---
tag: [ azure, bicep, snippets, iac ]
---

# Bicep - Snippets

## Tags object pattern
- Centralize tags in one `param tags object`

## Naming pattern
- `var name = '${prefix}-${env}-${workload}'`

## Existing resource reference
- Use `existing` for shared RG/VNet/Log Analytics

## Outputs for pipelines
- Output resource IDs or endpoints, not secrets

Backlinks:
- [[Bicep]]
- [[Bicep - Core Concepts]]
