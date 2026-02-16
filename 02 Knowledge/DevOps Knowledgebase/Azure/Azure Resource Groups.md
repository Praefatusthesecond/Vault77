---
tags: [azure, resource- groups, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

Back to  [[Azure]]

# Azure Resource Groups

## What this is
A resource group is a **logical container** for Azure resources.

## Why it exists
To manage:
- Lifecycle
- Access
- Cost
- Deployment boundaries

## Key behaviors
- Resources live in one RG
- RG deletion deletes everything inside
- RG has a region (metadata only)

## Azure- specific gotchas
- RG region does not constrain resource regions
- Moving resources between RGs has limits

## Terraform relevance
- RGs are usually created first
- Often map 1:1 with Terraform stacks
