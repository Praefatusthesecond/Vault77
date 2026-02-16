---
tags: [terraform, iac, devops]
aliases: [Terraform plus AWS, Terraform and AWS, Terraform & AWS]
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]] 

### Guidance
- Read plans carefully
- Use `terraform state mv` when refactoring names
- Avoid cosmetic renames in prod

---

## 7. VPC and Subnet Changes Cascade Hard

Changing:
- CIDR blocks
- Subnet ranges
- Availability zone mapping

Often forces:
- Subnet replacement
- Resource destruction
- Network outages

### Rule
VPC layout should be treated as **immutable** once live.

---

## 8. S3 Remote State Needs Extra Guardrails

S3 is commonly used for Terraform state.

Common issues:
- Missing versioning
- No state locking (DynamoDB)
- Accidental bucket deletion
- Wrong IAM permissions in CI

### Best Practice
- Enable versioning
- Use DynamoDB for locking
- Lock down delete permissions

State loss = infrastructure amnesia.

---

## 9. Terraform Will Not Protect You From Yourself

Terraform will happily:
- Destroy RDS databases
- Replace EC2 instances
- Recreate load balancers

As long as the plan says so.

### Rule
Never assume “Terraform wouldn’t do that”.

Always read:
- `-`
- `+`
- `-/+`

---

## 10. Data Sources Can Change Under Your Feet

AWS data sources (AMI lookups, AZ lists, account info) are evaluated at plan time.

Example:
- Latest AMI changes
- AZ order changes
- New regions added

Result:
- Unexpected diffs
- Forced replacements

### Mitigation
Pin versions and IDs where stability matters.

---

## 11. AWS Tags Drift Easily

AWS may:
- Add system tags
- Normalize casing
- Inject service tags

Terraform sees this as drift.

### Mitigation (when appropriate)
```hcl
lifecycle {
  ignore_changes = [tags]
}
```

Use sparingly — tags are often important.

---

## 12. Importing Existing AWS Resources Is Manual Labor

Terraform import:

- Adds resources to state
    
- Does NOT generate clean Terraform code
    

Expect:

- Manual `.tf` writing
    
- Attribute alignment
    
- Drift cleanup
    

Import is a migration step, not daily workflow.

---

## 13. CI Pipelines Amplify AWS Mistakes

Common CI anti- patterns:

- Applying from feature branches
    
- Shared state across environments
    
- No manual approval for prod
    

AWS will not stop Terraform from destroying prod.

### Rule

- Plan on PR
    
- Apply from main only
    
- Manual approval for prod
    

→ See [[Terraform + GitLab CI]]

---

## Final AWS Rule

> If Terraform fails on AWS, assume:
> 
> - IAM permissions
>     
> - IAM propagation delay
>     
> - Resource immutability
>     

Then confirm.

---

## Related Notes

- [[Terraform Debugging Playbook]]
    
- [[Terraform Gotchas]]
    
- [[Terraform State]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]
