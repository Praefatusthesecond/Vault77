---
tags: [ policy-as-code, terraform, example ]
parent: "Policy as Code"
---
Back to  [[Policy as Code - Overview]]

# Example - Terraform Linting + OPA

## Flow
1. Terraform plan
2. Convert plan to JSON
3. Run Conftest
4. Fail CI on violations

## What it enforces
- Mandatory tags
- No public resources
- Encryption enabled

This is the fastest PaC win for most teams.
