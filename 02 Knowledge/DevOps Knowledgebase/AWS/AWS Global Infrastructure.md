---
tags: [aws, regions, availability- zones, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

↑ [[AWS]]

# AWS Global Infrastructure

## What this is
AWS runs its services across a global network of **Regions**, each containing multiple isolated **Availability Zones (AZs)**, designed for high availability and fault tolerance.

## Why it exists
To allow workloads to:
- Survive data- center failures
- Be deployed close to users
- Meet regulatory and latency requirements

## Key concepts
- **Region**: A geographic area (e.g. `eu- west-1`)
- **Availability Zone (AZ)**: One or more isolated data centers within a region
- **Edge Locations**: Used for CloudFront and low- latency delivery

## Important behaviors
- AZs are isolated but connected with high- bandwidth links
- AZ names (`a`, `b`, `c`) are **account- specific**
- Not all services are available in all regions

## Common pitfalls
- Assuming `eu- west-1a` is the same AZ across accounts
- Designing “multi- AZ” systems but placing everything in one subnet
- Ignoring region availability when planning services

## Terraform relevance
- Regions are provider- scoped
- AZs often discovered dynamically via data sources
