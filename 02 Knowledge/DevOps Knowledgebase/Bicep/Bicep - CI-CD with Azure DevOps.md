---
tag: [ azure, bicep, cicd, azure-devops ]
---

# Bicep - CI-CD with Azure DevOps

## Pipeline shape
- PR validation: compile + lint + what-if
- Main branch: deploy to dev
- Promote with approvals: test → prod

## Recommended stages
1) Validate
2) What-if
3) Deploy

## Security & identity
- Prefer Workload Identity Federation / service connections
- Least privilege: scope deployments to RG/sub where possible

Backlinks:
- [[Bicep]]
- [[Bicep - Linting & Validation]]
