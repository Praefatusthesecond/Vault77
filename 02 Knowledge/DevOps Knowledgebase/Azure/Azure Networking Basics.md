---
tags: [azure, networking, vnet, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

Back to  [[Azure]]

# Azure Networking Basics

## What this is
Azure networking is built around **Virtual Networks (VNets)**.

## Why it exists
To provide isolation, routing, and security.

## Core components
- VNet
- Subnets
- Network Security Groups (NSGs)
- Route tables
- Azure Load Balancer / Application Gateway

## Azure- specific gotchas
- NSGs apply at subnet *and* NIC level
- No implicit “public subnet” concept
- Public IP ≠ internet- accessible by default

## Terraform relevance
- VNet is foundational
- CIDR planning is hard to change later
