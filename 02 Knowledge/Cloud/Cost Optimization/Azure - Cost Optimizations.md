---
title: Azure - Cost Optimization
tags: [ azure, cloud, cost-optimization, finops ]
type: knowledge
domain: cloud
status: active
parent: Cost Optimization Index
---
Back to [[Cost Optimization Index]]

# Azure - Cost Optimization

## 🔹 Major Azure Cost Drivers

- Virtual Machines
    
- Azure SQL
    
- Storage Accounts
    
- Data Egress
    
- App Services
    
- AKS
    
- Log Analytics
    

---

## 1️⃣ Right-Sizing VMs

Use:

- Azure Advisor
    
- Azure Monitor metrics
    

Common waste:

- Overprovisioned memory
    
- Dev VMs running 24/7
    

---

## 2️⃣ Azure Reservations

Commit to 1 or 3 years.

Applies to:

- VMs
    
- SQL Database
    
- CosmosDB
    
- App Service
    

---

## 3️⃣ Azure Savings Plan for Compute

Commit to hourly spend.

More flexible than reservations.

---

## 4️⃣ Hybrid Benefit

If you own Windows Server / SQL licenses:

Use Azure Hybrid Benefit  
Huge savings for Windows workloads.

---

## 5️⃣ Dev/Test Pricing

Lower pricing tier for non-production.

---

## 6️⃣ Storage Optimization

- Move to cool/archive tier
    
- Enable lifecycle management
    
- Remove orphaned disks
    
- Remove unattached public IPs
    

---

## 7️⃣ Log Analytics & Monitoring Costs

Common hidden cost.

Reduce by:

- Shorter retention
    
- Filtering logs
    
- Sampling
    
- Proper workspace architecture