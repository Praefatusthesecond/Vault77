---
title: ISO 27001 - ISMS Scope
aliases: [ISMS Scope Statement, ISO 27001 Scope Definition]
tags: [iso27001, isms, governance, compliance, risk-management]
type: governance
framework: ISO 27001:2022
related: [ISO 27001 - Risk Register, ISO 27001 - Risk Management, ISO 27001 - Statement of Applicability]
status: draft
---

## 1. Purpose

The ISMS Scope defines:

- The boundaries of the Information Security Management System
    
- The organizational units included
    
- The locations included
    
- The assets included
    
- The technologies included
    
- The services included
    
- Any justified exclusions
    

It is required under:

**ISO 27001:2022 Clause 4.3 — Determining the scope of the ISMS**

Without a clear scope, your ISMS is undefined and non-certifiable.

---

## 2. What the Scope Must Include

According to ISO 27001:2022 Clause 4.3, the scope must consider:

- Internal issues (Clause 4.1)
    
- External issues (Clause 4.1)
    
- Interested parties (Clause 4.2)
    
- Interfaces and dependencies between activities
    
- Justified exclusions
    

The scope must be:

- Documented
    
- Available
    
- Justifiable
    
- Aligned with business reality
    

---

## 3. What the Scope Is Not

The scope is not:

- A marketing description
    
- A vague statement like “All IT operations”
    
- A list of Annex A controls
    
- A risk register summary
    

It is a formal boundary definition.

Auditors will test whether your risk register, SoA, and policies align with the scope.

If they do not → nonconformity.

---

## 4. Scope Components

A strong ISMS scope typically defines:

### 1. Organizational Scope

Which business units are included?

Example:

- IT Operations
    
- Software Development
    
- DevOps Engineering
    

### 2. Physical Scope

Which locations are included?

Example:

- Head office in Amsterdam
    
- Cloud infrastructure in Azure West Europe
    
- Remote workforce devices
    

### 3. Logical Scope

Which systems and services?

Example:

- GitLab
    
- CI/CD pipelines
    
- Azure subscriptions
    
- Windows Server infrastructure
    
- Backup systems
    
- Identity platform
    

### 4. Exclusions

Explicitly list exclusions with justification.

Example:

- Personal employee home networks (outside corporate control)
    

Exclusions must be risk-assessed.

---

## 5. Example Scope Statement (Template)

You can adapt this structure:

> The Information Security Management System (ISMS) covers the information systems, processes, and personnel involved in the development, deployment, and support of software services operated by the organization, including cloud infrastructure, CI/CD pipelines, source code repositories, endpoint devices, and supporting IT systems located at the Amsterdam headquarters and remote work environments.

> The ISMS excludes personal employee networks and non-corporate-managed devices, as they fall outside the organization's direct operational control.

Short. Clear. Auditable.

---

## 6. Relationship to Other ISO Artifacts

The scope drives:

- Risk Register (only risks within scope)
    
- Statement of Applicability (controls applicable to scope)
    
- Internal audits (audit only what is in scope)
    
- Certification boundaries (certificate wording)
    
- Supplier security requirements
    

If something is out of scope, it is not covered by your certification.

Be careful what you exclude.

---

## 7. Strategic Considerations

Narrow Scope:

- Easier certification
    
- Lower audit effort
    
- Lower implementation cost
    
- Less business coverage
    

Broad Scope:

- Stronger security posture
    
- Higher audit effort
    
- Higher maturity
    
- Greater business assurance
    

For DevOps-heavy environments, scoping only IT without development is a red flag.

---

## 8. Common Audit Findings

- Scope too vague
    
- Scope inconsistent with risk register
    
- Scope excludes critical systems without justification
    
- Cloud environments not explicitly mentioned
    
- Remote workers not addressed
    
- Dependencies not documented
    

Auditors check this early.

If the scope is weak, everything downstream collapses.

---

## 9. DevSecOps-Oriented Scope Considerations

In modern environments (like yours), scope should explicitly mention:

- Infrastructure as Code
    
- CI/CD pipelines
    
- Container platforms
    
- Cloud providers
    
- Identity providers
    
- Monitoring systems
    
- Backup infrastructure
    
- Source control systems
    

If these are core to your business, excluding them makes the ISMS meaningless.

---

## 10. Minimal Audit Evidence Required

Auditor will expect:

- Documented scope statement
    
- Evidence it considers internal/external issues
    
- Alignment with risk register
    
- Alignment with SoA
    
- Management approval
    
- Communication of scope internally
    

---

## 11. Governance Best Practice

- Scope reviewed annually
    
- Scope reviewed after major business changes
    
- Scope approved by top management
    
- Version controlled
    
- Linked to risk assessment methodology