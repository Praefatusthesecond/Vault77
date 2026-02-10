---
tags: [ ISO27001, Controls ]
parent:  ISMS Index
---
↑ [[Controls Index]]

# Cryptographic & Encryption Controls

## Purpose

The purpose of these controls is to ensure that cryptographic measures are used appropriately and effectively to protect the confidentiality, integrity, authenticity, and availability of information.

Cryptographic and encryption controls reduce the risk of unauthorized disclosure, tampering, and compromise of sensitive information.

---

## Scope

These controls apply to:

- All information assets requiring cryptographic protection
    
- All systems, applications, networks, and services processing protected information
    
- Cryptographic keys, certificates, and authentication secrets
    
- On- premises, cloud, and third- party environments
    

---

## Control References

- **ISO/IEC 27001:2022 - Annex A 8.24** - Use of cryptography
    
- **ISO/IEC 27001:2022 - Annex A 8.25** - Key management
    

(Standard: **ISO/IEC 27001**)

---

## Policy Statement

Cryptographic controls shall be implemented to protect information in accordance with business requirements, risk assessments, and information classification.

Cryptographic keys and related materials shall be securely generated, stored, distributed, used, rotated, and revoked throughout their lifecycle.

---

## Cryptographic Principles

The organization shall ensure that:

- Cryptographic controls are selected based on risk and data sensitivity
    
- Industry- accepted algorithms and protocols are used
    
- Cryptographic implementations are consistent and centrally governed
    
- Weak, deprecated, or broken cryptographic mechanisms are avoided
    

---

## Use of Encryption

Encryption shall be applied where appropriate to protect information:

### Data at Rest

- Sensitive information stored on systems, databases, backups, or removable media shall be encrypted where required
    
- Full- disk, file- level, or database encryption may be used depending on risk and architecture
    

### Data in Transit

- Sensitive information transmitted over networks shall be protected using secure communication protocols
    
- Encryption shall be used to protect data crossing untrusted or public networks
    

### Data in Use (where applicable)

- Additional protections may be applied for highly sensitive data processed in memory or shared environments
    

---

## Cryptographic Standards & Algorithms

- Approved cryptographic algorithms, key lengths, and protocols shall be defined and maintained
    
- Cryptographic standards shall be reviewed periodically to address emerging threats and deprecations
    
- Custom or proprietary cryptographic algorithms are prohibited unless formally approved
    

---

## Key Management

Cryptographic keys shall be managed throughout their lifecycle, including:

- Secure key generation
    
- Secure key storage and protection
    
- Controlled key distribution
    
- Defined key usage purposes
    
- Key rotation and renewal
    
- Key revocation and destruction
    

Key management practices shall prevent unauthorized access, loss, or misuse of keys.

---

## Protection of Cryptographic Material

- Cryptographic keys and secrets shall be protected against disclosure, modification, and loss
    
- Access to keys shall be restricted based on least privilege
    
- Where appropriate, hardware- based protections or managed key services shall be used
    

---

## Roles & Responsibilities

### System & Data Owners

- Determine cryptographic protection requirements
    
- Ensure encryption aligns with classification and risk
    

### IT / Operations

- Implement approved cryptographic solutions
    
- Maintain encryption configurations and key management systems
    

### Information Security Function

- Define cryptographic standards and requirements
    
- Approve cryptographic mechanisms
    
- Monitor compliance and review cryptographic risks
    

---

## Third- Party & Cloud Considerations

- Cryptographic requirements shall be considered when using third- party services
    
- Responsibilities for encryption and key management shall be clearly defined
    
- Encryption controls provided by external services shall be assessed for suitability
    

---

## Monitoring & Compliance

- Cryptographic implementations shall be monitored for compliance with standards
    
- Exceptions shall be documented, approved, and reviewed
    
- Failures or weaknesses in cryptographic controls shall be treated as security incidents where applicable
    

---

## Review & Maintenance

These controls shall be reviewed periodically to ensure:

- Continued effectiveness of cryptographic protections
    
- Alignment with evolving threats and best practices
    
- Compliance with legal, regulatory, and contractual requirements
    

---

## Related Controls

- [[Information Classification and Handling Controls]]
    
- [[Access Control Controls]]
    
- [[Backup Controls]]
    
- [[Logging and Monitoring Controls]]