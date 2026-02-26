---
tag: [ docker, logging, monitoring, devops ]
aliases: [ "Docker Observability" ]
---

# Logging and Monitoring

## Logs
- `docker logs` reads container stdout/stderr
- Make sure apps log to stdout/stderr (12-factor-ish)

## Metrics
- `docker stats` for quick local checks
- For serious monitoring: export metrics into your stack (Prometheus/Grafana, Zabbix, etc.)

## Practical guidance
- Decide what “healthy” means (healthchecks can help)
- Centralize logs for anything beyond dev/local

Related: 
- [[Grafana - Overview]]
- [[Zabbix - Overview]]
- [[Docker - Troubleshooting]]
