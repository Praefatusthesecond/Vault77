---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## What Is Security Engineering? & The CIA Triad

This lesson builds on:

- Distributed Systems
    
- Reliability Engineering
    
- Observability
    
- Risk Modeling
    
- Change Management
    

We now answer:

> What does it mean for a system to be secure?

---

## 1. Core Concept

Security engineering is:

> The discipline of designing, building, and operating systems that protect assets against intentional misuse or attack.

Reliability deals with accidental failure.  
Security deals with intentional misuse.

The mindset changes from:

“How does this fail naturally?”

to

“How could someone abuse this?”

---

## 2. Why This Matters

Distributed systems:

- Increase attack surface
    
- Expose APIs publicly
    
- Depend on third-party services
    
- Store sensitive data
    
- Cross trust boundaries
    

Scale multiplies risk.

Security must be designed in — not added later.

---

# 3️⃣ The CIA Triad

Security is often framed using three core properties:
```text
Confidentiality  
Integrity  
Availability
```
These are the foundational pillars of security.

---

## 4. Confidentiality

Confidentiality means:

> Only authorized parties can access information.

Examples:

- Encrypted passwords
    
- Private user data
    
- API keys
    
- Payment information
    

Threats to confidentiality:

- Data breaches
    
- Unauthorized access
    
- Leaked credentials
    
- Misconfigured storage
    

Protection mechanisms:

- Encryption
    
- Access control
    
- Authentication
    
- Network segmentation
    

---

## 5. Integrity

Integrity means:

> Data and systems cannot be altered improperly.

Examples:

- Orders cannot be modified by attackers
    
- Payment amounts cannot be changed
    
- Logs cannot be silently edited
    

Threats to integrity:

- SQL injection
    
- Man-in-the-middle attacks
    
- Unauthorized modification
    
- Compromised dependencies
    

Protection mechanisms:

- Input validation
    
- Cryptographic signatures
    
- Hashing
    
- Audit logs
    
- Role-based access control
    

---

## 6. Availability

Availability means:

> Systems remain accessible when needed.

This overlaps with SRE.

Threats to availability:

- DDoS attacks
    
- Resource exhaustion
    
- Ransomware
    
- Account lockout abuse
    

Protection mechanisms:

- Rate limiting
    
- Redundancy
    
- Backpressure
    
- Capacity planning
    
- Network protection
    

Security and reliability intersect strongly here.

---

## 7. Visual Model – CIA Balance
```text
Confidentiality  ←→  Integrity  ←→  Availability
```
Improving one may impact another.

Example:

Extreme encryption → increased latency → availability trade-off.

Security, like reliability, is about trade-offs.

---

## 8. Security vs Reliability

Reliability protects against:

- Hardware failure
    
- Network partitions
    
- Overload
    
- Bugs
    

Security protects against:

- Malicious actors
    
- Abuse
    
- Exploitation
    
- Data theft
    

Some incidents overlap.

Example:  
DDoS attack affects availability.

Security incident becomes reliability incident.

---

## 9. Applied Scenario

You design a checkout service.

Confidentiality:

- Encrypt payment data.
    
- Restrict access to transaction logs.
    

Integrity:

- Validate price server-side.
    
- Prevent client-side tampering.
    

Availability:

- Rate-limit API.
    
- Protect against bot abuse.
    
- Scale under traffic spikes.
    

Security must exist at every layer.

---

## 10. Threat Thinking

Security engineering introduces:

Adversarial modeling.

Ask:

- What assets exist?
    
- Who might want them?
    
- How could they attack?
    
- What is the impact?
    
- What controls mitigate risk?
    

This becomes formal in threat modeling.

---

## 11. Security as Risk Management

Like SRE, security is not absolute.

It is:

> Risk reduction under resource constraints.

You cannot eliminate all risk.

You can:

- Reduce likelihood
    
- Reduce impact
    
- Increase detection
    
- Increase response speed
    

Security is risk economics.

---

## 12. Mini Exercise

Imagine:

You store user passwords.

What protects:

- Confidentiality?
    
- Integrity?
    
- Availability?
    

Now imagine:

An attacker floods your API.

Which CIA property is targeted?

What controls apply?

Think in triad terms.

---

## 13. Self-Test

Answer without scrolling:

1. What is security engineering?
    
2. What does confidentiality protect?
    
3. What does integrity protect?
    
4. How does availability overlap with SRE?
    
5. Why is security fundamentally risk management?
    

---

## 14. Connection to Previous Lessons

- Availability links directly to SLOs.
    
- Capacity planning defends against DDoS.
    
- Alerting detects abnormal patterns.
    
- Incident response applies to security events.
    
- Change management reduces configuration mistakes.
    
- Observability helps detect breaches.
    
- Distributed systems increase attack surface.
    

Security is the third pillar alongside:

- Distributed systems
    
- Reliability engineering
    

---

## 15. Difficulty Calibration

You are now shifting cognitive mode:

From failure-driven thinking  
to adversarial thinking.

This is a significant step.

---

Back to [[Engineering Foundations - Lesson 33]]