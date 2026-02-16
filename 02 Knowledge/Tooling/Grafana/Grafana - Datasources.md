---
tag: [ observability, grafana, datasources ]
parent: Grafana Index
---
Back to [[Grafana - Overview]]

# Grafana data sources

## Core idea
Data sources define *how* Grafana queries your underlying systems. The same dashboard pattern can often be reused across multiple sources, but query languages differ.

## Common data sources in practice
- Metrics: Prometheus / Mimir
- Logs: Loki / Elasticsearch / OpenSearch
- Traces: Tempo / Jaeger
- Cloud: Azure Monitor / CloudWatch
- Databases: Postgres, MySQL, MSSQL

## Operational tips
- Prefer **service accounts** (or scoped tokens) over shared admin creds.
- Document:
  - URL/tenant
  - auth method
  - default scrape labels / naming conventions
- Standardize label keys early (it saves your future self). See [[Grafana - Best Practices]]

## Deep dives
- [[Grafana - Prometheus Integration]]
- [[Grafana - Loki (Logs) Integration]]
- [[Grafana - Tempo (Tracing) Integration]]
