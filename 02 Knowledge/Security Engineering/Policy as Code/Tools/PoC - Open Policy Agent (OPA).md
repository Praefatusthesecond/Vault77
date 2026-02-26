---
tags: [ policy-as-code, opa, tools ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Open Policy Agent (OPA)

OPA is a general-purpose policy engine. You feed it data (JSON/YAML), it evaluates rules, returns allow/deny + reasons.

## Where OPA shows up
- CI: evaluate Terraform plans, K8s YAML, API specs
- Kubernetes: Gatekeeper uses OPA/Rego for admission control
- Services: embed OPA sidecar for authorization decisions (advanced)

## Strengths
- Very flexible; works with “anything as JSON”
- Strong ecosystem (Conftest, Gatekeeper)
- Policies can be tested like code

## Weak spots
- Rego learning curve
- Badly designed rules can become hard to maintain (solve with structure + tests)

See also: 
- [[PoC - Rego Language]] 
- [[PoC - Conftest]]
- [[PoC - Gatekeeper]]