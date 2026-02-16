---
tags: [terraform, aws, state, s3, dynamodb, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [Terraform Remote State AWS]
---

Back to  [[Terraform]]

# Remote Terraform State in AWS

This note documents the **standard AWS- backed remote state pattern** using S3 and DynamoDB.

---

## Why remote state matters
Terraform state:
- Is critical
- Is sensitive
- Must be shared safely

Local state does not scale beyond one person.

---

## Standard AWS pattern

Components:
- S3 bucket → state storage
- DynamoDB table → state locking

This is the **de facto production standard**.

---

## S3 bucket responsibilities

- Store `.tfstate` files
- Enable versioning
- Restrict access tightly
- Encrypt at rest

Never expose the state bucket publicly.

---

## DynamoDB responsibilities

- Prevent concurrent Terraform runs
- Avoid state corruption
- Provide locking guarantees

Without locking, Terraform is unsafe in CI/CD.

---

## Backend configuration (conceptual)

```hcl
backend "s3" {
  bucket         = "terraform- state- prod"
  key            = "network/terraform.tfstate"
  region         = "eu- west-1"
  dynamodb_table = "terraform- locks"
  encrypt        = true
}
```

## Environment separation

Best practice:

- Separate state per environment
    
- Separate accounts if possible
    
- Never share prod state access
    

---

## Security considerations

- State contains secrets
    
- Lock down IAM permissions
    
- Log access via CloudTrail
    

---

## Common pitfalls

❌ One bucket for everything  
❌ No DynamoDB locking  
❌ Broad IAM access to state  
❌ Mixing environments

---

## Related notes

- [[Terraform AWS Provider]]
    
- [[AWS IAM + Terraform]]
    
- [[AWS IAM Fundamentals]]
