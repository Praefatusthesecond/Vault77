---
tag: [ observability, grafana, dashboards ]
aliases: [ Grafana Dashboards, Dashboard Design ]
---
Back to [[Grafana - Overview]]

# Grafana dashboards

Dashboards are the **primary interface** users interact with in :contentReference[oaicite:0]{index=0}.  
A good dashboard answers a question quickly. A bad one just looks impressive.

---

## What a dashboard really is

A dashboard is a **JSON model** that defines:
- Panels (queries + visualizations)
- Layout and grouping
- Variables (templating)
- Time range defaults
- Links and drilldowns

Dashboards can be:
- Created manually (UI)
- Imported (JSON)
- Managed via GitOps (see [[Grafana - Provisioning]])

---

## Dashboard design philosophy

### Start with questions, not charts
Ask first:
- *Is the system up?*
- *Is it fast enough?*
- *Is it getting worse?*
- *Where do I look next if this is broken?*

If a panel doesn’t help answer one of those → delete it.

---

## Common dashboard types

### 1. Overview / Golden Signals dashboard
Purpose: **fast health check**

Typical panels:
- Request rate
- Error rate
- Latency (p95 / p99)
- Saturation (CPU, memory, queues)

Used by:
- On-call engineers
- Incident triage

Related:
- [[Grafana - Prometheus Integration]]
- [[Grafana - Alerting]]

---

### 2. Service dashboard
Purpose: **deep dive into one service**

Panels usually include:
- Traffic split per endpoint
- Error ratios by status code
- Latency heatmaps
- Dependency performance

Variables:
- `env`
- `service`
- `instance`

Related:
- [[Grafana - Variables]]
- [[Grafana - Panel Types & Visualization]]

---

### 3. Infrastructure dashboard
Purpose: **capacity & stability**

Typical panels:
- CPU / memory usage
- Disk IO
- Network throughput
- Node availability

Usually driven by:
- Prometheus
- Cloud metrics

---

### 4. Debug / exploratory dashboard
Purpose: **ad-hoc investigation**

Traits:
- Tables
- High-cardinality views
- Logs panels (Loki)
- Temporary by nature

⚠ These often should **not** be shared widely.

Related:
- [[Grafana - Loki (Logs) Integration]]
- [[Grafana - RBAC & Security]]

---

## Layout best practices

### Top-to-bottom hierarchy
1. **Top row**: KPIs / health indicators
2. **Middle**: trends and breakdowns
3. **Bottom**: details, tables, logs

### Group related panels
Use rows to group:
- Traffic
- Errors
- Latency
- Resources

Avoid:
- Endless scrolling
- “Wall of graphs” syndrome

---

## Variables in dashboards

Dashboards should almost always be **templated**.

Recommended standard variables:
- `env`
- `cluster`
- `namespace`
- `service`
- `instance`

Rules of thumb:
- One dashboard > many clones
- Default values should be safe (avoid `all` on expensive queries)
- Make variables visible and understandable

See:
- [[Grafana - Variables]]

---

## Dashboard permissions & ownership

Dashboards are **not harmless**:
- They expose data
- They can leak sensitive metrics
- They can reveal architecture details

Best practices:
- Use folders with explicit permissions
- Separate:
  - Admin dashboards
  - Team dashboards
  - Public/read-only dashboards
- Document dashboard ownership

Related:
- [[Grafana - RBAC & Security]]

---

## Dashboards & alerting

Dashboards and alerts should reinforce each other.

Good practice:
- Every alert links to a relevant dashboard
- Every critical dashboard panel has a corresponding alert

Anti-patterns:
- Alerts with no visual context
- Dashboards that look healthy while alerts fire

See:
- [[Grafana - Alerting]]
- [[Grafana - Runbook - Common Ops Tasks]]

---

## GitOps & lifecycle management

For production dashboards:
- Store JSON in Git
- Review changes via PR/MR
- Provision automatically

Benefits:
- No silent drift
- Easy rollback
- Auditability (hello ISO / SOC / security folks 👋)

See:
- [[Grafana - Provisioning]]

---

## Common dashboard mistakes

- ❌ Using averages for latency
- ❌ Missing units on axes
- ❌ Overusing bright colors
- ❌ No description of what “bad” looks like
- ❌ High-cardinality queries on overview dashboards

See also:
- [[Grafana - Best Practices]]
