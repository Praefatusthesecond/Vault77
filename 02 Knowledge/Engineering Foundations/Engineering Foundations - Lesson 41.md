---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Secure SDLC (Secure Software Development Lifecycle)

This lesson builds on:

- Threat Modeling
    
- Secure Design Principles
    
- Change Management
    
- Defense in Depth
    
- Incident Response
    

We now answer:

> How do we build security into the development process instead of bolting it on later?

---

## 1. Core Concept

Secure SDLC means:

> Integrating security practices into every stage of the software development lifecycle.

Security is not a final review step.

It is continuous.

---

## 2. Why This Matters

Without Secure SDLC:

- Vulnerabilities reach production.
    
- Security fixes are reactive.
    
- Technical debt accumulates.
    
- Compliance becomes painful.
    
- Risk becomes unmanaged.
    

Security must shift left — earlier in the lifecycle.

---

## 3. Traditional SDLC vs Secure SDLC

Traditional flow:
```text
Plan → Build → Test → Deploy → Fix security later
```
Secure SDLC:
```text
Plan (Threat Model)  
→ Design (Secure Principles)  
→ Build (Secure Coding)  
→ Test (Security Testing)  
→ Deploy (Hardened)  
→ Monitor (Continuous Security)
```
Security exists at every stage.

---

## 4. Phase 1 – Requirements & Planning

Security activities:

- Identify sensitive assets.
    
- Define regulatory requirements.
    
- Define authentication needs.
    
- Define encryption requirements.
    
- Perform initial threat modeling.
    

Security starts before code exists.

---

## 5. Phase 2 – Design

Security activities:

- Apply secure design principles.
    
- Define trust boundaries.
    
- Choose authentication model.
    
- Define authorization rules.
    
- Plan key management.
    

Architecture decisions lock in risk posture.

---

## 6. Phase 3 – Implementation (Secure Coding)

Secure coding practices include:

- Input validation
    
- Output encoding
    
- Parameterized queries
    
- Proper error handling
    
- Avoiding hardcoded secrets
    
- Using approved crypto libraries
    

Common vulnerability classes:

- SQL injection
    
- XSS
    
- Broken access control
    
- Insecure deserialization
    
- Improper authentication
    

Secure coding prevents many classes of attack.

---

## 7. Phase 4 – Testing

Security testing includes:

- Static analysis (SAST)
    
- Dependency scanning
    
- Secret scanning
    
- Dynamic testing (DAST)
    
- Penetration testing
    

Testing must include negative test cases.

“Can I break this?” becomes formal.

---

## 8. Phase 5 – Deployment

Deployment hardening includes:

- Secure configuration
    
- Least privilege IAM roles
    
- TLS enforcement
    
- Secure secrets management
    
- Logging enabled
    
- Audit trails active
    

Infrastructure-as-code must also be reviewed securely.

---

## 9. Phase 6 – Monitoring & Maintenance

Post-deployment:

- Monitor anomalies.
    
- Patch dependencies.
    
- Rotate keys.
    
- Review access permissions.
    
- Re-run threat models periodically.
    

Security is continuous.

---

## 10. DevSecOps

Modern approach:

Security integrated into CI/CD pipelines.

Examples:

- Automated vulnerability scanning
    
- Policy-as-code
    
- Infrastructure scanning
    
- Container image scanning
    
- Pull request security checks
    

Security becomes automated guardrails.

---

## 11. Real-World Scenario

Your team adds new file upload feature.

Secure SDLC asks:

Planning:

- What file types allowed?
    
- Where stored?
    
- Virus scanning required?
    

Design:

- Validate MIME type?
    
- Limit file size?
    
- Enforce authentication?
    

Implementation:

- Sanitize file names.
    
- Store outside web root.
    
- Scan for malware.
    

Testing:

- Attempt malicious upload.
    
- Attempt oversized files.
    

Deployment:

- Ensure storage bucket private.
    
- Enable logging.
    

Monitoring:

- Alert on abnormal upload spikes.
    

Security integrated at every stage.

---

## 12. Secure SDLC & Distributed Systems

Microservices multiply:

- Codebases
    
- Dependencies
    
- APIs
    
- Trust boundaries
    

Secure SDLC must apply consistently across all services.

Inconsistent security posture increases attack surface.

---

## 13. Mini Exercise

You introduce:

A new payment integration.

List:

1. Planning questions.
    
2. Design security considerations.
    
3. Secure coding practices.
    
4. Testing strategies.
    
5. Deployment hardening steps.
    
6. Ongoing monitoring controls.
    

Think in lifecycle stages.

---

## 14. Self-Test

Answer without scrolling:

1. What is Secure SDLC?
    
2. Why must security start at planning?
    
3. What is secure coding?
    
4. Why must infrastructure be hardened?
    
5. Why is security continuous?
    

---

## 15. Connection to Previous Lessons

- Threat modeling starts in planning.
    
- Secure design principles guide architecture.
    
- Authentication & authorization defined in design.
    
- Encryption enforced in implementation.
    
- Defense in depth layered in deployment.
    
- Observability supports monitoring.
    
- Incident response handles discovered vulnerabilities.
    
- Change management governs secure releases.
    

Secure SDLC operationalizes security engineering.

---

## 16. Difficulty Calibration

You are now thinking in:

- Security lifecycle integration
    
- Preventative engineering
    
- Pipeline automation
    
- Continuous risk management
    
- System-wide consistency
    

This is professional DevSecOps thinking.

---
Back to [[Engineering Foundations - Lesson 40]]

