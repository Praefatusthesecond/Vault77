---
tags: [terraform, azure, provider, iac, devops]
domain: DevOps
subcategory: Terraform
parent: Terraform Knowledgebase
aliases: [Terraform Azure Provider, AzureRM Provider]
---

Back to  [[Terraform]]

# Terraform AzureRM Provider

This note documents how Terraform authenticates to Azure using the **AzureRM provider**, and how it is typically configured in real- world environments.

---

## What this is
The AzureRM provider is Terraform’s interface to:
- Azure Resource Manager (ARM)
- Azure subscriptions
- Azure APIs

It defines:
- **How Terraform authenticates**
- **Which tenant and subscription it targets**
- **What permissions are required**

---

## Why this matters
Most Terraform- on- Azure issues are **provider or identity issues**, not resource issues.

Common symptoms:
- `AuthorizationFailed`
- Resources created in the wrong subscription
- Terraform works locally but fails in CI/CD
- Silent failures due to policy or RBAC

---

## AzureRM authentication mental model

Terraform must satisfy **three things**:

1. **Authenticate to Entra ID (tenant)**
2. **Be authorized via Azure RBAC**
3. **Target the correct subscription**

If any of these are wrong → Terraform fails.

---

## Basic provider configuration

Minimal example:

```hcl
provider "azurerm" {
  features {}
}
```

Terraform then uses the Azure credential chain to authenticate.

---

## Authentication methods (in order of preference)

### 1️⃣ OIDC (recommended for CI/CD)

Used by:

- GitHub Actions
    
- Azure DevOps
    
- Modern GitLab setups
    

Characteristics:

- No secrets
    
- Short- lived tokens
    
- Strong security posture
    

Terraform relies on environment- provided identity.

---

### 2️⃣ Managed Identity (preferred inside Azure)

Used when Terraform runs on:

- Azure VM
    
- Azure DevOps agent
    
- Azure- hosted runner
    

Example:
```hcl
provider "azurerm" {
  features {}
  use_msi = true
}
```
Benefits:

- No credentials to manage
    
- Automatic rotation
    
- Least operational overhead
    

Limitation:

- Only works from Azure- hosted compute
    

---

### 3️⃣ Service Principal (classic pattern)

Uses:

- Client ID
    
- Client secret or certificate
    
- Tenant ID
    
- Subscription ID
    

Common in:

- Local development
    
- Legacy CI/CD
    

⚠️ Secrets must be rotated and protected.

---

## Subscription targeting

Azure resources always live in a **subscription**.

Terraform determines the subscription via:

- Environment variables
    
- Explicit provider configuration
    

Best practice:

> Always make subscription targeting explicit in CI/CD.

---

## Multiple subscriptions & provider aliases

Used when deploying to:

- Dev / test / prod subscriptions
    
- Shared infrastructure subscriptions
    

Example:
```terraform
provider "azurerm" {
  alias           = "prod"
  features        {}
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
```
Referenced as:
```terraform
provider = azurerm.prod
```

---

## Role requirements for Terraform

Terraform typically needs:

- **Contributor** on target scope
    
- **Reader** at minimum
    
- **Owner** only for bootstrapping
    

Avoid:

- Tenant- wide permissions
    
- Global Admin roles
    

See:

- [[Azure RBAC]]
    
- [[Azure IAM + Terraform]]
    

---

## Common failure modes (real- world)

- Terraform authenticates but cannot create resources  
    → Missing RBAC assignment
    
- Terraform works locally but not in CI  
    → Different identity or subscription
    
- Terraform fails with vague authorization errors  
    → Azure Policy or wrong scope
    
- Resources created in unexpected subscription  
    → Provider alias or env var mismatch
    

---

## Azure Policy interaction

Terraform:

- Does not bypass Azure Policy
    
- Must comply with deny / modify effects
    

If Terraform fails unexpectedly:

- Check policy assignments first
    

See:

- [[Azure Policies]]
    

---

## Best practices

- Prefer OIDC or managed identity
    
- Avoid long- lived client secrets
    
- Use provider aliases intentionally
    
- Separate subscriptions per environment
    
- Log and audit identity usage
    

---

## Related notes

- [[Azure IAM + Terraform]]
    
- [[Azure CI- CD Authentication]]
    
- [[Azure RBAC]]
    
- [[Terraform AWS Provider]]