---
tags: [azure- devops, checklist, decision- tree, cicd]
parent: Azure DevOps
---
↑ [[Azure DevOps]]]

# Azure DevOps - Decision Trees & Checklists

## Do we need multiple repos?
- Different products/teams/security boundary → yes
- Just “because folders feel messy” → no

## Do we need multiple pipelines?
- Different deploy cadence/tooling → yes
- Same lifecycle, same tooling → templates + one pipeline is fine

## Terraform flow (default)
- PR: plan only
- main: apply
- prod: approval required

## Repo hardening checklist
- [ ] Branch policies enabled on main
- [ ] PR build validation required
- [ ] No direct pushes to main
- [ ] CODE owners / path reviewers for high- risk areas
- [ ] Secrets not stored as long- lived creds (prefer OIDC)