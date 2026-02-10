---
tag: [ kubernetes, security, rbac ]
parent: Kubernetes (Root)
aliases: [ kubernetes security, k8s rbac ]
---

# Kubernetes - Security & RBAC

This note explains **identity, authentication, and authorization** in Kubernetes.

For network- level security, also see:
→ [[Kubernetes - Networking]]

---

## Security layers in Kubernetes
Kubernetes security is **layered**, not centralized.

1. Authentication (who are you?)
2. Authorization (what may you do?)
3. Admission control (should this be allowed?)
4. Runtime & network controls

---

## Identities
Kubernetes recognizes:
- Users (external identity providers)
- ServiceAccounts (in- cluster identity)

Every Pod runs as a **ServiceAccount**.

ServiceAccount usage ties directly into:
→ [[Kubernetes - Core Objects]]

---

## RBAC (Role- Based Access Control)

### RBAC objects
- Role / ClusterRole → defines permissions
- RoleBinding / ClusterRoleBinding → assigns permissions

Scope matters:
- Role → namespace- scoped
- ClusterRole → cluster- wide

---

## Common RBAC patterns
- Least privilege per namespace
- Separate ServiceAccounts per workload
- Read- only vs admin separation

RBAC mistakes often surface during:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Secrets
Secrets store sensitive data:
- Tokens
- Passwords
- Certificates

Important:
- Base64 ≠ encryption
- Enable encryption at rest
- Avoid mounting secrets broadly

Related objects:
→ [[Kubernetes - Core Objects]]

---

## Admission control
Before objects are stored, they pass:
- Validating admission
- Mutating admission

Policy engines live here:
→ [[Kubernetes - Admission Control & Policies]]

---

## Security relationships
- Network isolation: [[Kubernetes - Networking]]
- GitOps enforcement: [[Kubernetes - GitOps]]
- Pod identity usage: [[Kubernetes - Core Objects]]
