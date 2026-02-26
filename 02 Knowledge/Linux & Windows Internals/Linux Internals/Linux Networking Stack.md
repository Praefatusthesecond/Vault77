---
tags: [linux, internals, networking]
type: note
---

# Linux Networking Stack

## Interfaces

View interfaces:
```bash
ip addr
```
Routes:

```bash
ip route
```

---

## Open Ports

Check listening services:

```bash
ss -tulnp
```

---

## DNS

Resolver configuration:

```bash
/etc/resolv.conf
```
Test:

```bash
dig google.com
nslookup google.com
```

---

## Packet Inspection

Capture traffic:

```bash
tcpdump -i eth0
```

---

## Troubleshooting Flow

1. Check interface up
    
2. Check IP assigned
    
3. Check route
    
4. Check DNS
    
5. Check firewall
    
6. Check listening service
