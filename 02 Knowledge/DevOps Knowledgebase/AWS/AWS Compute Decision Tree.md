---
tags: [aws, decision-tree, compute, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [AWS Compute Selection Guide]
---

↑ [[AWS]]

# AWS Compute Decision Tree

Goal: choose the right compute option without overthinking it.

## Decision tree

1) **Is it event- driven or short tasks (seconds- minutes)?**
- Yes → **Lambda**
- No → go to 2

2) **Do you need to run containers?**
- Yes → go to 3
- No → go to 5

3) **Do you want to manage Kubernetes?**
- Yes → **EKS**
- No → go to 4

4) **Do you want AWS to manage the container orchestration layer?**
- Yes → **ECS** (often simplest)
- No / portability required → **EKS**

5) **Do you need full OS control (custom agents, legacy apps, special drivers)?**
- Yes → **EC2**
- No → go to 6

6) **Is it a web app/API that fits a managed platform model?**
- Yes → **Elastic Beanstalk** or **App Runner** (if you use it)
- No → **EC2** (default safe choice)

## Notes / heuristics
- If you’re unsure: **EC2** is the “least surprises” baseline.
- If you want lowest ops overhead for containers: **ECS** beats EKS for many teams.
- If you have spiky traffic and stateless compute: **Lambda** can be a cost and ops win.

## Pitfalls
- Choosing EKS for “future- proofing” without a Kubernetes need.
- Forcing Lambda into long- running or heavy CPU tasks.
- Running everything on EC2 because “that’s what we know” when containers would simplify releases.

## Related
- [[AWS IAM + CI-CD Authentication]]
- [[AWS VPC Architecture Patterns]]
