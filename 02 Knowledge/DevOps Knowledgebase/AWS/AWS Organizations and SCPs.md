---
tags: [aws, organizations, scp, security, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

↑ [[AWS]]

# AWS Organizations & SCPs

This note explains **how AWS Organizations and Service Control Policies (SCPs)** are used to enforce guardrails across accounts.

---

## AWS Organizations (what it is)
A service that allows you to:
- Group AWS accounts
- Centralize billing
- Apply organization- wide restrictions

The **account** remains the main isolation boundary.

---

## Service Control Policies (SCPs)

### What SCPs do
- Define the *maximum* permissions an account can ever have
- Apply to accounts or Organizational Units (OUs)

### What SCPs do NOT do
- They do NOT grant permissions
- They only restrict what IAM can allow

Think:
> IAM allows, SCPs veto.

---

## Why SCPs matter for Terraform & CI/CD

Terraform may:
- Have correct IAM permissions
- Still fail due to SCP denies

This often causes confusing `AccessDenied` errors.

---

## Common SCP use cases

- Prevent deleting CloudTrail
- Block root user actions
- Enforce region restrictions
- Block IAM user creation
- Require encryption

---

## CI/CD guardrail pattern

Typical setup:
- SCPs enforce non- negotiables
- IAM roles grant specific permissions
- CI/CD operates safely within bounds

This allows:
- Autonomy
- Safety
- Predictable behavior

---

## Common failure modes

- Terraform fails only in org- managed accounts
- SCP silently denies IAM permissions
- Overly aggressive SCP blocks automation

Always check SCPs when debugging IAM.

---

## Best practices

- Keep SCPs simple
- Document intent clearly
- Test SCPs in non- prod first
- Never use SCPs for fine- grained access control

---

## Related notes
- [[AWS Account Structure]]
- [[AWS IAM Deep Dive]]
- [[AWS IAM + Terraform]]
