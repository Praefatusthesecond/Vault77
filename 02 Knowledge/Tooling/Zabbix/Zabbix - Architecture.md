---
tags: [zabbix, architecture, monitoring]
parent: Zabbix - Overview
---
Back to [[Zabbix - Overview]]

# Zabbix Architecture

Zabbix uses a centralized server model with optional proxies to scale across networks and locations.

## High-level flow
Agent → Proxy (optional) → Server → Database → Frontend

## Components
- **Server** – core processing engine
- **Database** – stores metrics, config, history
- **Frontend** – web UI
- **Agent / Agent2** – collects metrics
- **Proxy** – offloads collection and buffering

## When to use proxies
- Remote sites / DMZs
- Large-scale environments
- Unreliable network links

See also:
- [[Zabbix - Components]]
- [[Zabbix - Scaling Performance]]
