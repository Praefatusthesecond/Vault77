---
tags: [azure- devops, git, governance, secure- by- default]
parent: Azure DevOps
---
↑ [[Azure DevOps]]]

# Azure DevOps - Repos (Git) Best Practices

## Branching (simple, scalable)
**Trunk- based** (recommended default):
- `main` protected
- short- lived feature branches
- PR into `main`
- release by tags or release branches only if needed

## Branch policies for `main`
Enable policies to enforce quality and change control, e.g.:
- Minimum reviewers
- Required comment resolution
- Linked work item requirement (optional, org- dependent)
- Build validation (pipeline must pass)
- Restrict direct pushes to `main` :contentReference[oaicite:8]{index=8}

## PR hygiene
- Small PRs, descriptive titles, clear “why”
- Require at least 1-2 reviewers depending on risk
- Use CODEOWNERS- like reviewer assignment via “Automatically include reviewers” (path- based reviewers)

## Repo structure suggestions (infra- as- code)
- `/infra/terraform/...`
- `/infra/puppet/...`
- `/pipelines/...` (YAML templates)
- `/docs/...`

## Anti- patterns
- Long- lived branches that become mini- forks
- Direct commits to `main`
- “One mega pipeline” that nobody dares to touch
