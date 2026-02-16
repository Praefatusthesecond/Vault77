---
tag: [ observability, grafana, variables ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Grafana variables (templating)

## Why variables exist
Variables let you build **one dashboard** that works across environments/services/instances.

## Common variable types
- Query variables (e.g., list of services)
- Custom variables (static choices)
- Interval variables (auto group-by windows)
- Ad hoc filters (especially handy for label-heavy metrics)

## Best practices
- Keep variable names consistent across dashboards: `env`, `cluster`, `namespace`, `service`, `instance`.
- Use sane defaults (don’t auto-select “all” if it creates expensive queries).
- Make variables visible and placed at the top.

Related:
- [[Grafana - Dashboards]]
- [[Grafana - Best Practices]]
