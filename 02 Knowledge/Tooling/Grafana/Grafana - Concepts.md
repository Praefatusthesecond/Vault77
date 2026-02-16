---
tag: [ observability, grafana, concepts ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Grafana concepts

## Mental model
Grafana is a **visualization + alerting** layer that queries one or more **data sources** (metrics/logs/traces) and renders results into **panels**, organized into **dashboards**, optionally templated with **variables**.

## Key building blocks
- **Organization / Folder**: logical grouping and permission boundary (depends on setup).
- **Data source**: Prometheus/Loki/Tempo/Elastic/SQL/etc. See [[Grafana - Datasources]].
- **Dashboard**: JSON model, stored in Grafana DB or provisioned. See [[Grafana - Dashboards]].
- **Panel**: one visualization driven by a query. See [[Grafana - Panel Types & Visualization]].
- **Variables**: query-based or custom variables used for templating. See [[Grafana - Variables]].
- **Alert rule**: evaluates queries over time and triggers notifications. See [[Grafana - Alerting]].

## Common gotchas
- A “pretty” dashboard can still be **misleading** (wrong aggregation, missing labels).
- Alerts need **stable queries** and **clear routing** (otherwise you create notification spam).
- Security: treat dashboards as **data exfil surfaces** (permissions matter). See [[Grafana - RBAC & Security]].
