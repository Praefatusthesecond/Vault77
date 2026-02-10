---
tags: [terraform, iac, devops]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
↑[[Terraform]]

# Terraform AWS Gotchas

Terraform + AWS is a very common combo — usually stable — but AWS has a bunch of sharp edges
that Terraform will not protect you from.

← Back to [[Terraform]]

---

## 1. IAM Permissions Are the #1 Failure Point

Most “Terraform errors” on AWS are actually IAM errors.

Common messages:
- `AccessDenied`
- `UnauthorizedOperation`

Terraform may:
- Create some resources
- Fail halfway
- Leave partial infrastructure behind

### Guidance
- Use a dedicated Terraform execution role
- Grant permissions explicitly (least- privilege, but complete)
- Ensure Terraform can both *read* and *write* what it manages

---

## 2. IAM Eventual Consistency (Propagation Delay)

IAM changes can take time to propagate.

Symptoms:
- Role/policy created or attached
- Terraform immediately uses it
- AWS returns “not found” or “not authorized”

### Mitigations
- Split IAM and infra applies
- Use explicit dependencies where needed
- Re- run apply after a short wait (annoying but normal)

---

## 3. Region Scope vs Global Services Confusion

Some services are global (or “mostly global”), others are region- scoped.

Examples:
- IAM: global
- Route53: global
- CloudFront: global
- EC2/RDS/ALB: regional

### Pitfall
Mixing global + regional assumptions causes confusing provider/region behavior.

### Guidance
- Be explicit about regions
- Use provider aliases for multi- region architectures

---

## 4. `count` Can Cause Mass Replacement

If you use `count` with a list and the list order changes, indexes shift.

Example failure mode:
- Remove one subnet from a list
- Terraform reindexes resources
- Suddenly half your infra wants replacement

### Rule
- Use `for_each` for identity- based resources
- Use `count` only for simple “N of the same thing”

---

## 5. Renaming in Terraform Looks Like Destroy/Create

Terraform identifies resources by address:
`aws_instance.web`

If you rename it to:
`aws_instance.app`

Terraform sees:
- Destroy old
- Create new

### Fix
Use:
```bash
terraform state mv aws_instance.web aws_instance.app
```

---
## 6. Networking Changes Cascade Hard (VPC/Subnets)

Changing:

- VPC CIDR blocks
    
- subnet CIDRs
    
- AZ mappings
    
- route tables
    

…can force replacements and cause outages.

### Rule

Treat networking foundations as **immutable after go- live**.

---

## 7. Security Group Rule Changes Are Instant (and Risky)

Security group changes apply immediately and can break live traffic.

Common risk patterns:

- Replacing allow rules with narrower rules
    
- Removing egress assumptions
    
- Tightening SGs without staged rollout
    

### Guidance

- Review SG changes as carefully as code changes
    
- Consider staged updates for critical services
    

---

## 8. S3 Remote State Needs Guardrails

If you use S3 for state, missing protections can wreck your day.

### Must- haves

- Versioning enabled
    
- DynamoDB state locking
    
- Strong IAM boundary around state bucket
    
- Encryption (SSE- S3 or SSE- KMS)
    

### Common mistakes

- No locking → concurrent applies corrupt state
    
- No versioning → bad state overwrite = game over
    

---

## 9. Data Sources Can Change Under Your Feet

Data sources are evaluated at plan/apply time.

Examples:

- `data.aws_ami` selecting “latest”
    
- AZ lists changing over time
    
- Account/partition differences
    

### Result

Unexpected diffs, forced replacements.

### Guidance

- Pin AMI IDs for stability
    
- Use explicit filters and owners
    
- Avoid “latest” in prod unless you truly want that
    

---

## 10. Replacement Triggers You Didn’t Expect

Many AWS resources have immutable fields. Changing them forces replacement:

- ALB name
    
- target group port/protocol (often)
    
- launch template certain fields
    
- some RDS settings (varies)
    

Terraform will clearly mark:

`Forces new resource`

### Rule

If it forces replacement, assume downtime risk until proven otherwise.

---

## 11. Tags Drift and Service- Added Tags

AWS services may add tags or change them.  
Terraform may show perpetual diffs.

### Mitigation (use carefully)

```terraform
lifecycle {
  ignore_changes = [tags]
}

```

Better: manage tags consistently and avoid ignoring unless necessary.

---

## 12. “Orphaned” Resources After Failed Apply

Terraform can fail mid- apply and leave resources created but not fully wired.

### What to do

- Inspect state: `terraform state list`
    
- Inspect AWS console/resources
    
- Decide: import or destroy manually (and clean state)
    

Try not to “panic apply” repeatedly without understanding what happened.

---

## 13. Import Is Not Code Generation

`terraform import`:

- adds to state
    
- does not generate usable `.tf`
    

Expect:

- manual configuration
    
- drift resolution
    
- iterative cleanup
    

---

## 14. CI/CD Amplifies Mistakes

Bad patterns:

- Applying from feature branches
    
- No manual approval for prod
    
- Shared state across environments
    

### Best practice

- Plan on merge requests
    
- Apply from main only
    
- Manual gate for prod
    

→ See [[Terraform + GitLab CI]]

---

## Final AWS Rule

If Terraform fails on AWS, assume:

- IAM permissions
    
- IAM propagation delay
    
- immutable field replacement
    

Then confirm.

---

## Related Notes

- [[Terraform AWS Reference Architecture]]
    
- [[Terraform Debugging Playbook]]
    
- [[Terraform State]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]
