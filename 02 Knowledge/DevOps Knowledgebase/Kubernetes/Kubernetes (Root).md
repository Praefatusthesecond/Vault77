---
tag: [ kubernetes, k8s, devops, containers, cloud ]
parent: DevOps Knowledgebase
aliases: [ k8s, kube, kubernetes overview ]
---
↑ [[DevOps Knowledgebase]]

# Kubernetes

Kubernetes (k8s) is a container orchestration platform built around **declarative state**, **API- driven objects**, and **continuous reconciliation**.

This note acts as the **entry point and router** for all Kubernetes knowledge in the vault.

---

## Architecture & control (how Kubernetes thinks)
Start here to understand *why* Kubernetes behaves the way it does.

- [[Kubernetes - Architecture & Components]]
- [[Kubernetes - Control Plane & Controllers]]

---

## API & workload model (what you actually define)
These notes explain the **objects you write in YAML** and how they behave.

- [[Kubernetes - Core Objects]]
- [[Kubernetes - Deployments & Rollouts]]
- [[Kubernetes - Scheduling & Placement]]
- [[Kubernetes - Scaling & Autoscaling]]

---

## Platform concerns (Day 2 operations)
These notes matter once clusters are alive and running.

- [[Kubernetes - Networking]]
- [[Kubernetes - Storage]]
- [[Kubernetes - Security & RBAC]]
- [[Kubernetes - Observability]]
- [[Kubernetes - Backup & Disaster Recovery]]

---

## Tooling & workflows (how humans interact with Kubernetes)
- [[Kubernetes - kubectl Cheat Sheet|kubectl cheat sheet]]
- [[Kubernetes - Helm]]
- [[Kubernetes - Kustomize]]
- [[Kubernetes - GitOps]]
- [[Kubernetes - Admission Control & Policies]]

