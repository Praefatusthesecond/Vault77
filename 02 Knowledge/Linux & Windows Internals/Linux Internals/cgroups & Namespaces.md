---
tags: [linux, internals, containers, cgroups, namespaces]
type: note
---

# cgroups & Namespaces

Containers rely on these kernel features.

---

## Namespaces

Isolate:
- PID
- Network
- Mount
- UTS
- User
- IPC

Check namespaces:
```bash
lsns
```
## cgroups

Control resource usage:

- CPU
    
- Memory
    
- IO
    

Location:

```bash
/sys/fs/cgroup/
```

View:

```bash
systemd-cgls
```

---

## Why It Matters

Docker and Kubernetes are built on:

- Namespaces for isolation
    
- cgroups for resource control