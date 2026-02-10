---
tags: [azure, networking, architecture, devops]
domain: DevOps
subcategory: Azure
parent: Azure
aliases: [Azure VNet Architecture]
---

↑ [[Azure]]

# Azure Networking Architecture Patterns

This note documents **common Azure VNet designs** and when to use them.

---

## Single VNet (simple workloads)

Use when:
- Small teams
- Early- stage projects
- Non- production

Pattern:
- One VNet
- Multiple subnets
- NSGs per subnet

---

## Environment- per- VNet

Use when:
- Dev / test / prod separation
- Single subscription

Pattern:
- One VNet per environment
- Peering between VNets if needed

---

## Hub- and- spoke (most common at scale)

Use when:
- Multiple teams
- Shared services (DNS, firewall)
- Centralized inspection

Pattern:
- Hub VNet with shared services
- Spoke VNets per workload
- VNet peering or Virtual WAN

---

## Security principles

- NSGs are the primary control
- Route tables enforce traffic flow
- Azure Firewall or NVA in hub VNet

---

## Common pitfalls

❌ One giant flat VNet  
❌ No IP planning  
❌ Overusing NSGs on NIC level  
❌ Forgetting DNS design  

---

## Terraform relevance

- Networking modules come first
- CIDR changes are painful later
- Outputs feed almost all other modules

---

## Related
- [[Azure Networking Basics]]
- [[Azure Resource Groups]]
