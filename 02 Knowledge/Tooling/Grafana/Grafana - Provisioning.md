---
tag: [ observability, grafana, provisioning, gitops ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Provisioning (GitOps)

## Why provision
Click-ops dashboards drift. Provisioning lets you:
- version dashboards
- review changes (MR/PR)
- reproduce environments

## What you can provision (common)
- Data sources
- Dashboards (JSON)
- Alerting resources (depends on approach/version)
- Users/teams: often handled via SSO/IAM instead

## Suggested repo structure
- `grafana/datasources/`
- `grafana/dashboards/`
- `grafana/alerting/`
- `grafana/README.md`

## Guardrails
- CI linting for JSON (format/validation)
- Naming conventions and folder standards (see [[Grafana - Best Practices]])
