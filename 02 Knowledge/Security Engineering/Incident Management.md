---
parent: Security Engineering Index
---

# Incident Management

## Purpose

Incident Management ensures that **information security incidents** are **identified, reported, assessed, contained, resolved, and learned from** in a consistent and controlled manner.

The goal is to **minimise impact**, **restore normal operations**, **preserve evidence**, and **prevent recurrence**.

---

## Scope

This process applies to:

- All employees, contractors, and third parties
    
- All systems, applications, networks, and data
    
- All **information security incidents**, including suspected incidents
    

---

## Definition: What is an Incident?

An **information security incident** is any event that:

- Compromises **confidentiality, integrity, or availability**, or
    
- Indicates a **violation of security policy**, or
    
- Has the **potential** to do either
    

### Examples

- Malware or ransomware detection
    
- Phishing or credential compromise
    
- Unauthorized system or data access
    
- Data leakage or data loss
    
- Denial of service or service outage caused by malicious activity
    
- Lost or stolen devices containing company data
    
- Security misconfigurations exploited or exposed
    

---

## Incident Classification

### Severity Levels

|Severity|Description|
|---|---|
|**Critical**|Major breach, legal/regulatory impact, widespread outage|
|**High**|Confirmed compromise with limited scope|
|**Medium**|Suspicious activity, partial impact|
|**Low**|Minor incident, no confirmed impact|
|**Informational**|Logged event, no action required|

---

## Roles & Responsibilities

### All Personnel

- Report **suspected incidents immediately**
    
- Do **not** attempt to hide or fix incidents silently
    

### Incident Manager

- Coordinates response
    
- Ensures communication and documentation
    
- Decides escalation and closure
    

### Technical Responders

- Contain, investigate, and remediate
    
- Preserve logs and evidence
    

### Management

- Approves major actions
    
- Coordinates legal, HR, or external communication if needed
    

---

## Incident Lifecycle

### 1. Identification

Incidents may be identified via:

- Monitoring and alerting
    
- User reports
    
- Third-party notifications
    
- Audit findings
    

> **Rule:** If in doubt — treat it as an incident.

---

### 2. Reporting

Incidents must be reported via:

- Ticketing system (preferred)
    
- Dedicated incident channel or mailbox
    
- Escalation to the Incident Manager
    

Minimum information:

- Time and date
    
- Reporter
    
- Affected system(s)
    
- Description of observed behavior
    

---

### 3. Assessment & Triage

Determine:

- Severity and impact
    
- Scope (systems, data, users)
    
- Whether escalation is required
    

---

### 4. Containment

Actions may include:

- Isolating affected systems
    
- Disabling accounts
    
- Blocking network access
    
- Preserving logs and evidence
    

> **Important:** Avoid actions that destroy forensic evidence unless necessary.

---

### 5. Eradication & Recovery

- Remove malicious artifacts
    
- Patch vulnerabilities
    
- Restore systems from clean backups
    
- Validate system integrity before returning to production
    

---

### 6. Communication & Escalation

Depending on severity:

- Internal stakeholders notified
    
- Legal / compliance consulted
    
- Customers or regulators informed (if required)
    

All communication must be **coordinated** — no ad-hoc messaging.

---

### 7. Closure & Post-Incident Review

Every incident must result in:

- Root cause analysis
    
- Lessons learned
    
- Preventive actions
    
- Documentation updates
    

---

## Evidence Handling

- Logs, screenshots, memory dumps, and files must be preserved
    
- Access to evidence is restricted
    
- Chain of custody must be maintained where applicable
    

---

## Metrics & Monitoring

Incident Management effectiveness is monitored via:

- Number of incidents by severity
    
- Mean time to detect (MTTD)
    
- Mean time to resolve (MTTR)
    
- Recurrence rates
    

---

## Training & Awareness

- Staff are trained to recognize and report incidents
    
- Regular tabletop or response exercises may be conducted
    

---

## Related Notes

- [[Logging and Monitoring Controls]]
    
- [[ISO27001 - Risk Management Explained]]
    
- [[Business Continuity Controls]]
    
- [[Backup Controls]]
    
- [[Data Protection Controls]]
    
- [[Third-Party Supplier Security Controls]]
    
- [[Change Management Controls]]
    

---

## ISO 27001 Mapping

Supports:

- Incident identification and response
    
- Continuous improvement
    
- Legal and regulatory compliance

---