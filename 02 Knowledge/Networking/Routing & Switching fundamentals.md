---
tags: [networking, routing, switching]
type: note
---

# Routing & Switching Fundamentals

## Switching (Layer 2)

- Based on MAC addresses
- Operates inside LAN

View MAC:
```bash
ip link
arp -a
```
---
## Routing (Layer 3)

- Based on IP addresses
    
- Moves traffic between networks
    

View routes (Linux):

`ip route`

Windows:

`route print`

---

## Default Gateway

Traffic for unknown networks is sent to:

- Default gateway
    

Check:

`ip route | grep default`

---

## ARP

Maps IP -> MAC.

Check:

`arp -a`

If ARP fails, nothing works.
