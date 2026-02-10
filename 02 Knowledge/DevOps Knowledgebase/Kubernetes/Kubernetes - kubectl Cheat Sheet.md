---
tag: [ kubernetes, kubectl, cli ]
parent: Kubernetes (Root)
aliases: [ kubectl cheat sheet, k8s cli ]
---

# Kubernetes - kubectl Cheat Sheet

This note is a **command reference**, not conceptual documentation.

---

## Context & config
- `kubectl config get- contexts`
- `kubectl config use- context`

---

## Inspection
- `kubectl get`
- `kubectl describe`
- `kubectl logs`
- `kubectl events`

Troubleshooting usage:
→ [[Kubernetes - Troubleshooting Playbook]]

---

## Apply & diff
- `kubectl apply`
- `kubectl diff`

GitOps contrast:
→ [[Kubernetes - GitOps]]

---

## Debugging
- `kubectl exec`
- `kubectl port- forward`
- `kubectl debug`

---

## Rollouts
- `kubectl rollout status`
- `kubectl rollout undo`

Deployment logic:
→ [[Kubernetes - Deployments & Rollouts]]
