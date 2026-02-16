---
type: notes
topic: git
tags: [git, cicd, devops]
status: evergreen
created: 2026-02-04
parent: Git Overview
---
Back to [[Git - Overview]]

# Git CI/CD Integration Notes

## Practical rules
- CI should run on PRs and on main
- Enforce formatting/lint/test in CI, not “tribal knowledge”
- Avoid “works on my machine” by pinning tool versions

## Versioning patterns
- Tag releases: `v1.2.3`
- CI builds can use:
  - commit SHA
  - date + short SHA
  - semantic version from tags

## Common CI pitfalls
- Shallow clones: `fetch- depth` too low breaks versioning- by- tags
- Submodules: require explicit setup
- LFS: needs additional fetch

## GitLab- specific notes (if relevant)
- Prefer protected branches
- Use `CODEOWNERS` for critical paths (e.g., infra, CI templates)
