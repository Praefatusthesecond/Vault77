---
tag: [ kubernetes, deployments, rollout ]
parent: Kubernetes (Root)
aliases: [ kubernetes rollout, k8s deployments ]
---

# Kubernetes - Deployments & Rollouts

This note covers **how stateless workloads are rolled out and managed**.

For object definitions, see:
→ [[Kubernetes - Core Objects]]

---

## What a Deployment actually does
- Manages ReplicaSets
- Orchestrates Pod replacement
- Enables rollback

All enforced by controllers:
→ [[Kubernetes - Control Plane & Controllers]]

---

## Rollout strategies
- RollingUpdate
- Recreate

---

## Health probes
- livenessProbe
- readinessProbe
- startupProbe

Traffic implications:
→ [[Kubernetes - Networking]]

---

## Operational commands
- kubectl rollout status
- kubectl rollout history
- kubectl rollout undo

---

## Common failure patterns
- Missing readiness probes
- No resource requests → [[Kubernetes - Scheduling & Placement]]
- HPA fighting rollouts → [[Kubernetes - Scaling & Autoscaling]]
