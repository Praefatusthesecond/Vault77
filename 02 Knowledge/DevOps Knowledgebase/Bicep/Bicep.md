---
parent: DevOps Knowledgebase
tag: [ azure, bicep, iac, devops, cloud ]
aliases: [ "Azure Bicep", "Bicep IaC" ]
---
Back to  [[DevOps Knowledgebase]]

# Bicep

Bicep is Microsoft’s DSL for authoring **ARM deployments** with cleaner syntax, strong typing, modules, and better ergonomics than raw JSON.

## Why Bicep (in practice)
- **ARM-native**: compiles to ARM JSON, no runtime drift.
- **Strong types & intellisense**: fewer “deploy and pray” moments.
- **Modules**: reusable building blocks (think Terraform modules, but ARM-scoped).
- **Works well with policy & RBAC**: aligns with enterprise Azure governance.

## When to use Bicep vs Terraform
- Use **Bicep** when: you want Azure-first, tight ARM integration, deployment stacks, policy alignment, and minimal moving parts.
- Use **Terraform** when: you need strong multi-cloud workflows, provider ecosystem breadth, or state-driven patterns across platforms.

## Notes in this section
- [[Bicep - Core Concepts]]
- [[Bicep - Files & Modules]]
- [[Bicep - Parameters & Types]]
- [[Bicep - Deployments & Scopes]]
- [[Bicep - Loops & Conditions]]
- [[Bicep - Outputs]]
- [[Bicep - Existing Resources]]
- [[Bicep - Modules Pattern Library]]
- [[Bicep - Linting & Validation]]
- [[Bicep - Deployment Stacks]]
- [[Bicep - CI-CD with Azure DevOps]]
- [[Bicep - CI-CD with GitLab]]
- [[Bicep - Troubleshooting]]
- [[Bicep - Snippets]]

## Dataview (auto list children)
```dataview
LIST
FROM "02 Knowledge/Cloud/Azure/Bicep"
WHERE file.name != "Bicep"
SORT file.name ASC
```