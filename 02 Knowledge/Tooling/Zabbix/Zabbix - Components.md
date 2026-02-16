---
tags: [zabbix, components]
parent: Zabbix - Overview
---
Back to [[Zabbix - Overview]]

# Zabbix Components

## Zabbix Server
- Central brain
- Evaluates triggers
- Sends alerts
- Writes to DB

## Zabbix Proxy
- Collects data locally
- Buffers during outages
- Reduces server load

## Zabbix Agent vs Agent 2
- **Agent**: classic, lightweight
- **Agent 2**: plugin-based, extensible, recommended

## Frontend
- PHP-based UI
- Dashboards, maps, alert management

## Database
- MySQL / PostgreSQL / TimescaleDB
- Performance depends heavily on DB tuning
