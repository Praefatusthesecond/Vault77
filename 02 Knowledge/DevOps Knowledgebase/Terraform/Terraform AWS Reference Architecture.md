---
tags: [terraform, iac, devops, reference, aws]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

# Terraform AWS Reference Architecture

This note describes a **sane, production- oriented AWS reference architecture**
designed to work well with Terraform, CI/CD, and multiple environments.

← Back to [[Terraform]]

---

## Architecture Goals

- Clear separation of concerns
- Safe Terraform state management
- Minimal blast radius
- Easy CI/CD integration
- Scales from single account to multi- account

This is **not** a “maximum services” architecture.
It is a **maintainable baseline**.

---

## High- Level Architecture Overview

```text
AWS Account  
│  
├── Networking (VPC)  
│ ├── Public Subnets  
│ ├── Private Subnets  
│ └── NAT / IGW  
│  
├── Compute  
│ ├── EC2 / ASG  
│ ├── ECS / EKS (optional)  
│  
├── Data  
│ ├── RDS / Aurora  
│ ├── S3  
│  
├── Security  
│ ├── IAM Roles  
│ ├── Security Groups  
│ └── KMS  
│  
└── Observability  
├── CloudWatch  
└── Logs / Alarms
```

Terraform maps cleanly to these layers.

---

## Account & Environment Strategy

### Recommended (Simple but Safe)

- One AWS account
- Separate Terraform state per environment

```text
envs/
├── dev/
├── test/
└── prod/
```
Each environment:

- Own backend
    
- Own state
    
- Own variables
    

---

## Terraform Project Layout

```text
terraform/
├── modules/
│   ├── networking/
│   ├── compute/
│   ├── data/
│   ├── security/
│   └── observability/
│
└── envs/
    ├── dev/
    │   ├── main.tf
    │   ├── backend.tf
    │   └── terraform.tfvars
    ├── test/
    └── prod/
```

Rule:

> **Modules contain logic**  
> **Environments contain wiring**

---

## Networking Layer (Foundation)

### VPC Design

- One VPC per environment
    
- CIDR planned once, then treated as immutable
    

Example:

- VPC: `10.0.0.0/16`
    
- Public subnets: `10.0.1.0/24`, `10.0.2.0/24`
    
- Private subnets: `10.0.11.0/24`, `10.0.12.0/24`
    

### Terraform Ownership

- VPC
    
- Subnets
    
- Route tables
    
- IGW / NAT
    

Never manually change networking once live.

---

## Security Layer

### IAM Strategy

- One Terraform execution role
    
- Least privilege, but complete
    
- No personal IAM users for Terraform
    

Terraform manages:

- IAM roles
    
- IAM policies
    
- Instance profiles
    

Avoid mixing:

- Manually created IAM
    
- Terraform- managed IAM
    

---

## Compute Layer

### EC2- Based Workloads

Common patterns:

- Launch Templates
    
- Auto Scaling Groups
    
- Security Groups per service
    

Treat compute as **replaceable**:

- No manual SSH
    
- No pets
    
- Immutable where possible
    

Terraform owns:

- ASGs
    
- Launch templates
    
- ALBs / NLBs
    

---

## Data Layer

### RDS / Aurora

Best practices:

- Enable backups
    
- Enable deletion protection (prod)
    
- Separate subnet group
    

Terraform warnings:

- Some changes force replacement
    
- Storage changes may cause downtime
    

Treat DB changes as **high- risk applies**.

---

## S3 Usage

Typical buckets:

- Terraform state
    
- Logs
    
- Application data
    

Best practices:

- Versioning enabled
    
- Encryption enabled
    
- Lifecycle policies defined
    

Never:

- Store secrets in S3 without KMS
    
- Use S3 without versioning for state
    

---

## Observability Layer

Terraform manages:

- CloudWatch log groups
    
- Metrics alarms
    
- Dashboards (basic)
    

Terraform does NOT replace:

- Proper monitoring tools
    
- APM solutions
    

Use it for baseline observability only.

---

## Terraform Backend (AWS)

Recommended backend:

- S3 for state
    
- DynamoDB for locking
    

State bucket:

- One per account or environment
    
- Locked down tightly
    

Losing state = losing control.

---

## CI/CD Integration Model

Typical pipeline:

1. `terraform fmt`
    
2. `terraform validate`
    
3. `terraform plan`
    
4. Manual approval (prod)
    
5. `terraform apply`
    

Rules:

- Plans on PR
    
- Applies only from main
    
- No auto- apply in prod
    

→ See [[Terraform + GitLab CI]]

---

## Change Management Rules

Safe changes:

- Adding resources
    
- Scaling out
    
- Adding permissions
    

Risky changes:

- CIDR changes
    
- Subnet changes
    
- RDS modifications
    
- IAM refactors
    

Golden rule:

> If Terraform wants to destroy something critical, stop.

---

## Scaling This Architecture Later

Easy extensions:

- Multiple AWS accounts
    
- Shared networking account
    
- Central logging account
    
- Cross- account IAM roles
    

The structure stays the same.  
Only providers and backends multiply.

---

## What This Architecture Avoids (On Purpose)

- Over- modularization
    
- Mega- modules
    
- Per- resource state files
    
- Clever- but- fragile abstractions
    

Boring Terraform is good Terraform.

---

## Related Notes

- [[Terraform AWS Gotchas]]
    
- [[Terraform Debugging Playbook]]
    
- [[Terraform State]]
    
- [[Terraform Modules]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]
