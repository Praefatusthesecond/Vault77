---
tags: [ ISO27001, Controls ]
parent:  ISMS Index
---
↑ [[Controls Index]]

# Backup Controls

## Purpose

The purpose of this control is to ensure that information and other associated assets can be restored in a timely and reliable manner following incidents such as data loss, corruption, system failure, or cyber events.

Effective backup controls support business continuity, disaster recovery, and the protection of information availability and integrity.

---

## Scope

This control applies to:

- All information assets requiring protection against loss or corruption
    
- All systems, applications, databases, and platforms processing organizational information
    
- Backup data, storage media, and backup infrastructure
    
- On- premises, cloud, and third- party hosted environments
    

---

## Control Reference

- **ISO/IEC 27001:2022 - Annex A 8.13** - Information backup
    

(Standard: **ISO/IEC 27001**)

---

## Policy Statement

Backup copies of information, software, and system configurations shall be created, protected, tested, and maintained in accordance with defined backup requirements to ensure availability and recoverability.

Backup measures shall be proportionate to the business criticality and classification of the information.

---

## Backup Requirements

- Backup requirements shall be defined based on:
    
    - Business impact
        
    - Information classification
        
    - Legal and regulatory obligations
        
- Backup frequency, retention, and recovery objectives shall be documented
    
- Critical systems and data shall have clearly defined:
    
    - Recovery Point Objectives (RPO)
        
    - Recovery Time Objectives (RTO)
        

---

## Backup Scope & Coverage

Backups may include, where applicable:

- Business data and databases
    
- Application data and configurations
    
- System configurations and infrastructure definitions
    
- Security- relevant information (where permitted)
    

---

## Backup Execution

- Backups shall be performed according to a documented schedule
    
- Backup processes shall be automated where feasible
    
- Backup success and failures shall be monitored and addressed
    
- Backup jobs shall be logged for audit and troubleshooting purposes
    

---

## Backup Storage & Protection

- Backup data shall be protected against:
    
    - Unauthorized access
        
    - Alteration
        
    - Loss or destruction
        
- Backups shall be stored:
    
    - In physically and logically secure locations
        
    - Separately from primary systems where appropriate
        
- Encryption shall be used where required by classification or risk assessment
    

---

## Off- Site & Resilient Backups

- Off- site or geographically separated backups shall be used where appropriate
    
- Backup designs should consider protection against:
    
    - Ransomware
        
    - Accidental deletion
        
    - Single points of failure
        

---

## Backup Retention & Disposal

- Backup retention periods shall be defined and documented
    
- Retention shall consider:
    
    - Business requirements
        
    - Legal and regulatory obligations
        
- Expired backups shall be securely deleted or destroyed
    

---

## Backup Restoration & Testing

- Backup restoration procedures shall be documented
    
- Backups shall be tested at planned intervals to verify:
    
    - Data integrity
        
    - Recoverability
        
- Test results shall be reviewed and issues addressed
    

---

## Roles & Responsibilities

### System & Data Owners

- Define backup and recovery requirements
    
- Ensure backup coverage aligns with business needs
    

### IT / Operations

- Implement and maintain backup solutions
    
- Monitor backup jobs and storage
    
- Perform restoration tests
    

### Information Security Function

- Define backup control requirements
    
- Ensure alignment with risk assessments and classification
    
- Review backup practices for compliance
    

---

## Compliance & Enforcement

Failure to comply with backup control requirements may result in:

- Increased risk of data loss
    
- Service disruption
    
- Disciplinary or contractual consequences
    

---

## Review & Maintenance

This control shall be reviewed periodically to ensure:

- Backup coverage remains adequate
    
- Retention periods remain appropriate
    
- Alignment with business continuity and disaster recovery requirements
    

---

## Related Controls

- [[Asset Management Controls]]
    
- [[Information Classification and Handling Controls]]
    
- [[Access Control Controls]]
    
- [[Business Continuity Controls]]
    
- [[Incident Management Controls]]