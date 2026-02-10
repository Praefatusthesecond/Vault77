---
tags: [azure, cicd, iam, devops]
domain: DevOps
subcategory: Azure
parent: Azure
aliases: [Azure CI/CD Authentication]
---

↑ [[Azure]]

# Azure CI/CD Authentication

This note explains **how CI/CD systems authenticate to Azure securely**.

---

## The core rule
> CI/CD pipelines should never use long- lived secrets if avoidable.

---

## Authentication patterns

### 1️⃣ Service Principal + Secret (legacy baseline)
- Simple
- Works everywhere
- Requires rotation

Acceptable but not ideal.

---

### 2️⃣ OIDC (preferred)
Used by:
- GitHub Actions
- Azure DevOps

Flow:
- CI system issues token
- Azure trusts token
- No secrets stored

This is the modern best practice.

---

### 3️⃣ Managed Identity
Used when:
- CI runners are hosted in Azure
- Terraform runs on Azure VMs

Zero secret management.

---

## Environment separation

Best practice:
- One identity per environment
- Separate subscriptions
- Explicit role assignments

---

## Common failure modes

- Token audience mismatch
- Missing RBAC assignment
- Wrong subscription targeted
- Confusing tenant vs subscription

---

## Related
- [[Azure IAM + Terraform]]
- [[Azure RBAC]]
- [[AWS IAM + CI-CD Authentication]]
