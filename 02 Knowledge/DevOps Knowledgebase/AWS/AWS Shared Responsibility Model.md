---
tags: [aws, security, compliance, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

↑ [[AWS]]

# AWS Shared Responsibility Model

## What this is
A model defining **which security responsibilities belong to AWS** and **which belong to the customer**.

## Why it exists
To clearly separate infrastructure security from workload and data security.

## AWS is responsible for
- Physical data centers
- Hardware, networking, and facilities
- Underlying cloud infrastructure

## Customer is responsible for
- IAM configuration
- OS patching (for EC2)
- Application security
- Network configuration
- Data encryption and backups

## Key insight
> AWS secures **the cloud**, you secure **what’s in the cloud**.

## Common pitfalls
- Assuming AWS patches your EC2 OS
- Assuming AWS configures IAM securely by default
- Confusing managed services with “fully secure”

## Terraform relevance
- Misconfigured Terraform often violates customer responsibilities
