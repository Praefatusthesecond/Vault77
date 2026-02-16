---
tags: [ policy-as-code, concepts, compliance ]
aliases: [ Preventive vs Detective ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy Types - Prevent, Detect, Enforce

## Prevent (shift-left)
Block merges / deployments when policy fails.
- Conftest on Terraform plan, Helm templates, K8s YAML
- tfsec/checkov style checks (adjacent, not always “policy engines”)

## Detect (continuous compliance)
Find violations after the fact.
- CSPM scans, cloud config rules, periodic OPA evaluation on inventories
- Alerts + tickets + dashboards

## Enforce (runtime)
Stop non-compliant changes at the door.
- Kubernetes admission (Gatekeeper / Kyverno)
- Cloud-native enforcement (Azure Policy deny, SCP guardrails where applicable)

## Practical approach
1) Start with **Prevent** in CI (fast wins)  
2) Add **Detect** for drift/legacy  
3) Use **Enforce** selectively (high confidence, low false positives)