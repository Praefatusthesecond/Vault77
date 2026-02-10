---
tags: [azure- devops, terraform, iac, cicd, oidc]
parent: Azure DevOps
---
↑ [[Azure DevOps]]]

# Azure DevOps - Terraform on ADO (Patterns)

## The clean pattern (recommended)
**Plan on PR, Apply on main, gated by Environments**
- PR → `terraform fmt`, `validate`, `tflint`, `plan` (publish plan as artifact)
- main merge → apply (requires Environment approval for prod)

## Auth: use OIDC / Workload Identity Federation
This avoids storing long- lived cloud credentials in ADO. :contentReference[oaicite:15]{index=15}

## State
- Use remote state (Azure Storage, S3+Dynamo, etc.)
- Locking enabled (where supported)
- State access is a separate permission boundary from “deploy”

## Repo layout
- `infra/terraform/modules/*`
- `infra/terraform/stacks/<env- or- account>/*`
- `pipelines/terraform/*` templates

## A minimal PR plan job (idea)
```yaml
steps:
- script: terraform fmt - check - recursive
- script: terraform init - input=false
- script: terraform validate
- script: terraform plan - out=tfplan - input=false
- publish: tfplan
  artifact: tfplan
```
## Common pitfalls

- Running apply from feature branches (don’t)
    
- No environment approvals for prod
    
- One service connection that can do everything everywhere