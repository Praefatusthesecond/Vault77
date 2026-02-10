---
tags: [aws, decision- tree, vpc, networking, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [AWS VPC Selection Guide]
---

↑ [[AWS]]

# AWS Networking Decision Tree

Goal: choose a VPC architecture pattern quickly.

## Decision tree

1) **Single team, single app, early stage?**
- Yes → **Single VPC, multi- AZ, public+private subnets**
- No → go to 2

2) **Multiple environments (dev/test/prod) needing isolation?**
- Yes → **Separate AWS accounts** + VPC per account (preferred)
- No → VPC per environment (acceptable), but guardrails matter

3) **Multiple teams/apps needing shared services (DNS, tooling, inspection)?**
- Yes → **Hub- and- spoke** with a shared networking VPC
- No → go to 4

4) **Need many VPC- to- VPC connections or growth expected?**
- Yes → **Transit Gateway** (plan early)
- No → **VPC peering** (keep it small)

## Notes
- Favor **account separation** over “one huge VPC” when possible.
- Design CIDRs for growth: changing later hurts.

## Related
- [[AWS VPC Basics]]
- [[AWS VPC Architecture Patterns]]
