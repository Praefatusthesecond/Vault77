---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Logging & Audit Security

This lesson builds on:

- Secure SDLC
    
- Threat Modeling
    
- Authentication & Authorization
    
- Defense in Depth
    
- Incident Response
    
- Observability
    

We now answer:

> How do we detect and investigate security events?

---

## 1. Core Concept

Logging & auditing means:

> Recording security-relevant events in a way that enables detection, investigation, and accountability.

Security logging is not the same as debugging logs.

It focuses on:

- Access
    
- Privilege use
    
- Sensitive operations
    
- Configuration changes
    
- Authentication events
    

---

## 2. Why This Matters

Without logs:

- Breaches go unnoticed.
    
- Root cause cannot be determined.
    
- Attackers move silently.
    
- Compliance fails.
    
- Forensics is impossible.
    

Logging is part of defense in depth.

Detection layer.

---

## 3. Security Logging vs Application Logging

Application logs:

- “Order processed”
    
- “Cache miss”
    
- “API response time”
    

Security logs:

- “User X failed login 5 times”
    
- “Admin role granted”
    
- “Permission denied on resource”
    
- “New API key created”
    
- “Database access from unknown IP”
    

Different purpose.  
Different retention needs.

---

## 4. What Should Be Logged?

Security-relevant events include:
```text
Authentication attempts  
Authorization failures  
Privilege changes  
Configuration changes  
Sensitive data access  
Account creation/deletion  
Key rotations  
Admin actions
```
Not every event.  
Only security-relevant events.

---

## 5. Audit Trails

An audit trail is:

> A tamper-resistant record of who did what and when.

Good audit logs include:

- Identity
    
- Timestamp
    
- Action
    
- Target resource
    
- Result (success/failure)
    
- Source IP / device
    
- Correlation ID
    

Logs must be structured and searchable.

---

## 6. Tamper Resistance

Security logs must be:

- Immutable
    
- Protected from modification
    
- Stored separately from application systems
    
- Access-controlled
    

If attacker can modify logs,  
detection becomes meaningless.

Common strategies:

- Write-once storage
    
- Centralized log aggregation
    
- Restricted write permissions
    

---

## 7. Logging & Privacy

Important trade-off:

Do not log sensitive data unnecessarily.

Never log:

- Plaintext passwords
    
- Full credit card numbers
    
- API secrets
    
- Private keys
    

Security logging must respect confidentiality.

---

## 8. Logging & Detection

Logs are useless without monitoring.

Detection systems look for:

- Unusual login patterns
    
- Multiple failed attempts
    
- Privilege escalation
    
- Suspicious geographic access
    
- Unusual API usage
    

Observability meets security here.

---

## 9. Distributed Systems Considerations

Microservices environment:

- Logs spread across services.
    
- Correlation IDs required.
    
- Centralized logging platform needed.
    
- Time synchronization critical.
    

Without centralized logging,  
investigation becomes chaos.

---

## 10. Real-World Scenario

Attacker compromises user account.

What logs help detect it?

- Login from new country
    
- Multiple failed attempts
    
- MFA bypass attempt
    
- High-volume API access
    
- Access to admin endpoints
    

Audit trail enables response.

---

## 11. Retention & Compliance

Logs must:

- Be retained for defined period.
    
- Follow regulatory requirements.
    
- Support forensic investigations.
    

But:

Retention must balance storage cost and privacy risk.

Security logging is governance discipline.

---

## 12. Applied Scenario

Design logging for:

A multi-tenant SaaS platform.

Questions:

- What events must be logged?
    
- Who can access logs?
    
- How are logs protected?
    
- How long are they retained?
    
- How are anomalies detected?
    

Think in CIA + compliance + operations.

---

## 13. Mini Exercise

Imagine:

Admin account deletes database records.

What audit fields must exist to investigate?

- Identity?
    
- Timestamp?
    
- Source IP?
    
- Before/after state?
    
- Correlation ID?
    

What if logs were stored on same compromised server?

Consider tamper resistance.

---

## 14. Self-Test

Answer without scrolling:

1. What is the purpose of security logging?
    
2. What is an audit trail?
    
3. Why must logs be tamper-resistant?
    
4. Why should sensitive data not be logged?
    
5. Why is centralized logging important in distributed systems?
    

---

## 15. Connection to Previous Lessons

- Threat modeling identifies critical events.
    
- Authentication logs detect spoofing.
    
- Authorization logs detect privilege escalation.
    
- Defense in depth includes detection.
    
- Incident response relies on logs.
    
- Observability provides aggregation.
    
- Change management logs configuration updates.
    
- Reliability discipline uses correlation IDs.
    

Logging is security visibility.

---

## 16. Difficulty Calibration

You are now thinking in:

- Detection architecture
    
- Forensic readiness
    
- Tamper resistance
    
- Security observability
    
- Governance and compliance
    

This is mature security engineering.

---
Back to [[Engineering Foundations - Lesson 41]]

