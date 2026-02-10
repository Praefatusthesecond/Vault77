---
tag: [ kubernetes, backup, disaster- recovery ]
parent: Kubernetes (Root)
aliases: [ kubernetes backup, k8s dr ]
---

# Kubernetes - Backup & Disaster Recovery

This note explains **how Kubernetes clusters are recovered**, not just restored.

---

## What must be backed up
- etcd (cluster state)
- Persistent volumes
- Git repositories (GitOps)
- Secrets (securely)

Object context:
→ [[Kubernetes - Core Objects]]

---

## What does NOT need backup
- Pods
- ReplicaSets
- Deployments (recreated declaratively)

Why this works:
→ [[Kubernetes - Control Plane & Controllers]]

---

## Backup strategies
- API object export
- etcd snapshot
- CSI snapshots
- Application- level backups

---

## Disaster scenarios
- Node loss
- Zone loss
- Cluster loss

Recovery heavily depends on:
→ [[Kubernetes - GitOps]]

---

## DR testing
If restore hasn’t been tested, backup doesn’t exist.

Observability during recovery:
→ [[Kubernetes - Observability]]
