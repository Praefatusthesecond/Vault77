---
tag: [ observability, grafana, architecture ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Grafana architecture

## Typical deployment shapes
- **Single instance**: simplest, least HA.
- **HA / horizontally scaled**: multiple Grafana instances behind a load balancer.
- **Managed Grafana**: SaaS or cloud-managed flavor (trade control for convenience).

## Core components to be aware of
- **Grafana server**: UI + API + alerting engine
- **Storage**: internal DB (SQLite/MySQL/Postgres) storing dashboards/users/settings (unless provisioned)
- **Plugins**: data source + panel plugins (risk surface; see [[Grafana - RBAC & Security]])
- **Alerting pipeline**: rule evaluation → notification policies → contact points  
  See: 
- [[Grafana - Alerting]] 
- [[Grafana - Notification Policies]]
- [[Grafana - Contact  Points]]

## GitOps angle
If you want reproducibility:
- Provision dashboards/data sources/alerting config via [[Grafana - Provisioning]]
- Keep JSON/YAML in Git + apply on deploy
