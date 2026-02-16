---
tags: [terraform, iac, devops]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]
Resources define infrastructure objects Terraform manages.

## Example

```hcl
resource "aws_instance" "web" {
  ami           = "ami-123"
  instance_type = "t3.micro"
}
Resources are identified as:
<provider>_<type>.<name>
```

← Back to [[Terraform]]