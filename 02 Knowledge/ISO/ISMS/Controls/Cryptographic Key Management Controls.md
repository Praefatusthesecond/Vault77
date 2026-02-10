---
tags: [ ISO27001, Controls ]
parent:  ISMS Index
---
↑ [[Controls Index]]

# Cryptographic Key Management Controls

## Purpose

The purpose of these controls is to ensure that cryptographic keys are securely managed throughout their entire lifecycle to prevent unauthorized disclosure, misuse, loss, or compromise.

Effective cryptographic key management is essential to maintaining the confidentiality, integrity, authenticity, and availability of encrypted information.

---

## Scope

These controls apply to:

- All cryptographic keys used to protect organizational information
    
- Encryption keys, signing keys, authentication keys, and certificates
    
- Key material used in systems, applications, networks, and backups
    
- On- premises, cloud, and third- party environments
    

---

## Control Reference

- **ISO/IEC 27001:2022 - Annex A 8.25** - Key management
    

(Standard: **ISO/IEC 27001**)

---

## Policy Statement

Cryptographic keys shall be securely generated, stored, distributed, used, rotated, revoked, and destroyed in accordance with defined key management requirements.

Access to cryptographic keys shall be restricted to authorized entities and aligned with the principle of least privilege.

---

## Key Management Principles

The organization shall ensure that:

- Cryptographic keys are protected against unauthorized access and disclosure
    
- Key management responsibilities are clearly defined
    
- Keys are used only for their intended purpose
    
- Key lifetimes are limited and controlled
    
- Compromised or obsolete keys are promptly revoked and replaced
    

---

## Key Lifecycle Management

Cryptographic keys shall be managed throughout the following lifecycle stages:

### Key Generation

- Keys shall be generated using approved cryptographic methods
    
- Key strength and parameters shall meet defined security standards
    
- Key generation shall occur in secure environments
    

---

### Key Storage & Protection

- Keys shall be stored securely using appropriate technical controls
    
- Access to stored keys shall be restricted and logged
    
- Keys shall be protected against:
    
    - Unauthorized access
        
    - Modification
        
    - Loss or destruction
        

---

### Key Distribution

- Key distribution shall be performed securely and in a controlled manner
    
- Keys shall only be distributed to authorized users, systems, or services
    
- Secure channels shall be used for key exchange
    

---

### Key Usage

- Keys shall be used only for approved cryptographic purposes
    
- Separation shall be maintained between different key types (e.g. encryption vs signing)
    
- Keys shall not be reused beyond their intended scope
    

---

### Key Rotation & Renewal

- Cryptographic keys shall be rotated based on:
    
    - Defined validity periods
        
    - Risk assessment
        
    - Cryptographic best practices
        
- Automated rotation mechanisms shall be used where feasible
    

---

### Key Revocation & Compromise Handling

- Keys shall be revoked immediately if:
    
    - Compromise is suspected or confirmed
        
    - Keys are no longer required
        
    - Cryptographic standards change
        
- Compromised keys shall be replaced without undue delay
    
- Key compromise events shall be handled as security incidents
    

---

### Key Destruction

- Keys shall be securely destroyed when no longer required
    
- Destruction methods shall prevent recovery of key material
    
- Key destruction shall be documented where appropriate
    

---

## Access Control & Segregation of Duties

- Access to cryptographic keys shall be restricted to authorized roles
    
- Segregation of duties shall be applied where feasible to prevent misuse
    
- Privileged access to key management systems shall be monitored
    

---

## Roles & Responsibilities

### System & Data Owners

- Define cryptographic key requirements
    
- Ensure keys align with information classification and risk
    

### IT / Operations

- Implement and maintain key management mechanisms
    
- Ensure secure storage, rotation, and revocation of keys
    

### Information Security Function

- Define key management standards and policies
    
- Approve key management practices
    
- Monitor compliance and investigate key- related incidents
    

---

## Third- Party & Cloud Considerations

- Key ownership and management responsibilities shall be clearly defined
    
- Where external services are used:
    
    - Key custody models shall be documented
        
    - Shared responsibility models shall be understood
        
- Third- party key handling practices shall be assessed
    

---

## Monitoring & Compliance

- Key management activities shall be logged where appropriate
    
- Logs shall support auditing and incident investigation
    
- Exceptions to key management requirements shall be documented and approved
    

---

## Review & Maintenance

These controls shall be reviewed periodically to ensure:

- Continued effectiveness of key management practices
    
- Alignment with cryptographic standards and threat landscape
    
- Compliance with legal, regulatory, and contractual obligations
    

---

## Related Controls

-[[Cryptographic Control and Encryption Controls]]
    
- [[Access Control Controls]]
    
- [[Incident Management Controls]]
    
-[[Logging and Monitoring Controls]]
