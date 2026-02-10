---
tag: [ kubernetes, storage, persistence ]
parent: Kubernetes (Root)
aliases: [ kubernetes storage, k8s volumes ]
---

# Kubernetes - Storage

This note explains how Kubernetes handles **persistent storage**.

For workload behavior, see:
→ [[Kubernetes - Core Objects]]

---

## The storage abstraction
- Pods are ephemeral
- Volumes are attached
- Persistence is externalized

---

## Core storage objects
- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)
- StorageClass

These objects are defined in:
→ [[Kubernetes - Core Objects]]

---

## CSI (Container Storage Interface)
CSI drivers handle:
- Volume provisioning
- Attach/detach
- Expansion

Storage backend determines:
- Performance
- Availability
- Snapshot support

---

## Stateful workloads
Use **StatefulSets** when:
- Stable identity is required
- Ordered startup matters
- Persistent volumes are bound per replica

Workload link:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Storage failure modes
- Volume stuck terminating
- Node affinity conflicts
- Snapshot restore failures

Scheduling implications:
→ [[Kubernetes - Scheduling & Placement]]

---

## Backup considerations
Kubernetes does NOT back up data by default.

Backup logic:
→ [[Kubernetes - Backup & Disaster Recovery]]
