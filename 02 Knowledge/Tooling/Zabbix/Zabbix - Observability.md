---
tags: [observability, sre, reliability]
parent: Zabbix - Overview
---
Back to [[Zabbix - Overview]]

# Observability

Observability is the ability to understand a system’s internal state based on its external outputs.

## The three pillars
- Metrics
- Logs
- Traces

## Why observability matters
- Faster root cause analysis
- Better system understanding
- Reduced MTTR

## Monitoring vs Observability
| Monitoring | Observability |
|----------|---------------|
| Known failure modes | Unknown failure modes |
| Thresholds | Correlations |
| Alerts | Context |

## Tools
- Zabbix (metrics-first)
- Prometheus + Grafana
- ELK / OpenSearch
- Jaeger / Tempo

Related:
- [[Zabbix - Monitoring]]
- [[Incident Management]]
