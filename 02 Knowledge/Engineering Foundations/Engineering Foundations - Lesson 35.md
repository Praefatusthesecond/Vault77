---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Threat Modeling Fundamentals

This lesson builds on:

- CIA Triad
    
- Distributed Systems
    
- Reliability & Incident Response
    
- Risk Modeling
    
- System Architecture
    

We now answer:

> How do we systematically identify security risks before attackers do?

---

## 1. Core Concept

Threat modeling is:

> A structured process for identifying assets, threats, vulnerabilities, and mitigations in a system.

It is proactive security design.

Instead of:

“Fix security issues after breach”

We ask:

“What could go wrong — intentionally?”

---

## 2. Why This Matters

Modern systems:

- Expose public APIs
    
- Depend on third-party services
    
- Use distributed data stores
    
- Process sensitive data
    
- Operate globally
    

Attack surface increases with scale.

Threat modeling reduces blind spots.

---

## 3. The Core Question Framework

At its simplest, threat modeling asks:

1. What are we building?
    
2. What can go wrong?
    
3. What are we going to do about it?
    
4. Did we do a good job?
    

Simple structure.  
Deep implications.

---

## 4. Identify Assets

Assets are:

> Anything of value to attackers.

Examples:

- User credentials
    
- Payment data
    
- API keys
    
- Session tokens
    
- Business logic
    
- Intellectual property
    
- Availability of service
    

If it has value, it is an asset.

---

## 5. Identify Trust Boundaries

A trust boundary exists where:

> Data crosses from one level of trust to another.

Examples:

- User → API server
    
- API server → database
    
- Internal service → external payment provider
    
- Cloud environment → on-prem environment
    

Each boundary is a risk point.

Distributed systems have many boundaries.

---

## 6. Data Flow Diagrams (DFD)

Threat modeling often starts with:

A simple data flow diagram.
```text
User → API → Service → Database
```
Then mark:

- Assets
    
- Trust boundaries
    
- External inputs
    
- Sensitive data flows
    

This clarifies attack surface.

---

## 7. STRIDE Model (Structured Threat Categories)

A common model for categorizing threats:
```text
S – Spoofing  
T – Tampering  
R – Repudiation  
I – Information Disclosure  
D – Denial of Service  
E – Elevation of Privilege
```
Each category maps to CIA elements.

---

### Spoofing

Pretending to be someone else.

Example:  
Stolen credentials.

---

### Tampering

Altering data or systems.

Example:  
Changing payment amount in transit.

---

### Repudiation

Denying actions without audit trail.

Example:  
User claims they never placed order.

---

### Information Disclosure

Unauthorized data exposure.

Example:  
Publicly exposed database.

---

### Denial of Service

Making system unavailable.

Example:  
DDoS attack.

---

### Elevation of Privilege

Gaining higher access than allowed.

Example:  
User accessing admin endpoints.

---

## 8. Applying STRIDE to a Checkout Service

System:

User → API → Order Service → Payment Service → Database

Ask for each component:

- Can user spoof identity?
    
- Can requests be tampered with?
    
- Is there logging for repudiation?
    
- Can payment data leak?
    
- Can API be overwhelmed?
    
- Can user escalate privileges?
    

This systematic questioning reveals risks.

---

## 9. Risk Assessment

After identifying threats, evaluate:

- Likelihood
    
- Impact
    
- Detectability
    

High likelihood + high impact = priority.

Security engineering is prioritization.

---

## 10. Mitigation Strategies

For each threat:

- Prevent
    
- Detect
    
- Respond
    

Example:

Threat: Spoofed session token  
Mitigation:

- Strong authentication
    
- Token signing
    
- Short expiration
    
- Logging
    
- Monitoring
    

Defense in depth.

---

## 11. Security & Distributed Systems

Threat modeling must consider:

- Microservices communication
    
- API gateways
    
- Message queues
    
- Replicated databases
    
- Cross-region traffic
    

Each distributed component adds new attack surface.

Complexity increases risk.

---

## 12. Applied Scenario

You are designing:

A public REST API.

Identify:

1. Assets
    
2. Trust boundaries
    
3. STRIDE threats
    
4. Top 3 mitigations
    

Walk through systematically.

---

## 13. Mini Exercise

Imagine:

Your system stores user-uploaded images.

Questions:

- Can users upload malicious files?
    
- Can storage bucket be accessed publicly?
    
- Can metadata leak private info?
    
- Can uploads exhaust storage (DoS)?
    

Think through CIA + STRIDE.

---

## 14. Self-Test

Answer without scrolling:

1. What is threat modeling?
    
2. What is an asset?
    
3. What is a trust boundary?
    
4. What does STRIDE stand for?
    
5. Why is security prioritization necessary?
    

---

## 15. Connection to Previous Lessons

- Distributed systems increase attack surface.
    
- Availability ties into DoS protection.
    
- Observability helps detect attacks.
    
- Incident response applies to breaches.
    
- Capacity planning mitigates DoS.
    
- Change management reduces misconfiguration risk.
    
- Error budgets apply to security-related outages.
    

Threat modeling connects architecture to adversarial thinking.

---

## 16. Difficulty Calibration

You are now thinking in:

- Asset valuation
    
- Boundary analysis
    
- Adversarial modeling
    
- Structured risk identification
    

This is professional security engineering thinking.

---

Back to [[Engineering Foundations - Lesson 34]]