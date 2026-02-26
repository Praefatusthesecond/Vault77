---
tags: [networking, troubleshooting, packet-analysis]
type: note
---

# Packet Analysis & Troubleshooting

## Tools

Linux:
```bash
tcpdump -i eth0
```

Windows:

- Wireshark
    
- pktmon
    

---

## Basic Flow

1. Check interface up
    
2. Check IP assigned
    
3. Check route
    
4. Check DNS
    
5. Check firewall
    
6. Check listening port
    
7. Capture traffic
    

---

## tcpdump Example

`tcpdump -i eth0 port 443`

---

## Mindset

Networking problems are usually:

- DNS
    
- Routing
    
- Firewall
    
- Certificate
    
- Wrong IP