---
tags: [terraform, aws, provider, iac, devops]
domain: DevOps
subcategory: Terraform
parent: Terraform Knowledgebase
aliases: [Terraform AWS Provider Configuration]
---

↑ [[Terraform]]

# Terraform AWS Provider

This note documents how Terraform authenticates to AWS and how the AWS provider is typically configured in real- world setups.

---

## What this is
The Terraform AWS provider is the bridge between:
- Terraform configuration
- AWS APIs

It defines **how Terraform authenticates**, **which region it targets**, and **which account it operates in**.

---

## Why this matters
Most Terraform issues involving AWS are **provider issues**, not resource issues.

Common symptoms:
- `AccessDenied`
- Resources created in the wrong account
- Resources created in the wrong region
- Terraform works locally but fails in CI/CD

---

## Basic provider configuration

Typical minimal setup:

```hcl
provider "aws" {
  region = "eu- west-1"
}
```

Terraform will then resolve credentials using the AWS credential chain.

---

## Authentication methods (in order of preference)

### 1️⃣ AssumeRole (recommended)

Terraform assumes an IAM role using temporary credentials.

`provider "aws" {   region = "eu- west-1"    assume_role {     role_arn = "arn:aws:iam::123456789012:role/terraform- deploy"   } }`

✔ Secure  
✔ Works well in CI/CD  
✔ Short- lived credentials

---

### 2️⃣ Environment variables

Often used in CI/CD:

`AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN`

⚠️ Acceptable only when credentials are temporary.

---

### 3️⃣ Shared credentials file

Used mostly for local development:

`~/.aws/credentials`

⚠️ Should never contain production credentials.

---

## Multiple accounts & provider aliases

Used when deploying to multiple AWS accounts:

`provider "aws" {   alias  = "prod"   region = "eu- west-1"    assume_role {     role_arn = "arn:aws:iam::PROD_ACCOUNT_ID:role/terraform- deploy"   } }`

Referenced as:

`provider = aws.prod`

---

## Region handling

- Region is provider- scoped
    
- Some resources are global (e.g. IAM)
    
- Multi- region deployments require multiple providers
    

Common mistake:

> Forgetting that IAM is global while VPC is regional.

---

## Common failure modes

- Terraform deploys into the wrong account  
    → Wrong role ARN or missing alias
    
- Terraform fails only in CI  
    → CI uses a different role than local dev
    
- IAM resources fail unexpectedly  
    → SCPs or missing permissions
    

---

## Best practices

- One provider per account/environment
    
- Explicit `assume_role`
    
- No static credentials in code
    
- Separate state per environment
    
- Use provider aliases intentionally
    

---

## Related notes

- [[AWS IAM Fundamentals]]
    
- [[AWS IAM + CI-CD Authentication]]
    
- [[Terraform IAM Modules]]
