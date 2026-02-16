---
tags: [ policy-as-code, governance, maturity-model ]
aliases: [ PoC Maturity Model ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy as Code Maturity Model

This model describes how organizations evolve in Policy as Code adoption.

---

## Level 0 - Documented intent

### Characteristics
- Policies exist as documents
- Enforcement is manual
- Audits rely on screenshots and interviews

### Risks
- Drift is guaranteed
- No real enforcement
- No evidence

---

## Level 1 - Ad hoc checks

### Characteristics
- Linting and static checks
- Inconsistent enforcement
- Policies differ per team

### Benefits
- Early feedback
- Low friction

### Gaps
- No central ownership
- No runtime enforcement
- No audit trail

---

## Level 2 - Centralized CI enforcement

### Characteristics
- Policies stored in Git
- CI blocks non-compliant changes
- Shared rule sets

### Benefits
- Shift-left governance
- Repeatable enforcement
- Clear failure reasons

### Risks
- CI outages can block delivery
- Runtime drift still possible

This is where most mature teams should start.

---

## Level 3 - Runtime enforcement

### Characteristics
- Admission control in Kubernetes
- Cloud-native deny policies
- Exceptions are codified

### Benefits
- Strong guarantees
- Drift is reduced
- High confidence enforcement

### Risks
- Blast radius is real
- Poor rollout can cause outages

Requires:
- Ownership
- Rollout strategies
- Kill switches

---

## Level 4 - Continuous compliance

### Characteristics
- Prevent, detect, and enforce
- Drift detection and remediation
- Compliance dashboards
- Audit evidence is automatic

### Benefits
- Real-time compliance
- Low audit overhead
- High trust in controls

### This level requires
- Mature platform teams
- Strong observability
- Clear governance

---

## Anti-patterns

- Jumping straight to Level 3
- Enforcing without tests
- No exception mechanism
- No ownership model

---

## Key insight
Maturity is not about strictness.
It is about confidence.
