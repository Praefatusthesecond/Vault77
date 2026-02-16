---
tags: [azure- devops, pipelines, yaml, cicd, best- practices]
parent: Azure DevOps
---
Back to  [[Azure DevOps]]]

# Azure DevOps - Pipelines (YAML) Best Practices

## Use templates for standards
Templates let you centralize:
- common stages/jobs
- security scanning steps
- Terraform plan/apply wrappers
- standard agent/tool installs :contentReference[oaicite:9]{index=9}

**Pattern**
- `pipelines/templates/*.yml`
- `azure- pipelines.yml` stays thin (wires parameters + templates)

## Environments for deployments
Use **Environments** for:
- approvals
- deployment history/audit trail
- scoped permissions
- separation between dev/test/prod :contentReference[oaicite:10]{index=10}

## Pipeline triggers
- PR validation on `main`
- CI on `main`
- Optional path filters (only run infra pipeline if `infra/**` changes)

## Secrets
- Prefer OIDC/workload federation for cloud auth
- Otherwise: Key Vault integration or secured variable groups
- Never print secrets; lock down who can edit pipeline variables

## Example skeleton (multi- stage)
```yaml
trigger:
  branches: { include: [ main ] }

pr:
  branches: { include: [ main ] }

stages:
- stage: validate
  jobs:
  - job: lint_test
    steps:
    - script: echo "lint/test here"

- stage: deploy_dev
  dependsOn: validate
  condition: and(succeeded(), eq(variables['Build.SourceBranch'], 'refs/heads/main'))
  jobs:
  - deployment: deploy
    environment: dev
    strategy:
      runOnce:
        deploy:
          steps:
          - script: echo "deploy dev"
```
