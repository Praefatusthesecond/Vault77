---
tag: [ docker, security, devops ]
aliases: [ "Container Security", "Docker Hardening" ]
---

# Docker Security

## Baseline hardening checklist
- Run as non-root (`USER` in Dockerfile)
- Drop Linux capabilities where possible
- Read-only filesystem where possible
- Don’t mount Docker socket into containers unless you *really* mean it
- Use minimal base images and keep them patched
- Avoid secrets in images:
  - no secrets in `ENV`, build args, or committed files
  - use runtime secret injection methods (platform dependent)

## Supply chain basics
- Prefer trusted base images
- Pin versions (tags like `latest` are a footgun)
- Scan images in CI (tool choice depends on your stack)

## Runtime visibility
- Logs and metrics matter; failing silently is still failing

Related: [[Docker - Dockerfile]] | [[Docker - CI-CD Patterns]] | [[Docker - Logging and Monitoring]]
