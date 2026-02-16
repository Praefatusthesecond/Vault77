---
tag: [ azure, bicep, arm, troubleshooting ]
---

# Bicep - Troubleshooting

## Common failures
- Wrong scope (subscription vs rg)
- Missing permissions (especially role assignments)
- Name collisions (global namespaces: storage accounts, key vaults)
- API version quirks (rare now, but still happens)
- Deployment order / hidden dependencies

## Debug workflow
1) Compile locally
2) Run what-if
3) Check deployment operation details in Azure
4) Narrow to minimal failing resource/module
5) Add explicit `dependsOn` only when necessary

Backlinks:
- [[Bicep]]
- [[Bicep - Snippets]]
