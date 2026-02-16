---
tag: [ observability, grafana, alerting ]
aliases: [ Grafana Unified Alerting ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Grafana alerting (unified)

## Components
- **Alert rules**: queries + conditions + evaluation
- **Labels/annotations**: routing + context
- **Notification policies**: routing tree (like Alertmanager-ish)
- **Contact points**: Slack/Teams/email/webhook/etc.

See also:
- [[Grafana - Notification Policies]]
- [[Grafana - Contact  Points]]]

## Good alert rules
- Alert on **symptoms**, not causes (e.g., high error rate, not CPU 93%).
- Add runbook links in annotations (see [[Grafana - Runbook - Common Ops Tasks]]).
- Use appropriate evaluation windows to avoid flapping.

## Common pitfalls
- Noisy alerts (too sensitive thresholds)
- Missing labels → alerts route nowhere
- “All alerts to one channel” → burnout speedrun
