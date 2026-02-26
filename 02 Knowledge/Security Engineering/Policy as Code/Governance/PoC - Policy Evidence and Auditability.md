---
tags: [ policy-as-code, governance, audit, compliance ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Policy Evidence and Auditability

Policy as Code is only valuable to auditors if it produces evidence.

## Evidence sources
- Git history of policies
- CI logs showing policy execution
- Admission controller logs
- Exception records
- Compliance reports

## What auditors care about
- Who approved the policy
- When it was enforced
- What was blocked or allowed
- Why exceptions exist
- Proof of continuous enforcement

## Evidence best practices
- Store policies in Git
- Log all policy decisions
- Retain CI artifacts
- Version exception files
- Link exceptions to tickets

## Mapping to compliance
Policy as Code supports:
- ISO 27001 preventive controls
- SOC 2 change management
- NIS2 technical safeguards

Policies turn intent into provable behavior.
