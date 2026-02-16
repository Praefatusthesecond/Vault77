---
tag: [ docker, installation, devops ]
aliases: [ "Install Docker", "Docker Engine Install" ]
---

# Docker Installation

## Linux (Docker Engine)
Checklist:
- Use official repos for your distro
- Ensure your user can run docker without sudo (optional)
- Enable and start docker service

Common post-install:
- Add user to docker group (log out/in after):
  - `sudo usermod -aG docker $USER`
- Verify:
  - `docker version`
  - `docker run --rm hello-world`

## Windows/macOS
- Use Docker Desktop (includes VM backend + CLI)
- Consider WSL2 integration on Windows for Linux containers

## Gotchas
- Proxies: set daemon + CLI proxy envs (common in corp networks)
- Disk usage grows fast: plan pruning strategy (see [[Docker - Troubleshooting]])

Related: [[Docker - Troubleshooting]] | [[Docker - Security]]
