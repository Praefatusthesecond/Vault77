---
tags: [security, threat-modeling, stride]
parent: Threat Modelling - Overview
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – STRIDE

STRIDE is a structured threat classification model.

| Letter | Threat Type |
|--------|------------|
| S | Spoofing |
| T | Tampering |
| R | Repudiation |
| I | Information Disclosure |
| D | Denial of Service |
| E | Elevation of Privilege |

---

## Applying STRIDE

Example: Kubernetes API Server

Spoofing → Fake service account token  
Tampering → Modify etcd  
Repudiation → No audit logging  
Information Disclosure → Exposed secrets  
Denial of Service → API overload  
Elevation → Privileged container breakout  

---

## Benefits

- Systematic analysis
- Prevents blind spots
- Works well with DFDs

---

## Recommended Usage

For each component in your DFD:
- Apply STRIDE categories
- Document threats
- Map to mitigations
