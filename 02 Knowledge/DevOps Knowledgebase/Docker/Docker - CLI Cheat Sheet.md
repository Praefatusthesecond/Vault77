---
tag: [ docker, cli, cheatsheet, devops ]
aliases: [ "Docker Commands", "Docker CLI" ]
---

# Docker CLI Cheat Sheet

## Containers
- List: `docker ps` (running), `docker ps -a` (all)
- Start/stop: `docker start <name>` / `docker stop <name>`
- Remove: `docker rm <name>` (add `-f` to force)
- Logs: `docker logs -f --tail 200 <name>`
- Shell: `docker exec -it <name> sh` (or `bash` if present)
- Inspect: `docker inspect <name>`
- Stats: `docker stats`

## Images
- List: `docker images`
- Pull: `docker pull repo:tag`
- Remove: `docker rmi <image>`
- Build: `docker build -t myapp:dev .`
- History/layers: `docker history <image>`

## Networks
- List: `docker network ls`
- Inspect: `docker network inspect <net>`
- Create: `docker network create <net>`

## Volumes
- List: `docker volume ls`
- Inspect: `docker volume inspect <vol>`
- Create: `docker volume create <vol>`

## Cleanup (use with care)
- Containers/images/networks not used: `docker system prune`
- Aggressive (includes unused images): `docker system prune -a`
- Volumes too: `docker system prune --volumes`

See also: [[Docker - Troubleshooting]] | [[Docker - Volumes and Bind Mounts]]
