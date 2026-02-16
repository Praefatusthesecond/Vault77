---
type: daily
date: 2026-02-11
---

# Wednesday, 2026-02-11

## Log
- 

## Tasks
- [ ] 

## Notes & Links

# 🧱 Tier 2 – Infrastructure & Platform Engineering Depth

---

## 🐳 5. Docker (Missing!)

You have Kubernetes but no Docker section.

Must include:

- Dockerfile best practices
    
- Multi-stage builds
    
- Image hardening
    
- Rootless containers
    
- Image scanning
    
- Distroless images
    
- Registry security
    
- Layer caching optimization
    

Reference:

- Docker official docs
    
- CIS Docker Benchmark
    

---

## 🧩 6. Linux Internals (Critical for DevSecOps)

You use Bash — but you need:

- Process model
    
- Signals
    
- systemd
    
- cgroups
    
- namespaces
    
- File permissions deep dive
    
- PAM
    
- SELinux/AppArmor basics
    
- Networking stack
    

A DevSecOps engineer who understands Linux internals is dangerous (in a good way).

---

## 🌐 7. Networking Deep Dive

Offline reference for:

- TCP/IP stack
    
- TLS handshake
    
- mTLS
    
- Reverse proxies
    
- Load balancers
    
- WAFs
    
- DNS deep dive
    
- VPN basics
    
- BGP basics
    
- Packet flow in cloud
    

Add:

- Common ports cheat sheet
    
- Troubleshooting flowcharts
    

---

# 🏗 Tier 3 – Architecture & Design

This is what separates engineers from senior engineers.

---

## 🧠 8. Cloud Architecture Patterns

Include:

- Well-Architected Frameworks (AWS & Azure)
    
- Multi-account strategy
    
- Landing zone patterns
    
- Hub-spoke networking
    
- Zero trust cloud patterns
    
- HA/DR design patterns
    
- Cost optimization strategies
    

You want diagrams and decision trees here.

---

## 🔁 9. CI/CD Engineering

You have Azure DevOps, but add:

- GitOps principles
    
- Trunk-based development
    
- Release strategies:
    
    - Blue/Green
        
    - Canary
        
    - Feature flags
        
- Versioning strategies
    
- Artifact repository patterns
    
- Pipeline anti-patterns
    

---

## 🧰 10. Secrets Management

Dedicated section.

- Vault concepts (HashiCorp Vault)
    
- Azure Key Vault
    
- AWS Secrets Manager
    
- Rotation strategies
    
- Secret zero problem
    
- K8s secrets vs external secrets
    

---

# ⚖️ Tier 4 – Governance & Compliance

You have ISO 27001 already (good).

Add:

## 📜 11. Regulatory & Standards Mapping

- ISO 27001 mapping to cloud controls
    
- SOC2 overview
    
- NIST CSF
    
- CIS Benchmarks
    
- GDPR security impacts
    
- Data classification frameworks
    

Include:

- Control mapping table templates
    

---

# 🧬 Tier 5 – Observability Engineering

Grafana & Zabbix are there.

But add:

- Observability theory (Logs, Metrics, Traces)
    
- OpenTelemetry
    
- SLO / SLA / SLI design
    
- Error budgets
    
- Golden signals
    
- RED / USE methods
    

This makes you platform-level capable.

---

# 🧨 Tier 6 – Offensive Knowledge (Controlled Exposure)

A DevSecOps engineer should understand the attacker mindset.

Add a section:

## 🔓 Basic Offensive Security Concepts

- Common cloud misconfigurations
    
- Privilege escalation in AWS/Azure
    
- Container escape basics
    
- OWASP Top 10
    
- SSRF, XSS, CSRF concepts
    
- Token theft patterns
    
- Lateral movement basics
    

Not to become a hacker.  
But to engineer defensively.

---

# 🧭 Tier 7 – Professional Edge

This is the meta-layer.

## 🗂️ 12. Runbooks & Playbooks

Create templates for:

- Incident response
    
- Postmortems
    
- Disaster recovery
    
- Security incident handling
    
- On-call checklist
    

## 🧪 13. Lab Guides

Offline reproducible labs:

- Build insecure pipeline → secure it
    
- Break IAM → fix it
    
- Deploy vulnerable container → harden it
    
- Simulate log ingestion and detection
    

That’s mastery.
