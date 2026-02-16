---
tags: [terraform, iac, devops, aws]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

# Terraform AWS Multi- Account Layout

This note describes a **practical Terraform layout for multiple AWS accounts** with:
- clean separation of environments and shared services
- safe remote state + locking
- provider alias patterns that scale
- CI/CD- friendly structure

← Back to [[Terraform]]

---

## 1. The Multi- Account Model (Recommended Baseline)

A common, scalable AWS org layout:

- **Management / Org account** (usually not used for workloads)
- **Shared Services account** (centralized things)
- **Networking account** (optional but common at scale)
- **Workload accounts** (dev/test/prod or per product/team)

Example:

```text
AWS Organizations  
│  
├── Shared- Services  
│ ├── Central logging  
│ ├── CI/CD roles  
│ └── SSO/IAM Identity Center integrations  
│  
├── Networking (optional)  
│ ├── Transit Gateway  
│ ├── Shared VPC constructs (where applicable)  
│ └── DNS/shared routing patterns  
│  
├── Dev  
├── Test  
└── Prod
```

**Rule:** Terraform state must be isolated so that each account/environment has a minimal blast radius.

---

## 2. State Strategy (Two Good Options)

### Option A (Most common): State bucket per account
Each account has:
- its own S3 state bucket
- its own DynamoDB lock table
- its own KMS key (optional but recommended)

Pros:
- strong isolation
- simpler IAM boundary
Cons:
- more bootstrap work

### Option B: Central state account
All states stored in a dedicated “Terraform State” account (or shared services).

Pros:
- centralized auditing and backups
- simpler to manage state storage
Cons:
- more complex IAM (cross- account access is mandatory)

Most teams start with Option A, and centralize later.

---

## 3. Recommended Repository Layout

### The scalable approach: “Stacks per concern + env/account wiring”
Keep modules reusable, and wire them together per account/environment.

```text
terraform/
├── modules/
│   ├── networking/
│   ├── security/
│   ├── compute/
│   ├── data/
│   └── observability/
│
├── stacks/
│   ├── org- baseline/            # org- wide guardrails (optional)
│   ├── shared- services/         # logging, audit, pipeline roles, etc.
│   ├── networking/              # TGW, DNS, shared routing (optional)
│   └── workload/                # app/platform stacks
│
└── envs/
    ├── shared- services/
    │   ├── backend.tf
    │   ├── main.tf
    │   └── terraform.tfvars
    ├── dev/
    ├── test/
    └── prod/
```

### Why this layout works

