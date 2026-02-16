---
tags: [zabbix, triggers, alerting]
parent: Zabbix - Overview
---
Back to [[Zabbix - Overview]]

# Items & Triggers

## Items
- Metrics being collected
- Types: agent, SNMP, HTTP, script

## Triggers
- Logical expressions on items
- Threshold-based or trend-based

## Trigger design tips
- Avoid hard thresholds
- Use averages and trends
- Reduce alert noise

Example:

```text
avg(/host/system.cpu.util,5m) > 90
```