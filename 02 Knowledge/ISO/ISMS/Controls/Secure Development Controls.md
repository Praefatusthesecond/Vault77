---
tags: [ ISO27001, Controls ]
parent:  ISMS Index
---
Back to  [[Controls Index]]

# Secure Development Controls

## Purpose

The purpose of these controls is to ensure that information security is integrated into the design, development, testing, and maintenance of systems and applications, reducing the risk of vulnerabilities and security weaknesses.

Secure development controls help ensure that systems are built and changed securely by design and by default.

---

## Scope

These controls apply to:

- All software development and system engineering activities
    
- Internally developed and externally sourced software
    
- Applications, services, APIs, scripts, and infrastructure- as- code
    
- Development, test, staging, and production environments
    
- Developers, testers, DevOps engineers, and third parties
    

---

## Control References

- **ISO/IEC 27001:2022 - Annex A 8.27** - Secure system architecture and engineering principles
    
- **ISO/IEC 27001:2022 - Annex A 8.28** - Secure coding
    
- **ISO/IEC 27001:2022 - Annex A 8.29** - Security testing in development and acceptance
    
- **ISO/IEC 27001:2022 - Annex A 8.30** - Outsourced development
    
- **ISO/IEC 27001:2022 - Annex A 8.31** - Separation of development, test, and production environments
    

(Standard: **ISO/IEC 27001**)

---

## Policy Statement

Security requirements shall be identified, implemented, and validated throughout the system and software development lifecycle (SDLC).

Development activities shall follow secure design and coding practices to prevent the introduction of vulnerabilities and security weaknesses.

---

## Secure Development Principles

The organization shall ensure that:

- Security is considered from design through deployment
    
- Secure- by- design and secure- by- default principles are applied
    
- Development activities are aligned with risk management outcomes
    
- Responsibilities for secure development are clearly defined
    

---

## Secure Architecture & Design

- Security requirements shall be defined during system design
    
- Threats and risks shall be considered during architecture design
    
- Design decisions shall consider:
    
    - Least privilege
        
    - Defense in depth
        
    - Segregation of duties
        
    - Trust boundaries
        

---

## Secure Coding Practices

- Secure coding standards shall be defined and followed
    
- Developers shall be trained in secure coding principles
    
- Common vulnerabilities (e.g. injection, authentication flaws) shall be avoided
    
- Use of insecure or deprecated libraries shall be restricted
    

---

## Development Environment Security

- Development, test, and production environments shall be separated
    
- Access to each environment shall be restricted and authorized
    
- Production data shall not be used in non- production environments unless properly protected
    

---

## Security Testing

Security testing shall be integrated into development processes and may include:

- Static application security testing (SAST)
    
- Dynamic application security testing (DAST)
    
- Dependency and vulnerability scanning
    
- Manual security testing where appropriate
    

Security testing results shall be reviewed and addressed prior to release.

---

## Change & Release Management

- Changes to systems and code shall follow formal change management procedures
    
- Releases shall be approved prior to deployment
    
- Rollback or recovery procedures shall be defined
    

---

## Handling of Secrets & Credentials

- Secrets shall not be hard- coded in source code
    
- Secure storage mechanisms shall be used for credentials and keys
    
- Access to secrets shall be restricted and monitored
    

---

## Outsourced Development

- Security requirements shall be defined for outsourced development
    
- Third- party development activities shall be monitored and reviewed
    
- Delivered code shall be subject to security review and testing
    

---

## Logging & Error Handling

- Applications shall implement appropriate logging for security- relevant events
    
- Error handling shall avoid exposing sensitive information
    
- Logs shall support monitoring and incident investigation
    

---

## Roles & Responsibilities

### Developers

- Follow secure coding and development standards
    
- Address security findings and vulnerabilities
    

### DevOps / Engineering

- Implement secure build, test, and deployment pipelines
    
- Protect development tools and environments
    

### Information Security Function

- Define secure development requirements
    
- Support threat modeling and security reviews
    
- Monitor compliance and improvement
    

### Management

- Ensure resources and training for secure development
    
- Support integration of security into development processes
    

---

## Monitoring & Compliance

- Secure development practices shall be monitored for effectiveness
    
- Deviations or vulnerabilities shall be addressed through corrective actions
    
- Metrics may be used to track secure development maturity
    

---

## Review & Maintenance

These controls shall be reviewed periodically to ensure:

- Continued alignment with threat landscape and technologies
    
- Effectiveness of secure development practices
    
- Integration with change, incident, and risk management processes
    

---

## Related Controls

-[[Change Management Controls]]
    
-[[Access Control Controls]]
    
- [[Cryptographic Key Management Controls]]
    
- [[Logging and Monitoring Controls]]
    
- [[Incident management controls]]
