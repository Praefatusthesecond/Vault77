---
tags: [terraform, iac, devops, variables]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
↑[[Terraform]]
Variables make Terraform configurations reusable and environment- agnostic.

## Declaring Variables

```hcl
variable "region" {
  type        = string
  description = "Deployment region"
}
Variable Values
terraform.tfvars

- var CLI flag

Environment variables
```

← Back to [[Terraform]]