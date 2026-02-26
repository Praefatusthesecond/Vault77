---
tags: [security, detection, engineering]
parent: "LDR - Overview"
---
Back to [[LDR - Overview]]

# Detection Engineering

Detection Engineering designs high-quality detection rules.

It answers:
"What attacker behavior can we detect?"

---

## Good Detection Rule

- Based on behavior, not signatures
- Mapped to MITRE ATT&CK
- Low false positives
- Actionable alert

---

## Example

Alert if:
- New admin role created
- Outside business hours
- From unfamiliar IP

---

## Detection Lifecycle

1. Identify threat
2. Map to ATT&CK
3. Write detection logic
4. Test in staging
5. Deploy
6. Tune
