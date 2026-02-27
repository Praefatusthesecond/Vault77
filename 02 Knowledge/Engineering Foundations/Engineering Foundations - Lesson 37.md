---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 5
---
Back to [[Engineering Foundations - Index]]

## Encryption Fundamentals – At Rest & In Transit

This lesson builds on:

- CIA Triad
    
- Authentication & Authorization
    
- Threat Modeling
    
- Trust Boundaries
    
- Distributed Systems
    

We now answer:

> How do we protect data from being read or altered by unauthorized parties?

---

## 1. Core Concept

Encryption is:

> The process of transforming data into an unreadable format that can only be reversed with the correct key.

There are two primary contexts:
```text
Encryption in Transit  
Encryption at Rest
```
Both protect confidentiality.  
Some mechanisms also protect integrity.

---

## 2. Encryption In Transit

Encryption in transit protects data:

> While it is moving across a network.

Example:
```text
User → API → Payment Service → Database
```
Without encryption:  
Anyone intercepting network traffic can read data.

With encryption:  
Captured traffic is unreadable.

---

### TLS (Transport Layer Security)

TLS is the standard for encrypting network communication.

Common example:

HTTPS = HTTP + TLS

TLS provides:

- Confidentiality
    
- Integrity (via message authentication)
    
- Server authentication
    
- Optional client authentication
    

TLS protects trust boundaries.

---

## 3. Why Transit Encryption Matters in Distributed Systems

Microservices communicate frequently.

Each service-to-service call crosses a trust boundary.

Without encryption:

- Internal attackers
    
- Compromised hosts
    
- Misconfigured networks
    

Can read or tamper with traffic.

Even “internal networks” are not automatically safe.

Zero-trust mindset applies.

---

## 4. Encryption At Rest

Encryption at rest protects data:

> While stored on disk.

Examples:

- Database files
    
- Backups
    
- Object storage
    
- Logs
    
- Snapshots
    

If storage is stolen or exposed:

Encrypted data remains protected.

---

### Common At-Rest Mechanisms

- Full-disk encryption
    
- Database-level encryption
    
- Encrypted cloud storage (e.g., managed key services)
    

Encryption at rest reduces impact of storage compromise.

---

## 5. Symmetric vs Asymmetric Encryption

Two primary encryption models:
```text
Symmetric Encryption  
Asymmetric Encryption
```
---

### Symmetric Encryption

- Same key encrypts and decrypts.
    
- Fast and efficient.
    
- Used for bulk data encryption.
    

Example:  
AES (Advanced Encryption Standard)

---

### Asymmetric Encryption

- Public key encrypts.
    
- Private key decrypts.
    
- Slower but solves key exchange problem.
    

Example:  
RSA, ECC

TLS uses asymmetric encryption to establish a secure symmetric session.

---

## 6. Integrity vs Confidentiality

Encryption ensures confidentiality.

Integrity ensures data is not modified undetected.

Mechanisms include:

- Cryptographic hashes
    
- Message Authentication Codes (MAC)
    
- Digital signatures
    

TLS provides both confidentiality and integrity.

---

## 7. Key Management (Critical Risk Area)

Encryption is only as strong as key protection.

Key risks:

- Hardcoded keys in source code
    
- Exposed secrets in logs
    
- Shared keys across services
    
- Poor rotation practices
    

Good key management includes:

- Secure storage (e.g., secret managers)
    
- Regular rotation
    
- Access control
    
- Audit logging
    

Compromised keys invalidate encryption.

---

## 8. Real-World Scenario

E-commerce platform.

Confidentiality:

- HTTPS for all user communication.
    
- TLS for service-to-service calls.
    
- Encrypted database storage.
    

Integrity:

- Signed tokens.
    
- Hash-based password storage.
    
- Input validation.
    

Availability:

- Proper certificate management.
    
- Avoid expired certificates.
    
- Avoid misconfigured encryption causing outages.
    

Security must not break reliability.

---

## 9. Encryption & Performance Trade-Off

Encryption adds:

- CPU overhead
    
- Latency overhead
    
- Complexity in certificate management
    

Trade-offs exist.

But modern hardware makes encryption cheap relative to risk.

Disabling encryption for performance is almost never justified.

---

## 10. Applied Scenario

Your API sends payment information to a third-party service.

Questions:

- Is TLS enforced?
    
- Are certificates validated?
    
- Are internal calls encrypted?
    
- Are API keys stored securely?
    
- Are logs redacting sensitive fields?
    

Threat modeling meets encryption practice.

---

## 11. Mini Exercise

Imagine:

Your cloud storage bucket is accidentally made public.

If data is encrypted at rest:

- What is protected?
    
- What is not protected?
    

Now imagine encryption keys are stored in same bucket.

What happens?

Think about key management risk.

---

## 12. Self-Test

Answer without scrolling:

1. What is encryption?
    
2. What is the difference between encryption in transit and at rest?
    
3. What is symmetric encryption?
    
4. What is asymmetric encryption?
    
5. Why is key management critical?
    
6. Why is encryption not enough by itself?
    

---

## 13. Connection to Previous Lessons

- Threat modeling identifies sensitive assets.
    
- Trust boundaries require transit encryption.
    
- Authentication protects identity.
    
- Authorization protects access.
    
- Observability must avoid logging secrets.
    
- Incident response handles certificate leaks.
    
- Change management affects key rotation.
    
- Availability can be impacted by certificate expiration.
    

Encryption protects confidentiality.  
Key management protects encryption.

---

## 14. Difficulty Calibration

You are now thinking about:

- Data flow protection
    
- Key lifecycle management
    
- Cryptographic guarantees
    
- Trust boundary enforcement
    
- Security-performance trade-offs
    

This is foundational security engineering.

---

Back to  [[Engineering Foundations - Lesson 36]]