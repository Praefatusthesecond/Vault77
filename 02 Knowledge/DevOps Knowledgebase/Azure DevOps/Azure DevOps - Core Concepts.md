---
tags: [azure- devops, cicd, git, fundamentals]
parent: Azure DevOps
---
Back to  [[Azure DevOps]]]

# Azure DevOps - Core Concepts

## The mental model
- **Organization** → top- level tenant/container
- **Project** → team boundary (repos, pipelines, boards, etc.)
- **Repos** → Git repositories
- **Pipelines** → CI/CD definitions (YAML recommended)
- **Artifacts** → package feeds (NuGet, npm, Maven, etc.)
- **Environments** → deployment targets + approvals/audit trail :contentReference[oaicite:5]{index=5}

## “Pipelines” structure (YAML)
Typical hierarchy:
- **Stages** = lifecycle boundaries (build / plan / apply, dev / prod, etc.)
- **Jobs** = run units (agent allocation)
- **Steps** = tasks/scripts
- **Templates** = reuse + standards :contentReference[oaicite:6]{index=6}

## CI vs CD (in ADO terms)
- CI: compile/test/lint/scan on every PR + main
- CD: deploy to an Environment using deployment jobs and approvals :contentReference[oaicite:7]{index=7}

## When to split pipelines
- One pipeline per product/service is fine.
- Split when:
  - different release cadences,
  - different security boundaries,
  - very different agent/tooling requirements.
