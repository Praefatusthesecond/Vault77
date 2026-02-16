---
tags: [terraform, iac, devops, best- practices]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

## General

- One environment per state
- Use modules
- Use version constraints

## Safety

- Always run `terraform plan`
- Enable state locking
- Use least- privilege credentials

## Git

- Commit `.tf` files
- Ignore `.tfstate`
- Review plans in CI

← Back to [[Terraform]]