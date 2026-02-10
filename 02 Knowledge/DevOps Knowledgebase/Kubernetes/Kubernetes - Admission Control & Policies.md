---
tag: [ kubernetes, admission, policy ]
parent: Kubernetes (Root)
aliases: [ kubernetes admission control, k8s policies ]
---

# Kubernetes - Admission Control & Policies

This note explains **how Kubernetes validates and mutates objects before they are stored**.

For authorization rules, see:
→ [[Kubernetes - Security & RBAC]]

---

## Admission control flow
1. Authentication
2. Authorization (RBAC)
3. Admission (mutating + validating)
4. Persistence (etcd)

---

## Admission types
- Mutating admission (defaulting, injection)
- Validating admission (deny/allow)

---

## Policy engines
Used to enforce:
- Security standards
- Naming conventions
- Resource requirements

Admission works hand- in- hand with:
→ [[Kubernetes - GitOps]]

---

## Common policy examples
- Require resource requests
- Block privileged containers
- Enforce namespace boundaries
- Restrict image registries

Scheduling implications:
→ [[Kubernetes - Scheduling & Placement]]

---

## Why admission matters
Admission is the **last line of defense** before bad config hits the cluster.
