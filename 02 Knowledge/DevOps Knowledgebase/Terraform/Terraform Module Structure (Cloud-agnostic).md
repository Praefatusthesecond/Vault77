---
tags: [terraform, modules, architecture, devops, iac]
domain: DevOps
subcategory: Terraform
parent: Terraform Knowledgebase
aliases: [Terraform Repo Structure, Terraform Module Architecture]
---

↑ [[Terraform]]

# Terraform Module Structure (Cloud- agnostic)

This note describes a **repeatable Terraform structure** that works for AWS, Azure, or mixed environments.

Goal: consistent deployments, clean diffs, minimal surprises in CI/CD.

---

## Core principles

### 1) Keep modules generic, keep stacks specific
- **Modules**: reusable building blocks (VPC/VNet, IAM/RBAC bindings, storage, etc.)
- **Stacks (root modules)**: environment- specific compositions (dev/test/prod)

### 2) One stack = one state file
A stack should map to one backend key / state file.
Small, composable stacks are safer than giant monolith states.

### 3) Outputs are the contract
Stacks communicate via outputs (and remote state if necessary), not by “reaching into” resources.

---

## Recommended repository layout

```text
terraform/
├─ modules/
│  ├─ networking/
│  ├─ identity/
│  ├─ compute/
│  ├─ storage/
│  └─ observability/
├─ stacks/
│  ├─ aws/
│  │  ├─ dev/
│  │  │  ├─ network/
│  │  │  ├─ iam/
│  │  │  └─ app/
│  │  └─ prod/
│  │     ├─ network/
│  │     ├─ iam/
│  │     └─ app/
│  ├─ azure/
│  │  ├─ dev/
│  │  │  ├─ network/
│  │  │  ├─ identity/
│  │  │  └─ app/
│  │  └─ prod/
│  │     ├─ network/
│  │     ├─ identity/
│  │     └─ app/
│  └─ shared/
│     ├─ dns/
│     └─ monitoring/
├─ env/
│  ├─ dev.tfvars
│  ├─ test.tfvars
│  └─ prod.tfvars
└─ README.md
```

Notes:

- `modules/` contains only reusable code
    
- `stacks/` contains only deployable roots
    
- `env/` holds reusable vars files (optional)
    

---

## What belongs in a module?

✅ Good module contents:

- `main.tf`, `variables.tf`, `outputs.tf`
    
- `README.md` documenting inputs/outputs
    
- Opinions encoded as defaults (but overridable)
    

✅ Modules should:

- Expose only what callers need
    
- Output stable identifiers (ids/arns/names)
    
- Avoid hardcoding environment logic
    

❌ Modules should not:

- Manage backend configuration
    
- Contain provider configuration (usually)
    
- Depend on local file paths
    
- Use environment names internally unless passed explicitly
    

---

## Stacks (root modules): what belongs there?

Stacks should contain:

- Provider configuration (region/subscription, assume_role, etc.)
    
- Backend config (or backend.hcl usage)
    
- Composition of modules
    
- Environment- specific naming + tags
    
- Minimal “glue” resources only if necessary
    

Stacks should be boring, predictable, and reviewable.

---

## Provider strategy (cloud- agnostic)

### Preferred: providers in stacks

- Keep providers in root modules (stacks)
    
- Pass providers to modules if needed
    

AWS:

- [[Terraform AWS Provider]]
    

Azure:

- [[Terraform AzureRM Provider]]
    

---

## Environment separation patterns

### Option A: Separate stacks per env (recommended)

- `stacks/aws/dev/*`
    
- `stacks/aws/prod/*`  
    Each stack has its own state.
    

### Option B: Terraform workspaces (use carefully)

- Works, but can create confusion in CI/CD
    
- Easy to apply to wrong workspace
    

If you have strict CI discipline, workspaces can be fine.  
Otherwise, prefer separate stacks.

---

## Naming & tagging strategy

Standardize across clouds:

- `name_prefix` (company/project)
    
- `environment` (dev/test/prod)
    
- `owner`, `cost_center`, `service`
    

This improves:

- cost allocation
    
- governance
    
- incident response
    

---

## Dependency management between stacks

### Preferred: explicit composition

If app needs network, deploy them in one stack if reasonable.

### If you must split stacks:

Use outputs + remote state carefully.

AWS backend:

- [[AWS Remote Terraform State]]
    

Azure backend:

- [[Azure Remote Terraform State]]
    

---

## Versioning & module sources

Recommended:

- Pin module versions (Git tags)
    
- Avoid floating `main` branch references
    

Examples:

- `source = "git::ssh://...//modules/networking?ref=v1.3.0"`
    

This prevents “surprise changes” in prod.

---

## CI/CD implications (practical)

A stack should be runnable with:

- `terraform init`
    
- `terraform plan`
    
- `terraform apply`
    

and a small set of variables.

Ideal pipeline behavior:

- Plan per stack
    
- Apply only on main branch
    
- Environment- specific approvals for prod
    

---

## Common pitfalls

- Giant mega- state that takes ages to plan/apply
    
- Modules that try to be “too smart”
    
- Hardcoded environment behavior inside modules
    
- Unpinned module versions
    
- Using outputs inconsistently (breaking contracts)
    

---

## Related notes

- [[Terraform IAM Modules]]
    
- [[AWS IAM + Terraform]]
    
- [[Azure IAM + Terraform]]
    
- [[AWS Remote Terraform State]]
    
- [[Azure Remote Terraform State]]
