---
tag: [ docker, storage, volumes, devops ]
aliases: [ "Docker Storage", "Volumes" ]
---

# Volumes and Bind Mounts

## Use cases
- Volumes: databases, app state, persistent configs
- Bind mounts: local dev (live reload), sharing config files from host

## Differences
- Volume:
  - Managed by Docker
  - Portable across containers
  - Safer default for persistence
- Bind mount:
  - Direct host path mapping
  - Easy to accidentally expose sensitive host paths
  - Host filesystem permissions matter a lot

## Quick examples
- Volume: `-v mydata:/var/lib/app`
- Bind: `-v /host/path:/container/path`

Related: [[Docker - Security]] | [[Docker - Troubleshooting]]
