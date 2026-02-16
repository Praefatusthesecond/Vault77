---
tags: [azure, decision- tree, compute, devops]
domain: DevOps
subcategory: Azure
parent: Azure
---

Back to  [[Azure]]

# Azure Compute Decision Tree

Goal: choose Azure compute without defaulting to VMs.

---

## Decision tree

1) **Event- driven or short- lived tasks?**
- Yes → **Azure Functions**
- No → go to 2

2) **Containerized workload?**
- Yes → go to 3
- No → go to 5

3) **Need Kubernetes?**
- Yes → **AKS**
- No → go to 4

4) **Want managed container runtime without K8s?**
- Yes → **Azure Container Apps**
- No → **AKS**

5) **Need full OS control?**
- Yes → **Azure Virtual Machines**
- No → **App Service**

---

## Heuristics

- Defaulting to VMs = higher ops cost
- AKS is powerful but heavy
- App Service fits many web apps better than expected

---

## Common pitfalls

❌ Choosing AKS for “future flexibility”  
❌ Forcing Functions into long- running tasks  
❌ Running everything on VMs out of habit  

---

## Related
- [[Azure Networking Architecture Patterns]]
- [[Azure CI- CD Authentication]]
