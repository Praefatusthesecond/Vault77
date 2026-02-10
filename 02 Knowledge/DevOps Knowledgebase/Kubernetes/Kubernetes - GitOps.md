---
tag: [ kubernetes, gitops, cicd ]
parent: Kubernetes (Root)
aliases: [ kubernetes gitops, k8s gitops ]
---

# Kubernetes - GitOps

This note explains how Kubernetes is **operated using Git as the source of truth**.

GitOps relies fundamentally on:
→ [[Kubernetes - Control Plane & Controllers]]

---

## Core GitOps principles
- Git is the desired state
- Changes are reviewed via pull requests
- Reconciliation is automated
- Drift is detected and corrected

---

## Why GitOps fits Kubernetes
Kubernetes is:
- Declarative
- API- driven
- Continuously reconciling

GitOps simply formalizes this behavior.

---

## GitOps workflow
1. Commit change to Git
2. Reconciliation agent detects change
3. Agent applies state to cluster
4. Drift is continuously corrected

Admission enforcement:
→ [[Kubernetes - Admission Control & Policies]]

---

## GitOps tools
Typical responsibilities:
- Render manifests (Helm/Kustomize)
- Apply desired state
- Detect drift

Tooling overlaps with:
→ [[Kubernetes - Helm]]
→ [[Kubernetes - Kustomize]]

---

## GitOps vs kubectl
- kubectl → imperative, local
- GitOps → declarative, auditable

kubectl still matters:
→ [[Kubernetes - kubectl Cheat Sheet]]

---

## GitOps security implications
- RBAC must restrict who can deploy
- Secrets handling must be externalized

Security context:
→ [[Kubernetes - Security & RBAC]]

---

## GitOps relationships
- Controllers: [[Kubernetes - Control Plane & Controllers]]
- Policy enforcement: [[Kubernetes - Admission Control & Policies]]
- Release management: [[Kubernetes - Deployments & Rollouts]]
