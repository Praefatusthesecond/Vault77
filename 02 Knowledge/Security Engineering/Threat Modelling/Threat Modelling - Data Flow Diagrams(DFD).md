---
tags: [security, threat-modeling, dfd]
parent: Threat Modelling - Overview
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – Data Flow Diagrams (DFD)

## Purpose

DFDs visually represent:

- System components
- Data movement
- Trust boundaries

Without DFDs, threat modeling becomes guesswork.

---

## Core Elements

| Element | Meaning |
|----------|----------|
| Process | Application, API, CI runner |
| Data Store | Database, S3 bucket |
| Data Flow | API calls, credentials |
| External Entity | User, external service |
| Trust Boundary | Change in privilege/trust |

---

## Example: CI/CD Pipeline

External Entity: Developer  
Process: Git repository  
Process: CI Runner  
Process: Artifact Registry  
Process: Production cluster  
Data Store: Secrets Manager  

Trust boundaries:
- Dev machine → Git
- Git → CI Runner
- CI Runner → Cloud

These boundaries are primary attack surfaces.

---

## Best Practices

- Keep diagrams simple
- Highlight trust boundaries clearly
- Identify authentication flows
- Include data classification levels
