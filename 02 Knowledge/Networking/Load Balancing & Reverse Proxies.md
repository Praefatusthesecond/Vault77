---
tags: [networking, load-balancing, reverse-proxy]
type: note
---

# Load Balancing & Reverse Proxies

## Reverse Proxy

Sits in front of backend servers.

Examples:
- Nginx
- HAProxy
- Cloud Load Balancers

---

## Load Balancing Algorithms

- Round Robin
- Least Connections
- IP Hash
- Weighted

---

## Health Checks

Load balancer removes unhealthy nodes.

---

## Why It Matters

Misconfigured reverse proxy often causes:
- 502 errors
- SSL errors
- Infinite redirects