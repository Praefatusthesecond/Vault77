---
tag: [ docker, troubleshooting, devops ]
aliases: [ "Docker Debugging" ]
---

# Docker Troubleshooting

## First 60 seconds checklist
1. Is it running? `docker ps`
2. Logs: `docker logs -f --tail 200 <container>`
3. Inspect config: `docker inspect <container>`
4. Exec inside: `docker exec -it <container> sh`
5. Resources: `docker stats`

## Common problems
### Container exits immediately
- CMD/ENTRYPOINT finishes
- App crashes (check logs)
- Missing env vars/config

### Port works on host but not elsewhere
- App bound to `127.0.0.1` inside container instead of `0.0.0.0`
- Wrong published port / firewall

### Disk usage exploded
- Check:
  - `docker system df`
- Cleanup:
  - `docker system prune` (careful)
  - `docker system prune -a` (more careful)

### Volume permission issues
- UID/GID mismatch between container user and volume files
- Consider setting ownership at runtime (entrypoint) or matching IDs

Related: [[Docker - CLI Cheat Sheet]] | [[Docker - Networking]] | [[Docker - Volumes and Bind Mounts]]
