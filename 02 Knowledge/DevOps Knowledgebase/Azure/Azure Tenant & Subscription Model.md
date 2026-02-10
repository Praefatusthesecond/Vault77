---
tags: [azure, tenant, subscription, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

↑ [[Azure]]

# Azure Tenant & Subscription Model

## What this is
Azure separates **identity (tenant)** from **billing and resources (subscriptions)**.

## Why it exists
To allow:
- Centralized identity
- Multiple isolated environments
- Flexible billing boundaries

## Key concepts
- **Tenant**: Identity boundary (Entra ID)
- **Subscription**: Billing + resource boundary
- **Management Group**: Hierarchical grouping of subscriptions

## Mental model
- Tenant = “who you are”
- Subscription = “where things live and are billed”

## Azure- specific gotchas
- One tenant can have many subscriptions
- Identity always lives at tenant level
- RBAC is evaluated per subscription/resource

## Terraform relevance
- Provider authenticates at tenant level
- Resources are created in subscriptions
- Multi- subscription = provider aliases
