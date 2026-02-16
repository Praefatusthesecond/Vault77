---
tags: [security, logging, architecture]
---
Back to [[LDR - Overview]]

# Log Architecture Patterns

## Centralized Logging

All logs sent to:
- SIEM
- Log aggregator

Benefits:
- Unified visibility
- Easier correlation

---

## Secure Log Pipeline

Source → Forwarder → Aggregator → SIEM → Archive

---

## Requirements

- Encryption in transit
- Role-based log access
- Retention policy
- Integrity validation
