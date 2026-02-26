---
tags: [networking, firewall, nat, security]
type: note
---

# Firewalls & NAT

## Stateful vs Stateless

Stateless:
- Filters per packet

Stateful:
- Tracks connection state

---

## NAT

Translates:
- Private IP -> Public IP

Types:
- SNAT
- DNAT
- PAT

---

## Debugging

Linux:
```bash
iptables -L -n -v
```

Windows:

```powershell
Get-NetFirewallRule
```
Common issue:  
Port open on server but blocked upstream.