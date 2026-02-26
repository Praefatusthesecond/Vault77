---
title: Networking Deep Dive - IP Addressing and Subnetting
aliases: [IP Addressing Fundamentals, Subnetting Deep Dive]
tags: [networking, tcp-ip, subnetting, infrastructure, devops]
type: networking
domain: fundamentals
related: [Networking Deep Dive - Routing, Networking Deep Dive - DNS, Networking Deep Dive - Firewalls]
status: draft
---

# 1. What Is an IP Address?

An IP address is a **logical network identifier** assigned to a device.

It identifies:

- The network
    
- The host within that network
    

Two major versions:

- IPv4 (32-bit)
    
- IPv6 (128-bit)
    

Most DevOps and enterprise infrastructure still heavily uses IPv4.

---

# Part 1 — IPv4 Addressing

---

## 2. IPv4 Structure

IPv4 = 32 bits  
Represented as four octets:

192.168.1.10

Each octet:

- 8 bits
    
- Value range: 0–255
    

Binary representation:

192.168.1.10  
11000000.10101000.00000001.00001010

---

## 3. Network vs Host Portion

Every IP address consists of:

- Network portion
    
- Host portion
    

Defined by the subnet mask.

Example:

192.168.1.10/24

`/24` means:

- First 24 bits = network
    
- Remaining 8 bits = host
    

---

## 4. CIDR Notation

CIDR = Classless Inter-Domain Routing

Format:

IP / prefix_length

Examples:

- `/8` → 255.0.0.0
    
- `/16` → 255.255.0.0
    
- `/24` → 255.255.255.0
    
- `/30` → 255.255.255.252
    

CIDR replaced old class-based addressing.

---

## 5. Subnet Mask Explained

Subnet mask determines which bits represent the network.

Example:

IP:        192.168.1.10  
Mask:      255.255.255.0  
Binary:    11111111.11111111.11111111.00000000

1 = network bit  
0 = host bit

---

# Part 2 — Subnetting Fundamentals

---

## 6. Why Subnet?

Subnetting allows:

- Network segmentation
    
- Broadcast domain reduction
    
- Security isolation
    
- Efficient IP utilization
    

Used heavily in:

- Cloud VPC design
    
- Kubernetes clusters
    
- On-prem VLAN segmentation
    
- DMZ architecture
    

---

## 7. Calculating Hosts per Subnet

Formula:

2^(host_bits) - 2

Why minus 2?

- Network address (first address)
    
- Broadcast address (last address)
    

Example:

`/24`

Host bits = 8  
2^8 = 256  
256 - 2 = 254 usable hosts

---

## 8. Common Subnet Sizes

|CIDR|Hosts|Use Case|
|---|---|---|
|/30|2|Point-to-point links|
|/29|6|Small infrastructure|
|/28|14|Small VLAN|
|/27|30|Small office|
|/26|62|Medium segment|
|/25|126|Larger segment|
|/24|254|Standard LAN|

Memorize /24, /25, /26, /27, /28 at minimum.

---

## 9. Example Subnet Breakdown

Given:

192.168.1.0/26

Step 1: Determine block size

`/26` → 64 addresses per subnet (2^6)

Subnets:

- 192.168.1.0 – 192.168.1.63
    
- 192.168.1.64 – 192.168.1.127
    
- 192.168.1.128 – 192.168.1.191
    
- 192.168.1.192 – 192.168.1.255
    

First subnet:

- Network: 192.168.1.0
    
- Usable: 192.168.1.1 – 192.168.1.62
    
- Broadcast: 192.168.1.63
    

---

## 10. Private IP Ranges

Defined by RFC 1918:

|Range|CIDR|
|---|---|
|10.0.0.0 – 10.255.255.255|/8|
|172.16.0.0 – 172.31.255.255|/12|
|192.168.0.0 – 192.168.255.255|/16|

Used internally.

Not routable on public internet.

---

## 11. Public vs Private IP

Private IP:

- Internal use
    
- Requires NAT to access internet
    

Public IP:

- Globally routable
    
- Assigned by ISP or cloud provider
    

---

# Part 3 — Advanced Subnetting Concepts

---

## 12. VLSM (Variable Length Subnet Masking)

Allows different subnet sizes within same network.

Example:

10.0.0.0/24

Divide into:

- /26 for servers
    
- /27 for users
    
- /28 for management
    
- /30 for links
    

Efficient and scalable.

Used heavily in cloud VPC design.

---

## 13. Supernetting (Route Aggregation)

Opposite of subnetting.

Combine smaller networks into one route.

Example:

- 192.168.0.0/24
    
- 192.168.1.0/24
    

Aggregate:

192.168.0.0/23

Reduces routing table size.

---

## 14. Broadcast and Network Addresses

Every subnet has:

- First address = Network
    
- Last address = Broadcast
    
- Everything in between = Usable hosts
    

Example:

10.0.0.0/24

- Network: 10.0.0.0
    
- Broadcast: 10.0.0.255
    

---

## 15. Subnetting in Cloud (DevOps Context)

Example: Azure VNet

You might design:

- 10.0.0.0/16 VNet
    
    - 10.0.1.0/24 App subnet
        
    - 10.0.2.0/24 DB subnet
        
    - 10.0.3.0/27 Bastion subnet
        
    - 10.0.4.0/28 Gateway subnet
        

Cloud subnet planning mistakes are expensive to fix.

Always plan future growth.

---

# Part 4 — IPv6 (High-Level Overview)

---

## 16. IPv6 Structure

128-bit address

Example:

2001:0db8:85a3:0000:0000:8a2e:0370:7334

Usually written shortened:

2001:db8:85a3::8a2e:370:7334

No broadcast in IPv6.

Uses multicast instead.

---

## 17. Common IPv6 Prefixes

|Prefix|Meaning|
|---|---|
|/64|Standard subnet|
|fe80::|Link-local|
|::1|Loopback|
|::|Unspecified|

Most IPv6 subnets are /64.

---

# Part 5 — Interview-Level Knowledge

---

## 18. Common Interview Questions

**Q: How many hosts in /27?**

32 total  
30 usable

**Q: What is network address in 192.168.10.50/28?**

Block size = 16  
Subnets:

- 0–15
    
- 16–31
    
- 32–47
    
- 48–63
    

Answer: 192.168.10.48

---

## 19. Mental Math Shortcut

Block size formula:

256 - last_octet_mask

Example:

Mask: 255.255.255.224  
256 - 224 = 32

Subnet increments by 32.

---

# 20. DevSecOps Relevance

IP and subnet mastery is critical for:

- VPC architecture
    
- Zero Trust segmentation
    
- Firewall rules
    
- Kubernetes networking
    
- VPN design
    
- Hybrid cloud connectivity
    
- Network troubleshooting
    

Many “cloud engineers” struggle here.

If you master this, you operate at infrastructure level — not abstraction level.