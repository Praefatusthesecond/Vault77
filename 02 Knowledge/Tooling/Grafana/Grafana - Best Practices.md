---
tag: [ observability, grafana, best-practices ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Best practices

## Dashboard standards
- Use consistent variables: `env`, `cluster`, `namespace`, `service`
- Top row = “golden signals” (RED/USE)
- Prefer fewer, better panels over “wall of charts”

## Query standards
- Avoid high-cardinality label filters
- Prefer stable aggregations and percentile views for latency
- Use recording rules for heavy queries (metrics side)

## Alerting standards
- Define severities and routing labels up front
- Page on symptoms; warn on trends
- Include context: dashboard link + runbook link

## Security standards
- Lock down admin
- Restrict plugin installation
- Prefer SSO and group mappings

Related:
- [[Grafana - Dashboards]]
- [[Grafana - Variables]]
- [[Grafana - Alerting]]
- [[Grafana - RBAC & Security]]
