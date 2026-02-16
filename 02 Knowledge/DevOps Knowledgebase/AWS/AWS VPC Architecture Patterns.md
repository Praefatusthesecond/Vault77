---
tags: [aws, vpc, networking, architecture, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [AWS Network Architecture]
---

Back to  [[AWS]]

# AWS VPC Architecture Patterns

This note documents **common AWS VPC designs** and when to use them.

---

## Why VPC architecture matters
VPC design:
- Is hard to change later
- Affects security, cost, and scalability
- Impacts every service deployed on top

Bad VPC design = permanent pain.

---

## Single VPC (simple setups)

Use when:
- Small workloads
- Non- production
- Minimal isolation needs

Characteristics:
- One VPC
- Public + private subnets
- NAT Gateway

---

## Multi- tier VPC (most common)

Pattern:
- Public subnets → load balancers
- Private subnets → application + databases

Benefits:
- Clear security boundaries
- Scales well
- Industry standard

---

## Hub- and- spoke VPC

Pattern:
- Central networking VPC
- Spoke VPCs per environment or app
- Connected via Transit Gateway

Used when:
- Multiple teams
- Shared services
- Strong isolation required

---

## Subnet design principles

- One subnet per AZ
- Public ≠ internet- facing by default
- CIDR planning upfront is critical

Never undersize CIDR blocks.

---

## Security layers

- Security Groups → primary control
- NACLs → coarse- grained guardrails
- Route tables → traffic control

Avoid complex NACL setups unless required.

---

## Terraform relevance

- VPC is usually the first module
- CIDR changes are disruptive
- Outputs feed almost every other module

---

## Common pitfalls

❌ Flat networks  
❌ Overlapping CIDRs  
❌ Too many NAT gateways  
❌ No future growth planning  

---

## Related notes
- [[AWS VPC Basics]]
- [[Terraform AWS Provider]]
- [[AWS IAM Fundamentals]]