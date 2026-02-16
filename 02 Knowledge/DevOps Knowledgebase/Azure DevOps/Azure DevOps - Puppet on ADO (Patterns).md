---
tags: [azure- devops, puppet, configuration- management, cicd]
parent: Azure DevOps
---
Back to  [[Azure DevOps]]]

# Azure DevOps - Puppet on ADO (Patterns)

## What Puppet usually does well (today)
- Enforce desired state continuously (agents)
- Control drift and configuration baselines
- Promote tested code through environments (dev → prod)

## How ADO fits in
Use Pipelines to:
- validate Puppet code (lint/tests)
- package and publish environment code (or control- repo content)
- trigger orchestrated runs (carefully) via Puppet Enterprise orchestration or Bolt (agentless tasks)

## Practical pipeline stages
- `validate`: lint + unit tests (rspec- puppet, etc.)
- `package`: version control- repo release artifact
- `promote`: push to Puppet code manager / r10k (org- dependent)
- `orchestrate`: optional controlled rollout

## “Don’t be that person” rules
- Don’t run ad- hoc Puppet changes from random build agents
- Keep prod rollouts gated (Environment approvals)
- Separate who can edit the pipeline from who can approve prod