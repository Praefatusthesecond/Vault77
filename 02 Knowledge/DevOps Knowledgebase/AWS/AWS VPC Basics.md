---
tags: [aws, vpc, networking, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

Back to  [[AWS]]

# AWS VPC Basics

## What this is
A VPC (Virtual Private Cloud) is an isolated virtual network in AWS.

## Why it exists
To give customers full control over networking, routing, and security.

## Core components
- **CIDR block**
- **Subnets** (public / private)
- **Route tables**
- **Internet Gateway**
- **NAT Gateway**
- **Security Groups**
- **Network ACLs**

## Public vs Private subnets
- Public: route to Internet Gateway
- Private: no direct internet access

## Security layers
- Security Groups: instance- level, stateful
- NACLs: subnet- level, stateless

## Common pitfalls
- Confusing public IP with public subnet
- Forgetting route table associations
- Overusing NACLs unnecessarily

## Terraform relevance
- VPC is usually the foundation module
- CIDR planning is hard to change later
