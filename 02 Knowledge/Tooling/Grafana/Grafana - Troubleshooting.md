---
tag: [ observability, grafana, troubleshooting ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Troubleshooting Grafana

## “Dashboards are empty”
- Check the data source health
- Verify time range + timezone
- Validate variables (they can filter everything out)
- Confirm permissions to the folder and data source

## “Panels are slow”
- Reduce query range
- Avoid `all` variables for high-cardinality labels
- Use recording rules (Prometheus-side) for expensive queries

## “Alerts not firing / not routing”
- Confirm evaluation interval and condition
- Check labels used in [[Grafana - Notification Policies]]
- Verify [[Grafana - Contact  Points]] test notifications
