---
tags: [ policy-as-code, kubernetes, kyverno, tools ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Kyverno

Kyverno is a Kubernetes-native policy engine using YAML, not Rego.

## What makes it different
- Policies are Kubernetes resources
- No separate language to learn
- Easier for platform teams

## Policy types
- Validate (allow or deny)
- Mutate (auto-fix)
- Generate (create resources)

## Example use cases
- Auto-add labels
- Block privileged pods
- Enforce image pull policies

## Trade-offs
Pros:
- Easier onboarding
- Readable policies

Cons:
- Less flexible than OPA
- Kubernetes-only

Kyverno shines when you want guardrails with minimal friction.
