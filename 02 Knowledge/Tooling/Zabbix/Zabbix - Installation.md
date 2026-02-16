---
tags: [zabbix, installation, monitoring, infrastructure]
aliases: [Install Zabbix, Zabbix Setup]
parent: Zabbix - Overview
---
Back to [[Zabbix - Overview]]

# Zabbix - Installation

This note covers how to install Zabbix in a **clean, production-oriented way**, focusing on decision points rather than copy-paste commands.

Zabbix installation is not just “install a package” — architecture choices made here affect scalability, reliability, and maintenance long-term.

---

## Installation components

A full Zabbix setup can consist of:

- Zabbix Server
- Database
- Zabbix Frontend (web UI)
- Zabbix Agent / Agent 2
- Optional: Zabbix Proxy

Not every environment needs all components.

Related:
- [[Zabbix - Architecture]]
- [[Zabbix - Components]]

---

## Supported platforms

### Server & Proxy
- Linux (recommended)
  - Ubuntu LTS
  - RHEL / Alma / Rocky
- Containers (advanced setups)

### Agents
- Linux
- Windows
- macOS
- Containers

---

## Database selection

Zabbix relies heavily on database performance.

### Supported databases
- PostgreSQL (recommended)
- PostgreSQL + TimescaleDB (large environments)
- MySQL / MariaDB

### Rule of thumb
- Small / medium env → PostgreSQL
- Large / high-ingest env → PostgreSQL + TimescaleDB

Related:
- [[Zabbix - Scaling Performance]]

---

## Installation order (server-based setup)

1. Install database
2. Create Zabbix database & user
3. Install Zabbix server
4. Import initial schema
5. Install frontend
6. Configure server ↔ database
7. Start services
8. Secure setup
9. Install agents

---

## Zabbix Server installation

### Key considerations
- Run server close to the database
- Ensure sufficient disk I/O
- Tune cache sizes early

### Configuration highlights
- `CacheSize`
- `HistoryCacheSize`
- `TrendCacheSize`
- `Timeout`

These directly influence performance and alert latency.

---

## Frontend installation

### Requirements
- Web server (Apache / Nginx)
- PHP (version must match Zabbix release)
- PHP extensions (db, ldap, curl, gd, etc.)

### Frontend responsibilities
- Configuration
- Dashboards
- Alert management
- User access

---

## Agent installation

### Agent vs Agent 2
- Prefer **Agent 2** for new installs
- Plugin-based
- Better extensibility

### Deployment strategies
- Manual (small envs)
- Automation (recommended)

Related:
- [[Zabbix - Agents]]
- [[Zabbix - Automation]]
- [[Zabbix - Ansible]]

---

## Proxy installation (optional)

### When to use a proxy
- Remote locations
- DMZ networks
- Bandwidth constraints
- High host counts

### Proxy modes
- Active (recommended)
- Passive

Proxies significantly reduce load on the server and increase resilience.

Related:
- [[Zabbix - Scaling Performance]]

---

## Security hardening during installation

Must-haves:
- TLS between agents, proxies, and server
- Non-root service accounts
- Firewall restrictions
- Strong database credentials

Related:
- [[Zabbix - Security]]

---

## Post-installation checklist

- [ ] Change default admin password
- [ ] Configure TLS
- [ ] Set correct timezone
- [ ] Tune housekeeper
- [ ] Adjust history retention
- [ ] Import templates
- [ ] Install first agents
- [ ] Test alerting

---

## Common pitfalls

- Underestimating database I/O
- No proxies in large environments
- Default trigger noise
- Installing Agent instead of Agent 2
- No automation from day one

---

## Where this fits

Upstream:
- [[Zabbix - Monitoring]]
- [[Zabbix - Observability]]

Downstream:
- [[Zabbix - Agents]]
- [[Zabbix - Templates]]
- [[Zabbix - Alerting]]
- [[Zabbix - Automation]]
