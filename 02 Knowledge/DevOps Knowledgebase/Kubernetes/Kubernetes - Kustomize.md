---
tag: [ kubernetes, kustomize, configuration ]
parent: Kubernetes (Root)
aliases: [ kustomize kubernetes, k8s overlays ]
---

# Kubernetes - Kustomize

Kustomize customizes **raw YAML** without templating.

---

## Core concepts
- Base
- Overlay
- Patch

---

## When to use Kustomize
- Environment overlays
- Minimal abstraction
- GitOps- native workflows

GitOps context:
→ [[Kubernetes - GitOps]]

---

## Kustomize vs Helm
- Kustomize keeps YAML readable
- Helm adds abstraction

Often combined:
→ [[Kubernetes - Helm]]
