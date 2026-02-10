---
tag: [ kubernetes, api, objects ]
parent: Kubernetes (Root)
aliases: [ kubernetes resources, k8s objects ]
---

# Kubernetes - Core Objects

This note defines the **core API objects** you use to describe workloads and infrastructure.

For how objects are enforced, see:
→ [[Kubernetes - Control Plane & Controllers]]

---

## Workload objects
- Pod
- Deployment → [[Kubernetes - Deployments & Rollouts]]
- StatefulSet → [[Kubernetes - Storage]]
- DaemonSet
- Job / CronJob

---

## Networking objects
- Service → [[Kubernetes - Networking]]
- Ingress → [[Kubernetes - Networking]]
- NetworkPolicy → [[Kubernetes - Networking]]

---

## Configuration & secrets
- ConfigMap
- Secret → [[Kubernetes - Security & RBAC]]

---

## Storage objects
- PersistentVolume (PV)
- PersistentVolumeClaim (PVC)
- StorageClass → [[Kubernetes - Storage]]

---

## Access & control
- Namespace
- ServiceAccount → [[Kubernetes - Security & RBAC]]
- Role / ClusterRole
- RoleBinding / ClusterRoleBinding
