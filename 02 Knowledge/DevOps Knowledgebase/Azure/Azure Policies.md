---
tags: [azure, policy, security, governance, devops]
domain: DevOps
subcategory: Azure
parent: Azure
aliases: [Azure Policy, Azure Governance]
---

↑ [[Azure]]

# Azure Policies

Azure Policy provides **governance guardrails**, similar in intent to AWS SCPs.

---

## What Azure Policy is
A service that:
- Evaluates resources
- Enforces rules
- Ensures compliance

Policies can:
- Audit
- Deny
- Modify
- Deploy automatically

---

## Policy vs RBAC

| Concern | Tool |
|------|-----|
| Who can do something | RBAC |
| What is allowed to exist | Policy |

Policy controls *resources*, not people.

---

## Common policy use cases

- Require tags
- Enforce regions
- Require encryption
- Block public IPs
- Enforce SKU usage

---

## Policy scopes

Policies can be assigned at:
- Management Group
- Subscription
- Resource Group

Inheritance flows downward.

---

## Terraform interaction

Terraform:
- May fail if policy denies resource creation
- Often surfaces cryptic errors
- Must comply with policy constraints

Always check policy assignments when Terraform fails unexpectedly.

---

## Common pitfalls

❌ Overly aggressive deny policies  
❌ No documentation for policy intent  
❌ Applying policy directly to prod first  

---

## Related
- [[Azure Tenant & Subscription Model]]
- [[Azure IAM + Terraform]]
- [[AWS Organizations and SCPs]]
