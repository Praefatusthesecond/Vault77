---
tags: [ policy-as-code, governance, risk, failure ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy Failure Modes

Every policy system will fail eventually.
Design for it.

## Common failure modes

### CI pipeline lockout
- Policy engine unavailable
- Network failure
- Misconfigured rule blocks all merges

### Kubernetes admission outage
- Admission controller crash
- Latency spikes
- Bad rule denies critical workloads

### False positives
- Overly strict rules
- Missing context
- Poor exception handling

### Drift between environments
- Policies enforced in prod but not dev
- Different versions across clusters

## Mitigations
- Kill switches
- Break-glass procedures
- Time-limited bypass
- Separate audit and enforce paths
- Alerting on policy engine health

## Golden rule
Fail open only with visibility.
Fail closed only with confidence.
