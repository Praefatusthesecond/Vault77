---
tags: [azure, rbac, security, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

Back to  [[Azure]]

# Azure RBAC

## What this is
Role- Based Access Control defines **who can do what** on Azure resources.

## Why it exists
To control access without hardcoding permissions.

## Core concepts
- **Role definition**: Set of permissions
- **Assignment**: Role + identity + scope
- **Scope**: Management group, subscription, RG, resource

## Built- in roles
- Owner
- Contributor
- Reader

## Azure- specific gotchas
- RBAC ≠ Entra ID permissions
- Role inheritance is scope- based
- Deny assignments exist (rare but powerful)

## Terraform relevance
- RBAC assignments are often separate resources
- Mis- scoped roles cause subtle failures
