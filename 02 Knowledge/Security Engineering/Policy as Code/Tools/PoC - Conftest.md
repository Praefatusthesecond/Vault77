---
tags: [ policy-as-code, opa, conftest, tools ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]
parent: Policy as Code
# Conftest

Conftest is a CLI wrapper around OPA for configuration files.

## What it does
- Runs Rego policies against files
- Supports JSON, YAML, HCL, Terraform plan JSON
- Returns pass/fail with messages

## Common use cases
- Terraform plan validation
- Kubernetes manifest checks
- CI policy gates

## Typical workflow
1. Generate input (plan or rendered YAML)
2. Run `conftest test`
3. Fail CI if violations exist

## Why it fits CI well
- Fast
- No cluster needed
- Simple exit codes
- Easy to containerize

See also:
- [[PoC - Open Policy Agent (OPA)]]
- [[PoC - CI Policy Checks]]
