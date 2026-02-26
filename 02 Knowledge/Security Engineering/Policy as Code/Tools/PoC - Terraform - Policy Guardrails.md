---
tags: [ policy-as-code, terraform, guardrails ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Terraform - Policy Guardrails

Terraform is often the first enforcement point.

## Guardrail layers
- Formatting and linting
- Static analysis
- Policy evaluation on plans
- Platform enforcement

## Recommended stack
- Terraform validate
- Plan to JSON
- OPA or Sentinel
- Cloud-native enforcement

## What to guard
- Resource exposure
- Identity permissions
- Encryption
- Regions
- Naming and tagging

Terraform guardrails prevent bad infrastructure before it exists.
