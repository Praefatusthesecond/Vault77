---
tag: [ azure, bicep, iac, devops ]
---

# Bicep - Outputs

## Outputs are for:
- Passing values from child module → parent
- Providing values to pipelines (resource IDs, principal IDs, endpoints)

## Output rules of thumb
- Output **IDs and names**, not secrets
- Prefer output of “stable identifiers”:
  - resourceId, principalId, managed identity IDs

Backlinks:
- [[Bicep]]
- [[Bicep - CI-CD with Azure DevOps]]
- [[Bicep - CI-CD with GitLab]]
