---
tags: [aws, iam, terraform, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [Terraform IAM on AWS]
---

↑ [[AWS]]

# AWS IAM + Terraform

This note documents **how IAM is actually used with Terraform**, including common patterns and failure modes.

---

## The core problem
Terraform needs AWS permissions to:
- Read existing infrastructure
- Create, update, and delete resources
- Assume roles across accounts

Most Terraform failures are **IAM failures in disguise**.

---

## Recommended baseline pattern

### One Terraform deployment role per environment
Examples:
- terraform- deploy- dev
- terraform- deploy- test
- terraform- deploy- prod

Each role:
- Has narrowly scoped permissions
- Is assumed via STS
- Is environment- specific

Never reuse a single role for all environments.

---

## Provider + IAM relationship

Terraform itself:
- Does not authenticate
- Relies entirely on the AWS provider

IAM controls:
- What Terraform can see
- What Terraform can change

See:
- [[Terraform AWS Provider]]
- [[AWS IAM Deep Dive]]

---

## Common IAM permissions Terraform needs

Almost every setup requires:
- sts:AssumeRole
- iam:PassRole (often forgotten)
- Read permissions for existing resources

Missing iam:PassRole is one of the **most common blockers**.

---

## Multi- account Terraform pattern

Typical flow:
1. CI/CD authenticates
2. Terraform assumes environment role
3. Provider alias targets correct account

Key rule:
> Terraform state, credentials, and permissions must all align to the same account boundary.

---

## Pitfalls (real- world)

❌ Using AdministratorAccess “temporarily”  
❌ Terraform works locally but fails in CI  
❌ IAM resources blocked by SCPs  
❌ Hardcoded account IDs  
❌ Overly broad wildcard policies  

---

## Best practices

- Explicit assume_role blocks
- Provider aliases for clarity
- Separate IAM bootstrapping from infra code
- Review IAM changes like code (PRs)

---

## Related notes
- [[Terraform IAM Modules]]
- [[AWS IAM + CI-CD Authentication]]
- [[AWS Organizations and SCPs]]
