---
tag: [ azure, bicep, iac, devops, quality ]
---

# Bicep - Linting & Validation

## What to validate
- Compile check (syntax + types)
- Lint rules (best practices)
- What-if (preview changes)
- Policy compliance (if org policies apply)

## In practice
In pipeline stages:
1) `bicep build` / compile
2) lint
3) `what-if`
4) deploy (with approvals per env)

Backlinks:
- [[Bicep]]
- [[Bicep - CI-CD with Azure DevOps]]
- [[Bicep - CI-CD with GitLab]]
