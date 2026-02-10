---
tags: [azure- devops, security, governance, compliance]
parent: Azure DevOps
---
↑ [[Azure DevOps]]]

# Azure DevOps - Security & Governance

## Guardrails that matter
- Protected branches via branch policies :contentReference[oaicite:11]{index=11}
- Least privilege on:
  - who can create/edit pipelines
  - who can approve deployments in Environments :contentReference[oaicite:12]{index=12}
- Separate service connections per environment (or per workload)
- Prefer **Workload Identity Federation (OIDC)** over static secrets :contentReference[oaicite:13]{index=13}

## Supply chain basics
- Pin tool versions (Terraform, tflint, etc.)
- Keep templates in a governed “pipeline- templates” repo
- Require PR checks for template changes (because templates = power)

## Auditing
- Use Environments for deployment history :contentReference[oaicite:14]{index=14}
- Require reviews for changes to pipeline YAML and service connections