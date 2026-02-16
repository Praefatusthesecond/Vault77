---
tags: [security, threat-modeling, foundation]
aliases: [TM Overview]
parent: Security Engineering Index
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – Overview

## What Is Threat Modeling?

Threat modeling is a **structured methodology** used to identify, analyze, and mitigate security threats during system design.

It answers three questions:

1. What are we building?
2. What can go wrong?
3. What are we going to do about it?

Threat modeling is proactive security engineering.

---

## Why It Matters in DevSecOps

DevSecOps automates delivery.  
If architecture is flawed, automation amplifies risk.

Threat modeling enables:

- Secure-by-design architecture
- Early vulnerability detection
- Reduced remediation cost
- Improved compliance posture
- Stronger Zero Trust implementation

---

## Core Concepts

### Assets
Anything valuable:
- Source code
- CI/CD credentials
- Cloud IAM roles
- Customer data
- Infrastructure state

### Threat Actors
- External attackers
- Malicious insiders
- Compromised supply chain
- Rogue CI runner
- Nation-state actors

### Trust Boundaries
Points where trust level changes:
- Internet → Application
- Developer → Git
- CI runner → Production
- Internal network → Cloud

Most attacks happen at trust boundaries.

---

## When To Perform Threat Modeling

- New system design
- Cloud migration
- Introducing CI/CD
- Adding third-party integrations
- Major refactors
- Post-incident reviews

---

## Related Notes

- [[Threat Modeling - Data Flow Diagrams]]
- [[Threat Modeling - STRIDE]]
- [[Threat Modeling - DREAD]]
- [[Threat Modeling - MITRE ATT&CK]]
- [[Threat Modeling - CI/CD Pipelines]]
