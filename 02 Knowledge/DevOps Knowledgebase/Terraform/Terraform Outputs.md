---
tags: [terraform, iac, devops]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
↑[[Terraform]]
# Terraform Outputs

Outputs expose values after Terraform applies infrastructure.

## Example

```hcl
output "public_ip" {
  value = aws_instance.example.public_ip
}
Usage
terraform output
terraform output public_ip
```

← Back to [[Terraform]]