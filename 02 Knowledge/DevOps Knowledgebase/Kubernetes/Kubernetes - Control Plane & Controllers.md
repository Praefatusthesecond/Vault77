---
tag: [ kubernetes, controllers, reconciliation ]
parent: Kubernetes (Root)
aliases: [ kubernetes controllers, reconciliation loop ]
---

# Kubernetes - Control Plane & Controllers

This note explains **how Kubernetes enforces desired state**.

For physical components, see:
→ [[Kubernetes - Architecture & Components]]

---

## Controllers in one sentence
A controller continuously reconciles **desired state** with **actual state**.

---

## The reconciliation loop
1. Watch API objects
2. Detect drift
3. Act to correct drift
4. Repeat forever

---

## Examples of controllers
- Deployment controller → [[Kubernetes - Deployments & Rollouts]]
- ReplicaSet controller
- Job controller
- Node controller
- Horizontal Pod Autoscaler → [[Kubernetes - Scaling & Autoscaling]]

---

## Why this matters
- Explains self- healing
- Explains GitOps
- Explains why “kubectl delete pod” works

---

## Strong relationships
- Declarative objects: [[Kubernetes - Core Objects]]
- Automation workflows: [[Kubernetes - GitOps]]
- Admission logic: [[Kubernetes - Admission Control & Policies]]
