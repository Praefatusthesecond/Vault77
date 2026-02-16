---
tags: [ policy-as-code, kubernetes, gatekeeper, tools ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Gatekeeper

Gatekeeper brings OPA enforcement into Kubernetes admission control.

## What it enforces
- Policies on create and update
- Cluster-wide or namespace-scoped rules

## Core components
- ConstraintTemplate (Rego logic)
- Constraint (instantiation of a rule)
- Admission webhook

## Common policies
- No privileged containers
- Require labels and annotations
- Restrict image registries
- Enforce resource limits

## Pros
- Strong enforcement
- Central governance
- Native K8s integration

## Cons
- Rego complexity
- Can block clusters if misconfigured

Use Gatekeeper when violations must never reach runtime.
