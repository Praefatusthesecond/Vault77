---
tags: [ policy-as-code, concepts, lifecycle, governance ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Policy Lifecycle

Policy as Code follows a lifecycle similar to application code.

## 1. Define
- Identify the requirement (security, compliance, reliability)
- Translate vague statements into objective rules
- Decide scope (cloud, repo, cluster, account)

Example:
- "Resources must be tagged" becomes "Owner and CostCenter tags must exist"

## 2. Implement
- Write policy rules (Rego, Kyverno YAML, Sentinel)
- Store in Git
- Structure by domain and severity

## 3. Test
- Unit tests for policies
- Positive and negative examples
- Prevent regressions

## 4. Enforce
- CI checks (block merges)
- Runtime enforcement (admission control)
- Cloud-native deny policies

## 5. Monitor
- Track violations
- Track exceptions
- Measure false positives

## 6. Iterate
- Adjust rules based on feedback
- Tighten enforcement gradually
- Retire obsolete policies

Key principle:
Policies are products, not documents.
