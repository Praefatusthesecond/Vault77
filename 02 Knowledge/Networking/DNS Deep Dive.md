---
tags: [networking, dns]
type: note
---

# DNS Deep Dive

DNS translates names to IP addresses.

---

## Resolution Flow

1. Local cache
2. Resolver
3. Root servers
4. TLD servers
5. Authoritative server

---

## Record Types

- A
- AAAA
- CNAME
- MX
- TXT
- SRV

---

## Debugging

Linux:
```bash
dig example.com
nslookup example.com
```
Windows:

```powershell
Resolve-DnsName example.com
```
---

## Common Issues

- Wrong DNS server
    
- Split DNS misconfiguration
    
- TTL caching problems
    
- Firewall blocking port 53