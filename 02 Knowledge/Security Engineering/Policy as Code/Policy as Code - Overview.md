---
parent: Knowledge Index
tags: [ policy-as-code, devops, security, governance ]
aliases: [ PaC, Policy as Code ]
---
Back to [[Knowledge Index]]

# Policy as Code

Policy as Code (PaC) = expressing governance and security requirements in **machine-evaluable rules** that run automatically in CI/CD and/or at runtime.

## Why it exists
- Prevent misconfigurations before they ship (shift-left)
- Reduce “security-by-document” drift
- Make controls testable, reviewable, versioned (Git)
- Enable consistent enforcement across teams and clouds

## Where it runs
- **Pre-commit / local**: fast feedback (lint, unit tests)
- **CI**: validate IaC and manifests, block merges
- **Admission control**: enforce at runtime (Kubernetes)
- **Continuous compliance**: detect drift + alert/auto-remediate

## Core concepts
- [[PoC - Why and When]]
- [[PoC - Types - Prevent Detect Enforce]]
- [[PoC - Lifecycle]]
- [[PoC - Testing Policies]]
- [[PoC - Exceptions and Waivers]]

## Tooling map
- OPA stack: 
	- [[PoC - Open Policy Agent (OPA)]]
	- [[PoC - Rego Language]] 
	- [[PoC - Conftest]] 
	- [[PoC - Gatekeeper]]
- Kubernetes-native: [[PoC - Kyverno]]
- CI/CD platform-specific: [[PoC - Hashicorp Sentinel]]
- Cloud-native:
	- [[PoC - AWS IAM Policy as Code]]
	- [[PoC - Azure Policy as Code]]
- IaC guardrails: [[PoC - Terraform - Policy Guardrails]]

## Patterns
- [[PoC - CI Policy Checks]]
- [[PoC - Kubernetes Admission Control]]
- [[PoC - Drift and Continuous Compliance]]

## Dataview dashboards
### All PaC notes
```dataview
LIST
FROM #policy-as-code 
SORT file.name ASC
```

### Tool Notes

```dataview
LIST
FROM "02 Knowledge/Security Engineering/Policy as Code/Tools"
SORT file.name ASC
```


