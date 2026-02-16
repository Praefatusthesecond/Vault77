---
tags: [terraform, aws, iam, modules, devops]
domain: DevOps
subcategory: Terraform
parent: Terraform Knowledgebase
aliases: [Terraform IAM Patterns]
---

Back to  [[Terraform]]]

# Terraform IAM Modules

This note documents **how and why IAM should be modularized in Terraform**, and common patterns that scale safely.

---

## What this is
IAM modules encapsulate:
- IAM roles
- Policies
- Trust relationships

into reusable, auditable Terraform components.

---

## Why IAM needs modules
IAM is:
- Verbose
- Easy to misconfigure
- Highly reused across environments

Modules help by:
- Enforcing consistency
- Reducing copy- paste errors
- Making permissions reviewable

---

## Typical IAM module structure

```text
modules/
└─ iam- role/
   ├─ main.tf
   ├─ variables.tf
   ├─ outputs.tf
```

A module usually manages:

- One role
    
- One or more policies
    
- One trust relationship
    

---

## Example use cases

- Terraform deployment role
    
- CI/CD pipeline role
    
- Application runtime role
    
- Cross- account access role
    

---

## Trust vs permission separation (important)

Good modules:

- Define **trust policy** explicitly
    
- Attach **permission policies** separately
    

This avoids accidental privilege escalation.

---

## Example: CI/CD deployment role (conceptual)

Responsibilities:

- Trust: CI/CD identity
    
- Permissions: limited infrastructure access
    

Avoid:

- `AdministratorAccess`
    
- Wildcard permissions
    

---

## Common anti- patterns

❌ One giant IAM module for everything  
❌ Inline policies for complex permissions  
❌ Hardcoding ARNs  
❌ Reusing the same role across environments

---

## Environment separation strategy

Preferred:

- One IAM role per environment
    
- One Terraform workspace or state per environment
    

Example roles:

- `terraform- deploy- dev`
    
- `terraform- deploy- test`
    
- `terraform- deploy- prod`
    

---

## Outputs (critical for reuse)

Always output:

- Role ARN
    
- Policy ARNs (if needed)
    

Example:

`output "role_arn" {   value = aws_iam_role.this.arn }`

This enables:

- Cross- module usage
    
- Cross- account references
    

---

## Debugging IAM modules

Common issues:

- Trust policy missing required principal
    
- Missing `iam:PassRole`
    
- SCPs blocking permissions
    

Debug tools:

- Terraform plan
    
- AWS IAM policy simulator
    
- CloudTrail
    

---

## Security best practices

- Least privilege
    
- Short session durations
    
- Explicit deny where appropriate
    
- Version- controlled policies
    
- Regular review
    

---

## Related notes

- [[AWS IAM Fundamentals]]
    
- [[AWS IAM + CI-CD Authentication]]
    
- [[Terraform AWS Provider]]