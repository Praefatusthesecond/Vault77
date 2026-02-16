---
tags: [ policy-as-code, governance, ownership ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy Ownership and Responsibility

Policy as Code fails most often due to unclear ownership, not bad rules.

## Why ownership matters
- Someone must maintain the policy
- Someone must approve changes
- Someone must handle breakage
- Someone must explain intent to auditors and teams

Without ownership:
- Policies rot
- Exceptions grow uncontrolled
- Teams lose trust

## Ownership roles

### Policy owner
- Defines intent and scope
- Approves changes
- Owns risk decisions
- Usually security, platform, or architecture

### Platform owner
- Owns the system enforcing the policy
- Ensures availability and performance
- Handles operational incidents

### Application teams
- Consume policies
- Request exceptions
- Provide feedback on false positives

## RACI model (example)

| Activity | Security | Platform | App Team |
|--------|---------|----------|----------|
| Write policy | R | A | C |
| Approve change | A | C | I |
| Exception approval | A | C | R |
| Incident handling | C | A | I |

## Golden rule
Policies are products.
They need owners, backlogs, reviews, and versioning.
