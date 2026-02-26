---
tags: [security, threat-modeling, mitre]
parent: Threat Modelling - Overview
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – MITRE ATT&CK

MITRE ATT&CK is a knowledge base of real-world attacker techniques.

Organized by tactics:

- Initial Access
- Execution
- Persistence
- Privilege Escalation
- Credential Access
- Lateral Movement
- Exfiltration

---

## Why It Matters

STRIDE shows categories.  
MITRE shows real attacker behavior.

Example:

CI runner compromise → Credential dumping → Lateral movement → Cloud control plane abuse.

---

## Usage

- Map threats to ATT&CK techniques
- Design detection rules
- Improve SOC visibility
