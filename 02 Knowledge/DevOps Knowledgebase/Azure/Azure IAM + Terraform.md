---
tags: [azure, iam, terraform, devops]
domain: DevOps
subcategory: Azure
parent: Azure
aliases: [Azure Identity with Terraform]
---

↑ [[Azure]]

# Azure IAM + Terraform

This note explains **how Terraform authenticates to Azure**, and how identity is typically managed in real- world setups.

---

## Azure IAM mental model
Azure IAM is **identity- first**:
- Identity lives in **Entra ID (tenant)**
- Permissions are assigned via **RBAC**
- Resources live in **subscriptions**

Terraform must bridge all three.

---

## Authentication options for Terraform

### 1️⃣ Service Principal (most common)
A service principal represents an application identity in Entra ID.

Used when:
- Running Terraform locally
- Running in CI/CD
- Managing multiple subscriptions

Characteristics:
- Client ID + secret or certificate
- Explicit lifecycle management
- Works everywhere

---

### 2️⃣ Managed Identity (preferred in Azure- hosted CI)
Azure- managed identity tied to:
- VM
- App Service
- GitHub runner in Azure
- Azure DevOps agent

Benefits:
- No secrets
- Automatic rotation
- Least operational overhead

Limitation:
- Only works *inside* Azure

---

## RBAC for Terraform

Terraform typically needs:
- Contributor on target scope
- Reader at minimum
- Sometimes Owner (bootstrap only)

Best practice:
- Assign RBAC at **subscription** or **resource group** level
- Avoid tenant- wide permissions

---

## Multi- subscription pattern

Typical setup:
- One tenant
- One subscription per environment
- One Terraform identity
- Provider aliases per subscription

---

## Common pitfalls

❌ Confusing Entra ID permissions with RBAC  
❌ Overusing Owner role  
❌ Forgetting RBAC inheritance  
❌ Terraform works locally but not in CI  

---

## Related
- [[Azure Identity (Entra ID)]]
- [[Azure RBAC]]
- [[Terraform AzureRM Provider]] (create later)
