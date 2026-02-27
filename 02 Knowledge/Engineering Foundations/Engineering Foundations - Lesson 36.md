---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Authentication vs Authorization

This lesson builds on:

- CIA Triad
    
- Threat Modeling
    
- Trust Boundaries
    
- Distributed Systems Architecture
    

We now answer:

> Who are you?  
> And what are you allowed to do?

These are two different questions.

---

## 1. Core Concept

Authentication and authorization are separate security functions:

Authentication → Identity verification  
Authorization  → Permission enforcement

First prove who you are.  
Then determine what you can access.

---

## 2. Authentication (AuthN)

Authentication answers:

> Are you really who you claim to be?

Examples:

- Username + password
    
- Multi-factor authentication (MFA)
    
- OAuth login
    
- Biometric verification
    
- API keys
    
- Client certificates
    

Authentication establishes identity.

It does not grant permissions.

---

### Authentication Risks

- Stolen credentials
    
- Weak passwords
    
- Credential stuffing
    
- Phishing
    
- Session hijacking
    
- Token replay attacks
    

Authentication must be robust.

---

## 3. Authorization (AuthZ)

Authorization answers:

> What are you allowed to do?

Examples:

- Regular user vs admin
    
- Access to certain APIs
    
- Permission to delete data
    
- Access to specific tenant data
    

Authorization enforces policy.

It depends on identity.

---

### Authorization Risks

- Privilege escalation
    
- Broken access control
    
- Missing permission checks
    
- Overly broad roles
    
- Insecure direct object references (IDOR)
    

Authorization failures are among the most common security flaws.

---

## 4. Visual Model – Request Flow
```text
User → Authentication → Identity established  
      ↓  
Authorization check → Access granted or denied  
      ↓  
Business logic executes
```
Both steps must succeed.

Skipping authorization checks is dangerous.

---

## 5. Example – Admin Dashboard

User logs in (authentication successful).

Now:

If application does not verify role before showing admin panel:

Any authenticated user could gain admin access.

Authentication without authorization is insecure.

---

## 6. Distributed Systems Considerations

In microservices architecture:

- Authentication may happen at API gateway.
    
- Authorization may happen in each service.
    
- Tokens may be passed downstream.
    

Trust boundaries multiply.

Services must not blindly trust upstream services.

Zero-trust principles apply.

---

## 7. Token-Based Authentication

Common modern pattern:

- User authenticates once.
    
- Server issues signed token (e.g., JWT).
    
- Token included in subsequent requests.
    
- Services verify token signature and claims.
    

Key security properties:

- Token integrity (signature)
    
- Expiration
    
- Scope/claims validation
    

Tokens simplify distributed identity — but increase blast radius if compromised.

---

## 8. Least Privilege Principle

Authorization should follow:

> Grant only the minimum permissions necessary.

Benefits:

- Reduces damage if account compromised.
    
- Limits blast radius.
    
- Simplifies auditing.
    

Over-permissioning is common and dangerous.

---

## 9. Real-World Scenario

Checkout service:

Authentication ensures:  
User identity verified.

Authorization ensures:

- User can only access their own orders.
    
- Regular users cannot modify prices.
    
- Only admins can issue refunds.
    

Both layers protect integrity.

---

## 10. Multi-Tenant Systems

In SaaS platforms:

Tenant A must never access Tenant B’s data.

Authorization must enforce tenant isolation.

This is a common breach vector.

Distributed systems must propagate tenant identity correctly.

---

## 11. Applied Scenario

Design an API:

POST /orders/{orderId}/cancel

Questions:

- How do you authenticate caller?
    
- How do you ensure they own that order?
    
- How do you prevent admin-only fields from being modified?
    
- Where is authorization logic enforced?
    

Think in layers.

---

## 12. Mini Exercise

Imagine:

A service checks authentication but forgets to check authorization.

What types of attacks become possible?

Now imagine:

Authorization rules exist but token signature validation is skipped.

What risk appears?

---

## 13. Self-Test

Answer without scrolling:

1. What is authentication?
    
2. What is authorization?
    
3. Why must they be separated?
    
4. What is least privilege?
    
5. Why is broken access control common?
    

---

## 14. Connection to Previous Lessons

- Threat modeling identifies identity risks.
    
- Trust boundaries multiply in distributed systems.
    
- Observability helps detect abnormal access.
    
- Incident response handles compromised accounts.
    
- Change management affects permission models.
    
- Availability can be impacted by auth failures.
    
- Risk modeling prioritizes identity controls.
    

Authentication verifies identity.  
Authorization enforces policy.

Together they protect integrity and confidentiality.

---

## 15. Difficulty Calibration

You are now thinking in:

- Identity flow
    
- Permission enforcement
    
- Token propagation
    
- Multi-service trust boundaries
    
- Least privilege design
    

This is foundational security architecture thinking.

---

Back to [[Engineering Foundations - Lesson 35]]