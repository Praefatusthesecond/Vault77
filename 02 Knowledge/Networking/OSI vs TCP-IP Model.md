---
tags: [networking, osi, tcp-ip]
type: note
---

# OSI vs TCP-IP Model

## OSI Model (7 Layers)

1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application

Mostly conceptual.

---

## TCP/IP Model (Practical)

1. Network Interface
2. Internet
3. Transport
4. Application

This is what real stacks implement.

---

## Practical Mapping

Physical/Data Link -> Ethernet
Network -> IP
Transport -> TCP/UDP
Application -> HTTP, DNS, SSH

---

## Why This Matters

If ping fails:
- Is it layer 2?
- Is it layer 3?
- Is it firewall?
- Is it DNS?

This prevents blind debugging.
