---
tag: [ kubernetes, networking, cni ]
parent: Kubernetes (Root)
aliases: [ kubernetes networking, k8s networking ]
---

# Kubernetes - Networking

This note explains **how Kubernetes networking works**, from Pod- to- Pod traffic to ingress from the outside world.

For *what objects exist*, see:
→ [[Kubernetes - Core Objects]]

For *security rules*, also see:
→ [[Kubernetes - Security & RBAC]]

---

## The Kubernetes network model (non- negotiable rules)
Kubernetes assumes:

- Every Pod has its own IP
- Pods can reach other Pods without NAT
- Nodes can reach Pods and vice versa

These rules are implemented by the **CNI plugin**.

---

## CNI (Container Network Interface)
The CNI plugin is responsible for:
- Pod IP assignment
- Routing between Pods
- NetworkPolicy enforcement (if supported)

Examples:
- Calico
- Cilium (eBPF- based)
- Flannel (simple)

CNI choice strongly affects:
- Performance
- NetworkPolicy capabilities
- Observability

---

## Services (stable access)
A **Service** provides a stable virtual IP/DNS name for Pods.

Service types:
- ClusterIP (internal)
- NodePort
- LoadBalancer
- ExternalName

Service → Pod selection happens via **labels**:
→ [[Kubernetes - Core Objects]]

Implementation details:
- kube- proxy (iptables / ipvs)
- or eBPF- based service handling (Cilium)

---

## DNS
- Implemented by CoreDNS
- Naming pattern: `service.namespace.svc.cluster.local`

Common issues:
- Wrong namespace
- No endpoints backing a Service
- Readiness probes failing

---

## Ingress & Gateways
Ingress provides **HTTP routing** into the cluster.

- Requires an Ingress Controller (nginx, traefik, etc.)
- Routes traffic to Services

Ingress is tightly coupled with:
→ [[Kubernetes - Deployments & Rollouts]]

---

## NetworkPolicy (traffic rules)
NetworkPolicy defines **allowed traffic**, not blocked traffic by default.

Key points:
- Depends on CNI support
- L3/L4 (IP/port), not L7 (usually)

Security implications:
→ [[Kubernetes - Security & RBAC]]

---

## Strong relationships
- Workloads & probes: [[Kubernetes - Deployments & Rollouts]]
- Identity & auth: [[Kubernetes - Security & RBAC]]
- Placement effects: [[Kubernetes - Scheduling & Placement]]
