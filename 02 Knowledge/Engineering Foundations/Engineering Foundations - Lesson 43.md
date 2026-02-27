---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Security Incident Response

This lesson builds on:

- Logging & Audit Security
    
- Threat Modeling
    
- Secure SDLC
    
- Defense in Depth
    
- Zero Trust
    
- Incident Response (SRE)
    

We now answer:

> What happens when your system is actively under attack or breached?

Security incidents are different from reliability incidents.

They involve adversaries.

---

## 1. Core Concept

A security incident is:

> A confirmed or suspected violation of security policy that threatens confidentiality, integrity, or availability.

Examples:

- Data breach
    
- Account takeover
    
- Ransomware infection
    
- Privilege escalation
    
- API key leak
    
- Unauthorized database access
    

Security incidents involve intent.

---

## 2. Why This Matters

Unlike reliability failures:

- Attackers adapt.
    
- Evidence may be destroyed.
    
- Legal implications may exist.
    
- Reputation damage may occur.
    
- Regulatory reporting may be required.
    

Security response requires precision.

---

## 3. Security Incident Lifecycle
```text
Detection → Containment → Eradication → Recovery → Post-Incident Review
```
Similar to SRE lifecycle — but adversarial.

---

## 4. Detection

Detection sources:

- Anomaly alerts
    
- Suspicious login patterns
    
- IDS/IPS alerts
    
- Log correlation signals
    
- External reports
    
- Bug bounty disclosures
    

Fast detection limits damage.

---

## 5. Containment

Containment means:

> Limiting further damage immediately.

Examples:

- Revoke compromised credentials
    
- Disable affected accounts
    
- Isolate infected systems
    
- Block malicious IP addresses
    
- Rotate API keys
    
- Disable affected feature
    

Containment prioritizes stopping spread.

---

## 6. Eradication

After containment:

Remove root cause.

Examples:

- Patch vulnerability
    
- Remove malicious code
    
- Close exposed port
    
- Fix access control logic
    
- Clean infected systems
    

Containment stops bleeding.  
Eradication removes infection.

---

## 7. Recovery

Recovery means:

> Safely restoring normal operations.

Examples:

- Re-enable accounts after reset
    
- Restore data from backups
    
- Re-deploy clean infrastructure
    
- Verify integrity of systems
    
- Monitor for reinfection
    

Recovery must be careful.  
Attackers may attempt re-entry.

---

## 8. Post-Incident Review

Like SRE postmortems — but with security focus.

Questions:

- How did attacker gain access?
    
- Which controls failed?
    
- Was detection fast enough?
    
- Was logging sufficient?
    
- What improvements are required?
    

Security incidents must produce systemic improvement.

---

## 9. Evidence Preservation

Security response requires:

- Preserving logs
    
- Capturing forensic data
    
- Avoiding accidental evidence destruction
    
- Maintaining chain of custody (if legal case possible)
    

Unlike reliability outages,  
security incidents may have legal consequences.

---

## 10. Communication Discipline

Security incidents require:

- Internal communication
    
- Executive briefing
    
- Legal consultation
    
- Customer notification (if required)
    
- Regulatory reporting (if required)
    

Public messaging must be accurate and controlled.

Poor communication increases damage.

---

## 11. Real-World Scenario

API key accidentally committed to public repository.

Immediate actions:

Containment:

- Revoke key.
    
- Rotate credentials.
    
- Audit usage logs.
    

Eradication:

- Remove exposed secret.
    
- Implement secret scanning.
    
- Review repository access.
    

Recovery:

- Confirm no unauthorized usage.
    
- Re-deploy with secure configuration.
    

Post-Incident:

- Update Secure SDLC.
    
- Add automated secret detection.
    

Security incident response closes the loop.

---

## 12. Security vs Reliability Incidents

Reliability:  
System stops working.

Security:  
System may still work — but attacker is inside.

Detection is harder.  
Impact may be hidden.

Availability-focused teams may miss integrity/confidentiality breaches.

Security requires adversarial thinking.

---

## 13. Applied Scenario

User reports:

Orders appear modified without authorization.

Questions:

- How do you confirm breach?
    
- What logs do you inspect?
    
- Do you disable all admin access?
    
- Do you preserve database snapshots?
    
- Do you notify users?
    

Design structured response.

---

## 14. Mini Exercise

Imagine:

You detect suspicious data exfiltration.

List:

1. Immediate containment steps.
    
2. How to preserve evidence.
    
3. How to assess blast radius.
    
4. How to prevent recurrence.
    

Think in lifecycle stages.

---

## 15. Self-Test

Answer without scrolling:

1. What defines a security incident?
    
2. What is containment?
    
3. Why is eradication separate from containment?
    
4. Why must evidence be preserved?
    
5. How does security incident response differ from reliability incident response?
    

---

## 16. Connection to Previous Lessons

- Logging enables detection.
    
- Threat modeling identifies high-risk assets.
    
- Authentication logs reveal account compromise.
    
- Encryption reduces breach impact.
    
- Defense in depth limits attacker movement.
    
- Zero Trust reduces lateral spread.
    
- Secure SDLC reduces vulnerability introduction.
    
- SRE incident response overlaps in coordination.
    

Security incident response integrates everything learned in Phase 5.

---

## 17. Difficulty Calibration

You are now thinking in:

- Adversarial lifecycle
    
- Controlled containment
    
- Evidence handling
    
- Cross-functional coordination
    
- Security risk governance
    

This completes the operational security foundation.

---
Back to [[Engineering Foundations - Lesson 42]]

