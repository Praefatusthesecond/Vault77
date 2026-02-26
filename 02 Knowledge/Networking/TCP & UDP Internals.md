---
tags: [networking, tcp, udp]
type: note
---

# TCP & UDP Internals

## TCP

- Connection-oriented
- Reliable
- Ordered
- Uses 3-way handshake

Handshake:
1. SYN
2. SYN-ACK
3. ACK

---

## UDP

- Connectionless
- Faster
- No guarantee of delivery

Used by:
- DNS
- VoIP
- Streaming

---

## Check Open Ports

Linux:
```bash
ss -tulnp
```
Windows:

```powershell
netstat -ano
```

---

## Troubleshooting

Connection reset?

- Firewall?
    
- Service not listening?
    
- TLS mismatch?