- **modules/** stay generic and reusable
    
- **stacks/** are “composed architectures” (how you choose to build)
    
- **envs/** are the actual targets (where state lives)
    

---

## 4. Provider Pattern for Multi- Account (AssumeRole)

Use one “base” AWS provider, then assume roles into each account.

### Example: provider config pattern

```terraform
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Default provider (often used only for reading caller identity or tooling)
provider "aws" {
  region = var.aws_region
}

# Aliased providers per account
provider "aws" {
  alias  = "shared"
  region = var.aws_region

  assume_role {
    role_arn = var.shared_services_role_arn
  }
}

provider "aws" {
  alias  = "dev"
  region = var.aws_region

  assume_role {
    role_arn = var.dev_role_arn
  }
}

provider "aws" {
  alias  = "prod"
  region = var.aws_region

  assume_role {
    role_arn = var.prod_role_arn
  }
}

```


### Wiring modules to the right account

```terraform
module "shared_logging" {
  source = "../../stacks/shared- services"

  providers = {
    aws = aws.shared
  }
}

module "prod_workload" {
  source = "../../stacks/workload"

  providers = {
    aws = aws.prod
  }
}

```

**Rule:** Never rely on “default provider” in a multi- account setup.  
Always be explicit.

---

## 5. Backend Layout (Per Environment)

Each environment/account should have its own backend config.

Example:

```text
envs/
├── dev/
│   ├── backend.tf
│   ├── main.tf
│   └── terraform.tfvars
└── prod/
    ├── backend.tf
    ├── main.tf
    └── terraform.tfvars
```

### Example `backend.tf` (S3 + DynamoDB locking)

```text
terraform {
  backend "s3" {
    bucket         = "tfstate- dev-123456789012"
    key            = "workload/core/terraform.tfstate"
    region         = "eu- west-1"
    dynamodb_table = "tf- locks"
    encrypt        = true
  }
}
```

**Tip:** Use consistent state keys:

- `networking/core`
    
- `security/iam`
    
- `workload/app1`
    
- `shared/logging`
    

---

## 6. Bootstrapping (The “Chicken and Egg” Problem)

You need some AWS resources **before** Terraform can use them:

- state bucket
    
- lock table
    
- KMS key (optional)
    
- Terraform execution role(s)
    

Two common solutions:

### A) Manual bootstrap (simple)

Create:

- S3 bucket + DynamoDB table
    
- Terraform role
    
- minimal IAM policies
    

Then Terraform takes over.

### B) Bootstrap stack (preferred long- term)

A very small Terraform stack using local state (temporary) that creates:

- state backend resources
    
- execution role
    

Then you switch everything to remote state and remove the temporary local state workflow.

---

## 7. Cross- Account Dependencies (Networking, DNS, Logging)

Avoid tightly- coupled cross- account dependencies in one apply.

### Good pattern

- Shared Services creates its own stuff (logging, audit)
    
- Workload accounts send logs to shared destination via policy/role
    
- Networking account exposes outputs (TGW ID, hosted zone IDs)
    
- Workloads consume those outputs via remote state or SSM parameters
    

### Remote state consumption pattern (common)

- Networking stack outputs:
    
    - `tgw_id`
        
    - `shared_route_table_id`
        
- Workload stack reads it via `terraform_remote_state`
    

Trade- off:

- convenient, but creates coupling
    
- good if you control sequencing in CI
    

Alternative:

- publish shared IDs into SSM Parameter Store, then read as data sources
    

---

## 8. CI/CD Safety Rules for Multi- Account

- Plan in PRs
    
- Apply only on main
    
- Manual approval for prod
    
- No shared state between environments
    
- Use separate roles per account/environment
    
- Tag every apply with commit SHA / pipeline ID (via tags)
    

Also:

- Don’t let dev credentials apply prod
    
- Don’t let shared services roles touch workloads unless intended
    

→ See [[Terraform + GitLab CI]]

---

## 9. Naming and Tagging Conventions

In multi- account setups, tags become your sanity:

Minimum tags:

- `environment` (dev/test/prod)
    
- `owner` / `team`
    
- `project`
    
- `managed_by=terraform`
    

Naming:

- avoid global uniqueness surprises (S3 buckets)
    
- include account/env prefix in globally- scoped names
    

---

## 10. Practical “Stack Split” Recommendation

A sane split by blast radius:

Per account/environment:

- `networking` (VPC/subnets)
    
- `security` (SG baseline / IAM roles specific to that account)
    
- `workload` (apps, compute, LB)
    
- `data` (RDS, caches)
    
- `observability` (alarms, log groups)
    

Shared account:

- central logging
    
- security/audit tooling
    
- CI roles (assuming into workloads)
    

Keep apply scope small and understandable.

---

## 11. Common Multi- Account Gotchas

- Using default provider accidentally (resources end up in wrong account)
    
- Missing `providers = { aws = aws.alias }` inside modules
    
- IAM assume role trust policies incorrect
    
- State stored in the wrong bucket/account
    
- Cross- account dependencies causing apply order headaches
    

→ See [[Terraform AWS Gotchas]] and [[Terraform Debugging Playbook]]

---

## Related Notes

- [[Terraform AWS Reference Architecture]]
    
- [[Terraform AWS Gotchas]]
    
- [[Terraform State]]
    
- [[Terraform Modules]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]