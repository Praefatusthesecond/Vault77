---
tags: [azure, regions, availability, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

Back to  [[Azure]]

# Azure Global Infrastructure

## What this is
Azure operates globally using **Regions**, often grouped into **Paired Regions** for resiliency.

## Why it exists
To provide:
- High availability
- Disaster recovery
- Data residency options

## Key concepts
- **Region**: A geographic area (e.g. West Europe)
- **Paired Region**: Two regions linked for DR (e.g. West Europe ↔ North Europe)
- **Availability Zones**: Physically separate datacenters within a region

## Azure- specific gotchas
- Not all regions support Availability Zones
- Some services are region- paired automatically
- Region naming is human- friendly, not code- based

## Terraform relevance
- Region is provider- scoped
- Zone support must be checked per service
