---
tag: [ kubernetes, scheduling, placement ]
parent: Kubernetes (Root)
aliases: [ kubernetes scheduler, pod placement ]
---

# Kubernetes - Scheduling & Placement

This note explains **how Kubernetes decides where Pods are placed**.

For how scaling changes replica counts, see:
→ [[Kubernetes - Scaling & Autoscaling]]

---

## The scheduler’s job
The scheduler:
- Watches for unscheduled Pods
- Selects a Node
- Binds the Pod to that Node

It does **not** start containers — kubelet does that.

Architecture context:
→ [[Kubernetes - Architecture & Components]]

---

## Resource requests & limits
Scheduling is based on **requests**, not limits.

- requests → scheduling decision
- limits → runtime enforcement

Missing requests cause:
- Overcommit
- Unpredictable placement
- Rollout instability

This directly impacts:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Placement constraints

### NodeSelector
Hard constraint based on node labels.

### NodeAffinity
More expressive placement rules:
- requiredDuringScheduling
- preferredDuringScheduling

### PodAffinity / PodAntiAffinity
Place Pods:
- Together (affinity)
- Apart (anti- affinity)

Common use cases:
- HA
- Failure domain isolation

---

## Taints & tolerations
Used to:
- Repel Pods from nodes
- Require explicit opt- in

Typical nodes:
- Control- plane nodes
- GPU nodes
- Spot/preemptible nodes

---

## Topology spread constraints
Evenly distribute Pods across:
- Zones
- Nodes
- Failure domains

Critical for:
- High availability
- Stateful workloads → [[Kubernetes - Storage]]

---

## Scheduling relationships
- Rollouts & restarts: [[Kubernetes - Deployments & Rollouts]]
- Autoscaling decisions: [[Kubernetes - Scaling & Autoscaling]]
- Node health: [[Kubernetes - Control Plane & Controllers]]
