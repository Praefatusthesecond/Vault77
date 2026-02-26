---
tags: [ policy-as-code, sentinel, terraform, cicd ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# HashiCorp Sentinel

Sentinel is HashiCorp's policy framework integrated into Terraform Cloud and Enterprise.

## Where it runs
- Terraform Cloud plans
- Terraform Enterprise pipelines

## Policy levels
- Advisory (warn only)
- Soft mandatory
- Hard mandatory

## Strengths
- Deep Terraform context
- No plan JSON plumbing
- Strong enterprise governance

## Limitations
- Tied to HashiCorp platform
- Not portable outside Terraform Cloud

Sentinel is ideal if Terraform Cloud is already your control plane.
