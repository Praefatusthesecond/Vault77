---
tag: [ kubernetes, scaling, autoscaling ]
parent: Kubernetes (Root)
aliases: [ kubernetes autoscaling, hpa vpa ]
---

# Kubernetes - Scaling & Autoscaling

This note explains how Kubernetes **adjusts capacity** in response to load.

For placement logic, see:
→ [[Kubernetes - Scheduling & Placement]]

---

## Scaling dimensions
Kubernetes scales along multiple axes:

- **Replica scaling** (more Pods)
- **Resource scaling** (more CPU/memory)
- **Node scaling** (more machines)

---

## Horizontal Pod Autoscaler (HPA)
HPA adjusts **replica count** based on metrics.

Common signals:
- CPU utilization
- Memory utilization
- Custom metrics

Metrics source:
→ [[Kubernetes - Observability]]

---

## Vertical Pod Autoscaler (VPA)
VPA adjusts:
- CPU/memory requests
- CPU/memory limits

Trade- offs:
- Can restart Pods
- Can conflict with rollouts

Rollout implications:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Cluster Autoscaler
Adjusts **node count** based on pending Pods.

Strongly tied to:
→ [[Kubernetes - Scheduling & Placement]]

---

## Scaling anti- patterns
- Missing resource requests
- HPA + VPA without coordination
- Autoscaling stateful workloads blindly

Stateful considerations:
→ [[Kubernetes - Storage]]

---

## Scaling relationships
- Observability signals: [[Kubernetes - Observability]]
- Scheduling constraints: [[Kubernetes - Scheduling & Placement]]
- Workload behavior: [[Kubernetes - Deployments & Rollouts]]
