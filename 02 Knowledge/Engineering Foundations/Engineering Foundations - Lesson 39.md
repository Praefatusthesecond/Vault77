---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Zero Trust Architecture

This lesson builds on:

- Defense in Depth
    
- Authentication & Authorization
    
- Encryption
    
- Threat Modeling
    
- Distributed Systems Architecture
    

We now answer:

> What if nothing in the network is automatically trusted?

---

## 1. Core Concept

Zero Trust means:

> Never trust. Always verify.

No user, device, service, or network location is inherently trusted.

Trust must be:

- Explicit
    
- Verified continuously
    
- Context-aware
    

---

## 2. Why Zero Trust Exists

Traditional model:
```text
Outside (Untrusted) → Firewall → Inside (Trusted)
```
Problem:

Once inside,  
attackers move laterally.

Modern systems:

- Cloud-native
    
- Remote workforce
    
- Microservices
    
- APIs everywhere
    
- Third-party integrations
    

The “perimeter” no longer exists.

---

## 3. Zero Trust Model
```text
Every request → Authenticate → Authorize → Validate context
```
No implicit trust based on:

- Network location
    
- Internal IP
    
- VPN presence
    
- Service proximity
    

Each request must prove legitimacy.

---

## 4. Core Principles of Zero Trust

### 1️⃣ Verify Explicitly

Always authenticate and authorize.

Use:

- Strong identity
    
- MFA
    
- Short-lived tokens
    
- Signed requests
    

---

### 2️⃣ Least Privilege Access

Grant minimum permissions.

Use:

- Role-based access control (RBAC)
    
- Attribute-based access control (ABAC)
    
- Fine-grained policies
    

---

### 3️⃣ Assume Breach

Design as if attacker is already inside.

Use:

- Network segmentation
    
- Service-to-service authentication
    
- Monitoring and anomaly detection
    
- Short-lived credentials
    

---

## 5. Zero Trust in Distributed Systems

In microservices architecture:

Bad model:  
Internal services trust each other automatically.

Zero Trust model:

- Each service verifies identity of caller.
    
- Mutual TLS between services.
    
- Token validation on every request.
    
- No blind trust of upstream components.
    

Internal traffic must be authenticated and encrypted.

---

## 6. Identity as the New Perimeter

In Zero Trust:

Identity replaces network location.

Access decisions consider:

- Who is requesting?
    
- What device?
    
- What location?
    
- What time?
    
- What risk signals?
    

Context-aware authorization increases security depth.

---

## 7. Microservices Example

Service A calls Service B.

Zero Trust requires:

- Mutual authentication (mTLS or token-based).
    
- Authorization check on each request.
    
- Scope validation.
    
- Logging for auditing.
    

Even internal calls must be verified.

---

## 8. Zero Trust & Availability

Security controls must:

- Be highly available.
    
- Avoid central bottlenecks.
    
- Not create single points of failure.
    

Authentication services must scale.

Otherwise security becomes availability risk.

---

## 9. Real-World Scenario

Employee laptop compromised.

Traditional model:  
Attacker gains VPN access → full internal trust.

Zero Trust model:

- Device posture checked.
    
- MFA required.
    
- Role restrictions enforced.
    
- Sensitive services require re-authentication.
    
- Anomalous behavior detected.
    

Compromise blast radius reduced.

---

## 10. Zero Trust & Cloud Environments

Cloud systems:

- Dynamic IP addresses
    
- Ephemeral instances
    
- Multi-region deployments
    

IP-based trust models break down.

Zero Trust uses:

- Identity-based policies
    
- Short-lived credentials
    
- Automatic rotation
    
- Service mesh authentication
    

Security becomes dynamic.

---

## 11. Applied Scenario

Design internal payment service.

Questions:

- How do services authenticate to it?
    
- How are tokens validated?
    
- What happens if one service is compromised?
    
- Can compromised service call admin APIs?
    
- How are permissions limited?
    

Design assuming breach.

---

## 12. Mini Exercise

Imagine:

You rely on IP allowlists for internal API protection.

What happens if attacker compromises internal server?

Now imagine:

Each internal request requires:

- Signed token
    
- mTLS
    
- Role verification
    

How does risk change?

---

## 13. Self-Test

Answer without scrolling:

1. What is Zero Trust?
    
2. Why is network-based trust insufficient today?
    
3. What does “assume breach” mean?
    
4. Why must internal services authenticate each other?
    
5. How does identity replace the perimeter?
    

---

## 14. Connection to Previous Lessons

- Defense in depth creates layered protection.
    
- Authentication & authorization enforce identity.
    
- Encryption protects service-to-service calls.
    
- Threat modeling identifies lateral movement.
    
- Observability detects anomalies.
    
- Incident response limits breach impact.
    
- Distributed systems multiply trust boundaries.
    

Zero Trust modernizes defense in depth for cloud-native systems.

---

## 15. Difficulty Calibration

You are now thinking in:

- Identity-centric architecture
    
- Lateral movement prevention
    
- Context-aware authorization
    
- Service-to-service verification
    
- Security as distributed design principle
    

This is advanced security architecture thinking.

---

Back to [[Engineering Foundations - Lesson 38]]
