---
tag: [ docker, concepts, devops ]
aliases: [ "Container Concepts", "Docker Fundamentals" ]
---

# Docker Concepts

## Mental model (fast)
- **Image**: immutable template (layers) used to create containers.
- **Container**: runtime instance of an image (process + filesystem changes).
- **Registry**: image store (Docker Hub, GHCR, GitLab Registry, ECR, ACR).
- **Engine/Daemon**: runs containers (Linux: `dockerd`; Desktop wraps this).
- **Build context**: files sent to the builder (`docker build .` sends `.`).

## “Containers are not VMs”
- Containers share the host kernel.
- Isolation comes from Linux namespaces + cgroups.
- Lightweight startup, but also “you break the host, you break everything”.

## Storage
- **Writable layer**: container-specific; disappears when container is removed.
- **Volumes**: managed, persistent storage (preferred).
- **Bind mounts**: host paths into containers (great for dev; dangerous in prod).

## Networking
- Default `bridge` network: containers get private IPs, NAT out.
- User-defined bridge: DNS by container/service name (recommended).
- Host networking: container shares host network stack (use carefully).

## Why this matters operationally
- Debugging is mostly: logs + inspect + exec + resource usage.
- Security is mostly: least privilege + minimal images + patched bases.

Next: [[Docker - CLI Cheat Sheet]] | [[Docker - Security]] | [[Docker - Troubleshooting]]
