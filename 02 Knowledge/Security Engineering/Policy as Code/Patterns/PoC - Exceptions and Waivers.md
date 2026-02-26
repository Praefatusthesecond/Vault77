---
tags: [ policy-as-code, patterns, governance, risk ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Exceptions and Waivers

## Why you need this
Without a formal escape hatch, teams will bypass PaC by:
- disabling pipelines
- copying resources into “shadow” workflows
- pressuring to weaken rules

## Recommended model
- Exception = time-bound + owner + reason + ticket/reference
- Stored as code (YAML/JSON) and reviewed like any change
- Policy rules read the exception list and allow only matching cases

## Guardrails
- Expiry required
- Approver required (role-based)
- Report on active exceptions weekly