---
tag: [ azure, bicep, cicd, gitlab ]
---

# Bicep - CI-CD with GitLab

## Pipeline shape
- MR: compile + lint + what-if
- main: deploy dev
- protected environments: approvals for prod

## Auth
- Use OIDC/WIF if possible
- Otherwise use a service principal stored as masked/protected variables

## Stages
- validate
- plan (what-if)
- deploy

Backlinks:
- [[Bicep]]
- [[Bicep - Linting & Validation]]
