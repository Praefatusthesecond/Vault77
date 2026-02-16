---
tags: [security, threat-modeling, risk]
parent: Threat Modelling - Overview
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – DREAD

DREAD is a risk-scoring model.

| Factor | Description |
|--------|------------|
| Damage | Impact severity |
| Reproducibility | Ease of repeat attack |
| Exploitability | Skill required |
| Affected Users | Scope |
| Discoverability | Ease of finding |

Score each 1–10 → average.

---

## Example

Threat: CI runner credential leakage

Damage: 9  
Reproducibility: 8  
Exploitability: 7  
Affected Users: 9  
Discoverability: 6  

Average: 7.8 → High Risk

---

## Purpose

- Prioritize mitigations
- Avoid over-engineering low-impact risks
- Support risk acceptance decisions
