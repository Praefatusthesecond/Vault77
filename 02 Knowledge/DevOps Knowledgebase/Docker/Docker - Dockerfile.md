---
tag: [ docker, dockerfile, build, devops ]
aliases: [ "Docker Build", "Dockerfile Guide" ]
---

# Dockerfile

## Best practices
- Use small base images when possible (but keep debuggability in mind).
- Pin versions (base images and package installs).
- Leverage layer caching: copy dependency manifests first, then install deps.
- Avoid running as root when possible.
- Prefer multi-stage builds for compiled apps.

## Common directives
- `FROM`, `WORKDIR`, `COPY`, `RUN`, `ENV`, `ARG`, `EXPOSE`, `USER`, `CMD`, `ENTRYPOINT`

## Multi-stage build pattern (concept)
- Stage 1: build artifacts
- Stage 2: minimal runtime image with only required output

## .dockerignore
- Prevent sending junk to build context (node_modules, .git, secrets)
- Reduces build time and risk of leaking sensitive files

Related: [[Docker - Images and Layers]] | [[Docker - Security]] | [[Docker - CI-CD Patterns]]
