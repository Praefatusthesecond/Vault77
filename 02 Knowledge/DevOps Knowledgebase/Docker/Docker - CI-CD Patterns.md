---
tag: [ docker, cicd, devops ]
aliases: [ "Docker in CI", "Container Build Pipeline" ]
---

# Docker CI/CD Patterns

## Common pipeline steps
- Lint + test
- Build image
- Tag with:
  - commit SHA
  - semver (on releases)
- Push to registry
- Deploy using:
  - Compose (single host)
  - Kubernetes (clusters)
  - Platform-specific runners

## Tagging strategy (simple, effective)
- `app:<git-sha>`
- `app:<version>`
- optionally `app:latest` only for “current stable” (not for build reproducibility)

## Build speed tips
- Use caching where your CI supports it
- Multi-stage builds
- Keep build context small (.dockerignore)

Related: [[Docker - Registries]] | [[Docker - Dockerfile]] | [[GitLab CI]] | [[Azure DevOps]]
