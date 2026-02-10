---
tag: [ kubernetes, architecture, control- plane ]
parent: Kubernetes (Root)
aliases: [ kubernetes architecture, k8s components ]
---

# Kubernetes - Architecture & Components

This note explains the **static building blocks** of a Kubernetes cluster.

For *behavior*, see:
→ [[Kubernetes - Control Plane & Controllers]]

---

## Control Plane components
Responsible for **deciding** what should happen.

- kube- apiserver
- etcd
- kube- scheduler
- kube- controller- manager
- cloud- controller- manager (optional)

---

## Node components
Responsible for **executing** workloads.

- kubelet
- container runtime (containerd / CRI- O)
- kube- proxy (or eBPF- based CNI replacement)

---

## Responsibility boundaries
- Control plane **never runs workloads**
- Nodes **never decide desired state**

This split explains many Kubernetes design decisions.

---

## Related concepts
- Controllers: [[Kubernetes - Control Plane & Controllers]]
- Scheduling decisions: [[Kubernetes - Scheduling & Placement]]
- Networking implementation: [[Kubernetes - Networking]]

