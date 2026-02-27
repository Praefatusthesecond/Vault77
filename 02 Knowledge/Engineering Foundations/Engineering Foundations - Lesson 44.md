---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Capstone
---
Back to [[Engineering Foundations - Index]]

## Capstone – Designing a Production-Grade Distributed System

We will design:

> A Multi-Tenant SaaS E-Commerce Platform

Requirements:

- Public web API
    
- User authentication
    
- Order processing
    
- Payment integration
    
- Admin dashboard
    
- High availability
    
- Secure data handling
    
- Global users
    
- Regulatory compliance
    

We will design this using:

- Distributed Systems thinking
    
- SRE discipline
    
- Security engineering
    

---

# 1️⃣ Step 1 – High-Level Architecture
```text
Users  
  ↓  
CDN / WAF  
  ↓  
API Gateway  
  ↓  
Auth Service  
  ↓  
Order Service → Payment Service  
  ↓  
Database Cluster  
  ↓  
Object Storage (uploads)
```
Plus:

- Message queue (for async processing)
    
- Logging & monitoring pipeline
    
- CI/CD pipeline
    
- Secret management system
    

Now we apply the three pillars.

---

# 2️⃣ Distributed Systems Lens

### Scalability

- Stateless API services
    
- Horizontal scaling
    
- Auto-scaling based on load
    
- Read replicas for database
    

### Failure Handling

- Circuit breakers between services
    
- Timeouts on downstream calls
    
- Retry with backoff
    
- Idempotent order creation
    

### Consistency

- Orders written transactionally
    
- Payment processing via saga pattern
    
- Event-driven updates
    

### Blast Radius Control

- Service isolation
    
- Region failover
    
- Sharding for tenant isolation
    

This ensures system behavior under scale and failure is predictable.

---

# 3️⃣ Reliability (SRE) Lens

### SLIs

- API success rate
    
- p99 latency
    
- Order processing success rate
    
- Payment confirmation delay
    

### SLOs

- 99.9% API availability
    
- p99 latency < 400ms
    
- 99.99% order integrity
    

### Error Budget

- Deployment speed tied to budget consumption
    

### Alerting

- Burn rate alerts
    
- Symptom-based paging
    

### Capacity Planning

- Headroom of 30%
    
- Load testing before major events
    
- Separate scaling of read/write workloads
    

### Incident Response

- Defined SEV levels
    
- Runbooks
    
- Blameless postmortems
    

Reliability is measurable and governed.

---

# 4️⃣ Security Lens

### Threat Modeling

Assets:

- Payment data
    
- User credentials
    
- Order history
    
- API keys
    

Trust boundaries:

- User → API
    
- API → Payment provider
    
- Internal service communication
    
- Admin access
    

### Authentication

- MFA for admins
    
- OAuth-based login
    
- Short-lived JWT tokens
    
- Mutual TLS for service-to-service
    

### Authorization

- RBAC roles
    
- Tenant isolation
    
- Least privilege IAM roles
    

### Encryption

- TLS everywhere
    
- Database encryption at rest
    
- Encrypted backups
    
- Secret manager for keys
    

### Defense in Depth

- WAF at edge
    
- Rate limiting
    
- Input validation
    
- Token validation at every service
    
- Database access restrictions
    

### Zero Trust

- No internal service trust without verification
    
- Each service validates identity
    
- Short-lived credentials
    

### Logging & Audit

- Log admin actions
    
- Log privilege escalation
    
- Log failed auth attempts
    
- Centralized log aggregation
    
- Tamper-resistant storage
    

### Security Incident Response

- Key rotation procedures
    
- Breach containment playbooks
    
- Forensic log retention
    

Security integrated across architecture.

---

# 5️⃣ Interactions Between Pillars

Now observe how pillars intersect.

### Example 1 – DDoS Attack

Security:

- Rate limiting
    
- WAF
    
- IP filtering
    

Reliability:

- Auto-scaling
    
- Backpressure
    
- Circuit breakers
    

Distributed Systems:

- Stateless scaling
    
- Regional failover
    

All three pillars collaborate.

---

### Example 2 – Compromised API Key

Security:

- Revoke key
    
- Rotate secrets
    
- Audit usage logs
    

Reliability:

- Monitor SLO impact
    
- Incident response coordination
    

Distributed Systems:

- Ensure revocation propagates across services
    

---

### Example 3 – Database Overload

Reliability:

- Capacity planning
    
- Scaling replicas
    

Security:

- Ensure encryption remains intact
    
- Avoid logging sensitive data during debugging
    

Distributed Systems:

- Sharding strategy
    
- Partition handling
    

No pillar stands alone.

---

# 6️⃣ Failure & Attack Simulation

Ask two categories of questions:

### Failure Questions

- What if database primary fails?
    
- What if payment provider times out?
    
- What if message queue backs up?
    
- What if region is unavailable?
    

### Attack Questions

- What if attacker steals admin token?
    
- What if storage bucket misconfigured?
    
- What if insider misuses privileges?
    
- What if credentials leak in logs?
    

Design must answer both.

---

# 7️⃣ Governance Layer

Add governance controls:

- Infrastructure as Code review
    
- CI/CD security scanning
    
- Policy-as-code enforcement
    
- Deployment approval gates
    
- Access review audits
    

Security and reliability are enforced through process.

---

# 8️⃣ Mini Exercise

Take one subsystem:

Payment Service.

Answer:

1. How does it scale?
    
2. How does it handle failure?
    
3. How is it authenticated?
    
4. How is access restricted?
    
5. What are its SLIs?
    
6. What logs are collected?
    
7. How is blast radius limited?
    

Design in integrated thinking.

---

# 9️⃣ Self-Test

Without scrolling:

1. Why must reliability and security be designed together?
    
2. How does Zero Trust apply to microservices?
    
3. How does error budget influence deployment?
    
4. Why must audit logs be centralized?
    
5. How does distributed design affect attack surface?
    

---

# 🔟 Final Mental Model

You now think in three simultaneous layers:
```text
Distributed Systems → How it behaves  
Reliability (SRE)   → How it operates  
Security Engineering → How it is defended
```
Professional engineering requires all three.

---

# 🧠 What You’ve Built

You now possess:

- Architectural reasoning
    
- Operational discipline
    
- Adversarial awareness
    
- Risk modeling intuition
    
- Quantitative reliability thinking
    
- Secure design instincts
    

This is beyond beginner level.

This is early senior-level conceptual foundation.

---
Back to [[Engineering Foundations - Lesson 43]]
# Untitled

## Summary
<!-- One or two sentences explaining the core idea -->

## Notes
- 

## Related
- 
