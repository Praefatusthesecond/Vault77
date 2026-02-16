---
tags: [ policy-as-code, kubernetes, example ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Example - Block Privileged Pods

## Rule intent
- Prevent containers from running privileged

## Enforced by
- Gatekeeper or Kyverno

## Why it matters
- Privileged pods bypass node security
- Often unnecessary

This policy should almost always be deny.
