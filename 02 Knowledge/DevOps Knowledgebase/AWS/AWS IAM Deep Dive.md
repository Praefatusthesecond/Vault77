---
tags: [aws, iam, security, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [AWS IAM Advanced, IAM Deep Dive]
---

Back to  [[AWS]]

# AWS IAM Deep Dive

This note expands on [[AWS IAM Fundamentals]] and focuses on **how IAM actually behaves in practice**.

---

## Mental model (start here)
IAM answers exactly two questions:

1. **Who are you?**  
2. **What are you allowed to do?**

Everything else (users, roles, policies, STS) exists to answer those two questions safely and at scale.

---

## Identities in IAM

### IAM Users
- Long- lived credentials
- Represent humans
- Should be avoided for automation

**Best practice**
- Use IAM users only for:
  - Break- glass access
  - Very limited human access
- Enforce MFA always

---

### IAM Roles (preferred)
- No long- lived credentials
- Assumed temporarily
- Used by:
  - EC2
  - Lambda
  - CI/CD pipelines
  - Cross- account access

> If something is automated, it should use a **role**, not a user.

---

## Policies (the real core)

### Policy types
- **Identity- based policies** (attached to users/roles)
- **Resource- based policies** (attached to resources like S3)

### Policy structure
Policies are JSON documents defining:
- Actions
- Resources
- Conditions
- Effect (Allow / Deny)

**Key rule**
> Explicit deny always wins.

---

## Trust vs Permission Policies (critical distinction)

### Trust Policy
- Answers: **Who can assume this role?**
- Used only during role assumption

Example:
- EC2 service
- Another AWS account
- OIDC provider (GitHub Actions)

---

### Permission Policy
- Answers: **What can the role do once assumed?**
- Controls actual AWS actions

⚠️ Mixing these two up is one of the most common IAM mistakes.

---

## STS & Temporary Credentials

### AWS STS (Security Token Service)
- Issues short- lived credentials
- Used when assuming roles

### Why this matters
- Limits blast radius
- Enables cross- account access
- Required for modern CI/CD

Most AWS access today is:
> **AssumeRole → Temporary credentials → API calls**

---

## Cross- Account Access (common in real setups)

### How it works
1. Account A defines a role
2. Role trust policy allows Account B
3. Account B assumes the role
4. Temporary credentials are issued

### Typical use cases
- Central CI/CD account
- Shared Terraform deployment account
- Security tooling

---

## Service Control Policies (SCPs)

### What they are
- Guardrails at the AWS Organization level
- Apply to entire accounts or OUs

### What they are NOT
- They do NOT grant permissions
- They only restrict what *can* be granted

Think of SCPs as:
> “Even if IAM allows it, this is forbidden.”

---

## Conditions (advanced but powerful)

Policies can include conditions like:
- IP address
- MFA presence
- Time of day
- Source service

Example use cases:
- Force MFA for sensitive actions
- Restrict access to CI/CD IP ranges

---

## Common IAM Failure Modes (real- world)

- `AccessDenied` even though policy looks correct  
  → Often missing trust relationship

- Terraform works locally but fails in CI  
  → Different role, different permissions

- Everything works until SCPs are added  
  → SCP denies silently override IAM

- Overuse of `AdministratorAccess`  
  → Masks missing permissions and causes bad habits

---

## IAM Best Practices (battle- tested)

- Prefer roles over users
- Use least privilege
- Separate environments by account
- Enforce MFA everywhere
- Rotate credentials if users exist
- Log everything (CloudTrail)

---

## Terraform relevance

IAM is:
- One of the hardest Terraform domains
- Order- sensitive
- Easy to misconfigure

Common Terraform patterns:
- One IAM module per concern
- Explicit outputs for role ARNs
- Avoid inline policies for complex setups

See also:
- [[Terraform IAM Modules]]
- [[Terraform AWS Provider]]

---

## When to revisit this note
- CI/CD authentication fails
- Cross- account access breaks
- Security reviews
- Terraform refactors
