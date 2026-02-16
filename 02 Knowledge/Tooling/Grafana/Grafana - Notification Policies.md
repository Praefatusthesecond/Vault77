---
tag: [ observability, grafana, alerting, notification-policies ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Notification policies

## What they do
A routing tree that decides **where alerts go**, based on labels like `team`, `service`, `severity`, `env`.

## Practical routing scheme
- `severity=critical` → on-call paging channel
- `severity=warning` → team Slack/Teams
- `env=dev` → non-paging channel (or muted outside hours)

## Tips
- Standardize on a label set; document it in [[Grafana - Best Practices]].
- Make a “blackhole” policy for test alerts (so you can validate rules safely).
