---
tag: [ docker, registry, devops ]
aliases: [ "Docker Registry", "Container Registry" ]
---

# Registries

## What a registry does
- Stores images and metadata (tags, digests)
- Enables pull/push across machines and environments

## Typical registries
- Docker Hub
- GitHub Container Registry (GHCR)
- GitLab Container Registry
- Cloud registries (ECR/ACR/GCR)

## Operational notes
- Prefer immutable digests for deployment where possible
- Apply retention policies (images accumulate fast)
- Access control matters (read vs write separation)

Related: [[Docker - CI-CD Patterns]] | [[Docker - Security]]
