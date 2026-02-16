---
tag: [ docker, compose, devops ]
aliases: [ "Docker Compose", "Compose Guide" ]
---

# Docker Compose

## When to use it
- Local dev stacks (app + db + cache)
- Reproducible integration environments
- Simple single-host deployments

## Core concepts
- `services`: containers you run
- `networks`: how services connect (default network created automatically)
- `volumes`: persistent storage
- `depends_on`: startup ordering (not readiness)

## Common commands
- Up: `docker compose up -d`
- Logs: `docker compose logs -f --tail 200`
- Stop: `docker compose stop`
- Down (removes containers/networks): `docker compose down`
- Down + volumes: `docker compose down -v`
- Exec into service: `docker compose exec <svc> sh`

## Practical tips
- Use env files (`.env`) for local overrides.
- Name your volumes explicitly to avoid surprises.
- Add healthchecks for DBs/services where useful.

Related: [[Docker - Networking]] | [[Docker - Volumes and Bind Mounts]] | [[Docker - CI-CD Patterns]]
