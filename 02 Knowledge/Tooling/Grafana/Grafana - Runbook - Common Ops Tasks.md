---
tag: [ observability, grafana, runbook ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Runbook: Common Grafana ops tasks

## Add a new dashboard (GitOps)
1. Export dashboard JSON
2. Commit to provisioning repo path
3. Apply/redeploy Grafana
4. Verify folder permissions

## Add a new data source
- Create via provisioning
- Use service account / token
- Restrict permissions

## On-call “first checks” for alerts
- Is the alert real? Check dashboard panel + raw query.
- Is it a deploy? Correlate with release events.
- Is it a dependency? Check upstream dashboards.

Tip: Add runbook links into alert annotations (see [[Grafana - Alerting]]).
