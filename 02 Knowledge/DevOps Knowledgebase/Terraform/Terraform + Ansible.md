---
tags: [terraform, iac, devops]
aliases: [Terraform and Ansible, Terraform & Ansible]
domain: DevOps
subcategory: Terraform
parent: Terraform
---
↑[[Terraform]]

Terraform provisions infrastructure.  
Ansible configures systems.

## Common Pattern

1. Terraform creates VM
2. Outputs IP / hostname
3. Ansible inventory uses outputs
4. Ansible applies configuration

← Back to [[Terraform]]
