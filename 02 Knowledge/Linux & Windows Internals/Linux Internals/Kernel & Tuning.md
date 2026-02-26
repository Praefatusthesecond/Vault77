---
tags: [linux, internals, kernel, performance]
type: note
---

# Kernel & Tuning

## Kernel Version

Check:
```bash
uname -r
```
---
## Kernel Parameters

View:

```bash
sysctl -a
```

Temporary change:

```
sysctl -w net.ipv4.ip_forward=1
```
Persistent:  
Edit:

```bash
/etc/sysctl.conf
```
Reload:

```bash
sysctl -p
```

---

## Load Average

Check:

```bash
uptime
```

Represents runnable processes.

---

## Performance Tools

Basic:

```bash
top htop vmstat iostat
```

Advanced:

- strace
    
- perf
    
- eBPF