---
tag: [ observability, grafana, prometheus, metrics ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Prometheus integration

## What you get
- Metrics dashboards and alerting
- Queries via PromQL

## Dashboard patterns (RED/USE)
- Rate (requests/sec)
- Errors (5xx rate, error ratio)
- Duration (p95/p99 latency)
- Utilization/Saturation (CPU, memory, queue depth)

## Gotchas
- Label cardinality explosion
- Wrong aggregation (sum vs avg)
- Missing `rate()` / using raw counters

Related:
- [[Grafana - Dashboards]]
- [[Grafana - Alerting]]
