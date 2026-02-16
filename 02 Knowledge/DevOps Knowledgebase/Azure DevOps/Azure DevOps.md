---
tags: [devops, azure-devops, cicd, git, pipelines]
aliases: [ADO, Azure DevOps Services]
parent: DevOps Knowledgebase
---
Back to  [[DevOps Knowledgebase]]

# Azure DevOps

Azure DevOps is Microsoft’s suite for planning (Boards), source control (Repos), CI/CD (Pipelines), test management, artifacts, and (optionally) wiki.

## Index

```dataview
LIST
FROM #azure- devops
SORT file.name ASC
```

## Opinionated defaults (industry- standard- ish)
- Prefer **YAML pipelines** over classic UI, and prefer **templates** for reuse. :contentReference[oaicite:1]{index=1}
- Protect `main` (or `trunk`) with **branch policies** + PR requirements. :contentReference[oaicite:2]{index=2}
- Use **Environments** for deployment stages + approvals/gates (instead of ad- hoc manual steps). :contentReference[oaicite:3]{index=3}
- Prefer **OIDC / Workload Identity Federation** for cloud auth (no long- lived secrets in variable groups). :contentReference[oaicite:4]{index=4}

