---
tags: [terraform, iac, devops]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

Terraform state tracks the mapping between Terraform resources and real infrastructure.

## Key Rules

- Never edit state manually
- Never commit state to Git
- One state file per environment

## Local vs Remote State

Local:
- Simple
- Single- user only

Remote:
- Required for teams
- Locking + history

Common backends:
- S3 + DynamoDB
- Azure Storage
- Terraform Cloud

← Back to [[Terraform]]