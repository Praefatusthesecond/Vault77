---
tags: [terraform, iac, devops, modules]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]
Modules are reusable Terraform configurations.

## Why Use Modules

- Reusability
- Consistency
- Reduced duplication

## Basic Module Structure

```text
modules/
└── example/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
Using a Module
module "example" {
  source = "./modules/example"
}
```

← Back to [[Terraform]]