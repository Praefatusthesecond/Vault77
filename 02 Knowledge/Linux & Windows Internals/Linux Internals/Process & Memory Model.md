---
tags: [linux, internals, processes, memory]
type: note
---

# Process & Memory Model

## Everything Is a Process

In Linux, everything runs as a process.

View processes:
```bash
ps aux
top
htop
```

Tree view:

```bash
pstree -p
```

---

## Process States

Common states:

- R - Running
    
- S - Sleeping (interruptible)
    
- D - Uninterruptible sleep (usually IO)
    
- Z - Zombie
    
- T - Stopped
    

Zombie processes:

- Process finished execution
    
- Parent has not read exit status
    

---

## Signals

List signals:

```bash
kill -l
```

Common signals:

- SIGTERM (15) - Graceful stop
    
- SIGKILL (9) - Forced stop
    
- SIGINT (2) - Ctrl+C
    
- SIGHUP (1) - Reload configuration
    

Send signal:

```bash
kill -15 <pid> kill -9 <pid>
```
---

## Memory Overview

Check memory:

```bash
free -h
```

Linux uses memory for:

- Applications
    
- Buffers
    
- Cache
    

Important:  
Cached memory is reclaimable.

---

## OOM Killer

If system runs out of memory:

- Kernel invokes OOM killer
    
- Selects and kills a process
    

Check:

```bash
dmesg | grep -i oom journalctl -k | grep -i oom
```
---

## /proc Interface

Live process information:

```bash
cat /proc/meminfo cat /proc/cpuinfo cat /proc/<PID>/status
```
This is a virtual filesystem exposing kernel state.