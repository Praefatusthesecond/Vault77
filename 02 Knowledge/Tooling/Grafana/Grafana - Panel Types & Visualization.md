---
tag: [ observability, grafana, panels, visualization ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Panels & visualization

## Common panel choices
- Time series: default for metrics
- Stat: single KPI (great for “is it up?”)
- Bar gauge: compare categories
- Table: debugging and high-cardinality views
- Heatmap: latency distribution, buckets
- Logs panel: from Loki or other log sources

## Visualization principles
- Avoid lying with axes (0-baseline where meaningful).
- Prefer percentiles and distributions for latency.
- Use thresholds intentionally; document what “red” means.
- Make legends readable (label formatting matters).

Related:
- [[Grafana - Dashboards]]
- [[Grafana - Variables]]
