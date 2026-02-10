---
tag: [ kubernetes, observability, monitoring ]
parent: Kubernetes (Root)
aliases: [ kubernetes observability, k8s monitoring ]
---

# Kubernetes - Observability

This note explains how to **observe, understand, and diagnose** Kubernetes systems using metrics, logs, and traces.

For *fixing* issues, see:
→ [[Kubernetes - Troubleshooting Playbook]]

---

## The three pillars of observability
Kubernetes observability is built on:

1. **Metrics** - numerical health signals
2. **Logs** - event narratives
3. **Traces** - request lifecycles

All three are required for reliable operations.

---

## Metrics

### What metrics tell you
- Resource usage (CPU, memory)
- Saturation
- Error rates
- Scaling behavior

Metrics directly influence:
→ [[Kubernetes - Scaling & Autoscaling]]

### Common metric sources
- kube- state- metrics
- node- exporter
- cAdvisor
- Application- level metrics

---

## Logs

### Log sources
- Application logs (stdout/stderr)
- Container runtime logs
- Node- level logs

Key principle:
> Kubernetes does not store logs — **you must export them**.

Logs are essential for:
→ [[Kubernetes - Deployments & Rollouts]]

---

## Tracing
Distributed tracing shows:
- Request paths
- Latency bottlenecks
- Service dependencies

Tracing becomes critical with:
→ [[Kubernetes - Networking|kubernetes networking]]

---

## Control plane observability
Important signals:
- API server latency
- Scheduler errors
- Controller reconciliation delays

Architecture context:
→ [[Kubernetes - Architecture & Components]]

---

## Alerting
Alerts should reflect:
- User impact
- SLO violations
- Persistent failure

Avoid alerting on:
- Transient Pod restarts
- Expected rollouts

---

## Observability relationships
- Scaling decisions: [[Kubernetes - Scaling & Autoscaling]]
- Failure diagnosis: [[Kubernetes - Troubleshooting Playbook]]
- Policy enforcement visibility: [[Kubernetes - Admission Control & Policies]]
