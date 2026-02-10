---
tag: [ kubernetes, helm, packaging ]
parent: Kubernetes (Root)
aliases: [ helm kubernetes, k8s helm ]
---

# Kubernetes - Helm

Helm is a **package manager** for Kubernetes.

It solves:
- Templating
- Versioning
- Reusability

---

## What Helm is good at
- Reusable applications
- Parameterized deployments
- Complex charts

GitOps interaction:
→ [[Kubernetes - GitOps]]

---

## What Helm is bad at
- Fine- grained diffs
- Policy enforcement
- Drift visibility (alone)

---

## Helm vs Kustomize
- Helm: template- first
- Kustomize: overlay- first

See:
→ [[Kubernetes - Kustomize]]
