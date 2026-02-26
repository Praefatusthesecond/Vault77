---
title: ISO 27001 - Risk Register
aliases: [ISO Risk Register, ISMS Risk Log]
tags: [iso27001, isms, risk-management, governance, compliance]
type: governance
framework: ISO 27001:2022
related: [ISO 27001 - Risk Management, ISO 27001 - Statement of Applicability, ISO 27001 - Controls]
status: draft
---

## 1. Purpose

The Risk Register is the **central log of identified information security risks** within the ISMS scope.

It documents:

- Identified risks
    
- Risk owners
    
- Risk levels
    
- Treatment decisions
    
- Control implementation status
    

It is required evidence under:

- ISO 27001:2022 Clause 6.1 (Actions to address risks and opportunities)
    
- ISO 27001:2022 Clause 8 (Operational planning and control)
    

Think of it as:

> “The living battlefield map of your security posture.”

---

## 2. Risk Management Context (ISO Alignment)

ISO requires:

1. Defined risk assessment methodology
    
2. Defined risk acceptance criteria
    
3. Consistent evaluation
    
4. Traceability to controls (Annex A)
    
5. Periodic review
    

Your register must support all five.

---

## 3. Risk Register Structure

A proper ISO-aligned risk register includes:

|Field|Description|
|---|---|
|Risk ID|Unique identifier (R-001)|
|Asset|System / Data / Process at risk|
|Threat|What could happen|
|Vulnerability|Why it could happen|
|Impact|Business consequence|
|Likelihood|Probability score|
|Impact Score|Severity score|
|Risk Level|Calculated (L × I)|
|Risk Owner|Responsible person|
|Treatment Option|Mitigate / Transfer / Avoid / Accept|
|Controls Applied|Annex A reference|
|Residual Risk|Risk after treatment|
|Status|Open / Mitigated / Accepted|

---

## 4. Risk Scoring Model (Example)

You must define your own methodology. Example:

### Likelihood Scale

|Score|Description|
|---|---|
|1|Rare|
|2|Unlikely|
|3|Possible|
|4|Likely|
|5|Almost Certain|

### Impact Scale

|Score|Description|
|---|---|
|1|Negligible|
|2|Minor|
|3|Moderate|
|4|Major|
|5|Critical|

### Risk Calculation

Risk Score = Likelihood × Impact

|Score Range|Classification|
|---|---|
|1–5|Low|
|6–12|Medium|
|15–25|High|

Acceptance criteria must be documented separately.

---

## 5. Example Risk Entry

|Field|Example|
|---|---|
|Risk ID|R-007|
|Asset|GitLab Server|
|Threat|Unauthorized access|
|Vulnerability|Weak MFA enforcement|
|Impact|Source code exposure|
|Likelihood|3|
|Impact Score|5|
|Risk Level|15 (High)|
|Risk Owner|DevOps Lead|
|Treatment|Mitigate|
|Controls Applied|A.5.17 Authentication information|
|Residual Risk|6 (Medium)|
|Status|Mitigated|

---

## 6. Risk Treatment Options

ISO recognizes four:

### 1. Mitigate

Implement security controls.

### 2. Transfer

Cyber insurance, outsourcing, contractual transfer.

### 3. Avoid

Stop the risky activity.

### 4. Accept

Formal documented approval from risk owner.

⚠️ Accepted risks must be signed off.

---

## 7. Relationship to Other ISO Artifacts

Risk Register feeds into:

- Statement of Applicability (SoA)
    
- Control Implementation Plan
    
- Internal Audit Planning
    
- Management Review
    
- Continuous Improvement (PDCA)
    

Without this linkage, auditors will ask uncomfortable questions.

---

## 8. Review & Maintenance

Best practice:

- Quarterly review
    
- After major infrastructure change
    
- After security incident
    
- After audit findings
    

Document:

- Date reviewed
    
- Reviewer
    
- Changes made
    

---

## 9. Storage & Tooling

Common implementations:

- Excel (small orgs)
    
- SharePoint list
    
- GRC tool
    
- Jira risk board
    
- Markdown table in Git (DevSecOps-native approach)
    

If version-controlled in Git:

- Tag major review milestones
    
- Require PR approval for risk acceptance changes
    

Very DevOps of you.

---

## 10. Minimal Required Evidence for Audit

An auditor will expect to see:

- Documented risk methodology
    
- Defined acceptance criteria
    
- Risk register with current entries
    
- Link between risks and Annex A controls
    
- Evidence of review
    
- Signed risk acceptance decisions
    

If any of these are missing, you’ll get a nonconformity.

---

## 11. DevSecOps Alignment Notes (Your Context)

Given your automation-heavy setup (GitLab, Ansible, Windows runners, etc.), your register should explicitly include:

- CI/CD pipeline risks
    
- Infrastructure as Code drift
    
- Privileged access misuse
    
- Backup integrity failure
    
- Supply chain risks
    
- Logging and detection gaps
    

This is where you differentiate from checkbox-ISO companies.