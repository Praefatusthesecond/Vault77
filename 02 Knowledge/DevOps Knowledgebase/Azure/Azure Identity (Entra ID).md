---
tags: [azure, identity, entra- id, devops]
domain: DevOps
subcategory: Azure
parent: Azure
aliases: [Azure AD, Entra ID]
---

↑ [[Azure]]

# Azure Identity (Entra ID)

## What this is
Azure Entra ID (formerly Azure AD) is Azure’s **central identity provider**.

## Why it exists
To manage:
- Users
- Groups
- Applications
- Service principals

## Core identities
- **Users**: Human identities
- **Groups**: Collections
- **Service Principals**: Application identities
- **Managed Identities**: Azure- managed service identities

## Key insight
> Everything in Azure starts with identity.

## Azure- specific gotchas
- Service principals ≠ managed identities
- RBAC is separate from Entra ID permissions
- Deleting an app does not always delete its SP

## Terraform relevance
- Terraform usually authenticates as a service principal
- Managed identities are preferred where possible
