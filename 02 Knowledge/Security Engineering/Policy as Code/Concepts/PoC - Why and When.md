---
tags: [ policy-as-code, concepts, governance, security ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy - Why and When

## Policy vs controls vs implementation
- **Policy**: the requirement (what/why)  
  Example: “All cloud resources must be tagged with Owner and CostCenter.”
- **Control**: the mechanism to ensure it happens (how we verify/enforce)
- **Implementation**: the technical rule (code) that checks/enforces

## When PaC is the right hammer
- You have repeatable rules that can be evaluated objectively
- You want enforcement early (CI) and/or at runtime (admission)
- You need auditable evidence: who changed a rule, when, why

## When PaC is *not* enough
- Requirements are subjective (e.g. “reasonable”, “appropriate”)
- You need process controls (approvals, risk acceptance)
- You need detective controls from logs/telemetry (still can be “as code”, but different tools)

## Good starting candidates
- Tagging/labels, naming standards
- No public buckets, no 0.0.0.0/0 inbound except approved
- Encryption at rest and in transit
- K8s: no privileged pods, require resource limits, no hostPath

