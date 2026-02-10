---
tags: [terraform, iac, devops, gotchas]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
↑[[Terraform]]

# Terraform Gotchas

This note documents **common Terraform pitfalls** that are not obvious at first glance.
Most of these are learned the hard way — ideally only once.

← Back to [[Terraform]]

---

## 1. Terraform Is Declarative, Not Procedural

Terraform does **not** execute resources in the order you write them.

### ❌ Wrong assumption
```hcl
resource "aws_instance" "a" {}
resource "aws_instance" "b" {}
```
Terraform may create b before a.

### ✅ Correct mental model

Terraform builds a **dependency graph**.

Use:

- implicit dependencies (references)
    
- `depends_on` (sparingly)
    

---

## 2. State Is Sacred

If your state is wrong, Terraform is wrong.

### Common mistakes

- Editing `terraform.tfstate` manually
    
- Deleting resources outside Terraform
    
- Sharing local state with teammates
    

### Symptoms

- Terraform wants to recreate everything
    
- “Resource already exists” errors
    

### Rule

> **Terraform is only as accurate as its state**

---

## 3. One State per Environment (Always)

### ❌ Bad

`terraform apply - var="env=dev" terraform apply - var="env=prod"`

### ✅ Good

`envs/ ├── dev/ ├── test/ └── prod/`

Each environment:

- Separate state
    
- Separate backend
    
- Separate credentials
    

---

## 4. `terraform apply` Is Not Harmless

Terraform will happily:

- Replace VMs
    
- Destroy databases
    
- Recreate load balancers
    

### Especially dangerous

- `force_new_resource`
    
- Immutable fields (AMI, disk size, subnet)
    

### Rule

> **Always read the plan like a diff**

---

## 5. Provider Version Drift

Providers change behavior.

### ❌ Missing constraint

`required_providers {   aws = {     source = "hashicorp/aws"   } }`

### ✅ Correct

`required_providers {   aws = {     source  = "hashicorp/aws"     version = "~> 5.0"   } }`

---

## 6. `count` vs `for_each`

This bites **everyone**.

### ❌ `count` with changing lists

`count = length(var.subnets)`

Removing an item shifts indexes → resource recreation.

### ✅ Prefer `for_each`

`for_each = toset(var.subnets)`

### Rule

> Use `count` for numbers  
> Use `for_each` for identities

---

## 7. Renaming Resources Destroys Them

Terraform identifies resources by:

`resource_type.resource_name`

### ❌ Rename without migration

`aws_instance.web → aws_instance.app`

Terraform sees:

- Destroy `web`
    
- Create `app`
    

### ✅ Correct approach

`terraform state mv aws_instance.web aws_instance.app`

---

## 8. Terraform Does Not Auto- Detect External Changes Well

Manual changes in:

- AWS Console
    
- Azure Portal
    
- Kubernetes
    
- GitHub UI
    

…may cause **drift**.

### Fix

`terraform plan terraform refresh`

But sometimes:

> Terraform will only notice _after_ it wants to destroy something.

---

## 9. Outputs Are Not Secrets

Terraform outputs are:

- Stored in state
    
- Visible in CI logs
    
- Visible via `terraform output`
    

### ❌ Bad

`output "db_password" {   value = var.db_password }`

### ✅ Better

- Use secret managers
    
- Mark outputs as sensitive
    

`output "db_password" {   value     = var.db_password   sensitive = true }`

---

## 10. Variables Are Evaluated Early

Terraform variables:

- Are resolved **before** apply
    
- Cannot depend on resources
    

### ❌ Invalid

`variable "ip" {   default = aws_instance.web.public_ip }`

### ✅ Use outputs instead

---

## 11. `terraform destroy` Is Final

Terraform does not ask:

> “Are you _really_ sure?”

Especially in CI:

`terraform destroy - auto- approve`

### Rule

- Never auto- destroy prod
    
- Use separate credentials for prod
    

---

## 12. CI Pipelines Can Make Things Worse (If Done Wrong)

Common CI mistakes:

- Applying from feature branches
    
- No manual approval for prod
    
- Shared state across pipelines
    

### Best practice

- Plan on PR
    
- Apply only from main
    
- Manual approval for prod
    

→ See [[Terraform + GitLab CI]]

---

## 13. Terraform Is Bad at “Day 2” Changes

Terraform excels at:

- Creating infrastructure
    
- Large- scale changes
    

Terraform struggles with:

- Small OS tweaks
    
- App- level changes
    
- In- place config edits
    

### Rule

> Terraform builds the house  
> Ansible furnishes it

→ See [[Terraform + Ansible]]

---

## 14. Import Is Not Magic

`terraform import`

Only:

- Imports into state
    
- Does NOT generate clean `.tf` code
    

Expect:

- Manual cleanup
    
- Drift resolution
    
- Pain (but useful pain)
    

---

## 15. When Terraform Fights You, Stop

Signs:

- Endless destroy/create loops
    
- Massive diffs for tiny changes
    
- You’re afraid of `apply`
    

### Action

- Re- evaluate module design
    
- Check state
    
- Split resources
    
- Consider lifecycle rules
    

---

## Final Rule (The One to Remember)

> **Terraform rewards discipline and punishes shortcuts**

---

## Related Notes

- [[Terraform State]]
    
- [[Terraform Modules]]
    
- [[Terraform Best Practices]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform + Ansible]]
    
- [[Terraform]]