---
tags: [networking, ip, subnetting]
type: note
---

# IP Addressing & Subnetting

## IPv4 Structure

32 bits:
192.168.1.10

---

## CIDR Notation

Example:
192.168.1.0/24


/24 means:
- 24 bits network
- 8 bits host

---

## Private Ranges

- 10.0.0.0/8
- 172.16.0.0/12
- 192.168.0.0/16

---

## Subnet Calculation Basics

Hosts per subnet:
2^(host bits) - 2


Example:
/24 -> 256 addresses -> 254 usable

---

## Useful Commands

Linux:
```bash
ip addr
ip route
```

Windows:
```powershell
ipconfig
Get-NetIPAddress
```