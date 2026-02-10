---
tag: [ kubernetes, troubleshooting, operations ]
parent: Kubernetes (Root)
aliases: [ kubernetes debugging, k8s troubleshooting ]
---

# Kubernetes - Troubleshooting Playbook

This note is a **procedural playbook** for diagnosing Kubernetes issues.

For visibility and signals, see:
→ [[Kubernetes - Observability]]

---

## Golden rule
Never start with fixes.  
Always start with **symptoms → signals → scope**.

---

## Pod not starting
Check in order:
1. `kubectl describe pod`
2. Events (ImagePullBackOff, CrashLoopBackOff)
3. Resource requests → [[Kubernetes - Scheduling & Placement]]
4. Secrets/config availability → [[Kubernetes - Security & RBAC]]

---

## Pod crashes repeatedly
- Check liveness vs readiness probes
- Look at container logs
- Verify startup time assumptions

Rollout context:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Service not reachable
- Does Service have endpoints?
- Do Pods pass readiness probes?
- DNS resolution correct?
- NetworkPolicy blocking traffic?

Networking context:
→ [[Kubernetes - Networking]]

---

## Scaling not working
- Metrics available?
- HPA configured correctly?
- Resource requests set?

Scaling logic:
→ [[Kubernetes - Scaling & Autoscaling]]

---

## Node issues
- Node taints?
- Disk pressure / memory pressure?
- kubelet health?

Architecture context:
→ [[Kubernetes - Architecture & Components]]

---

## When to escalate
Escalate when:
- Control plane degraded
- etcd instability
- Widespread scheduling failure
