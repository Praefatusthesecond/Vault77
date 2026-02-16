---
tags: [ policy-as-code, aws, iam, cloud ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# AWS IAM Policy as Code

IAM policies are already code, but often unmanaged.

## Policy as Code problems it solves
- Sprawl of inline policies
- Over-permissive wildcards
- Manual console changes

## Best practices
- Manage IAM via Terraform or CloudFormation
- Validate policies in CI
- Block dangerous patterns:
  - "*:*"
  - Unscoped AssumeRole
  - Public resource policies

## Tools
- OPA + Conftest on Terraform plans
- Static analyzers (complementary)
- SCPs for org-wide guardrails

IAM PaC is about least privilege at scale.
