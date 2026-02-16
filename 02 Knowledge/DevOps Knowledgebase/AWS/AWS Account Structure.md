---
tags: [aws, accounts, organizations, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

Back to  [[AWS]]

# AWS Account Structure

## What this is
An AWS account is the **primary security and billing boundary** in AWS.

## Why it exists
To isolate workloads, control access, and separate billing.

## Core components
- **Root user**: Full control (should never be used day- to- day)
- **IAM users / roles**
- **Account ID** (12 digits)

## Multi- account strategy
Best practice:
- One account per environment (dev / test / prod)
- Centralized billing via AWS Organizations
- Shared services account (optional)

## AWS Organizations
- Group multiple accounts
- Apply **Service Control Policies (SCPs)**
- Centralize billing

## Common pitfalls
- Using the root user
- Running everything in one account
- No isolation between environments

## Terraform relevance
- Each account typically maps to a Terraform provider alias
- Cross- account access relies on IAM roles
