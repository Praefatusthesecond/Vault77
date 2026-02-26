---
tags: [linux, internals, logging]
type: note
---

# Logging & Journald

Modern systems use journald.

---

## journalctl

View logs:
```bash
journalctl
```
By service:

```bash
journalctl -u nginx
```

Today only:

```bash
journalctl --since today
```

Previous boot:

```bash
journalctl -b -1
```

---

## Traditional Logs

Directory:

```bash
/var/log/
```

Examples:

- syslog
    
- auth.log
    
- kern.log
    

---

## Troubleshooting Pattern

1. systemctl status
    
2. journalctl -u service
    
3. journalctl -xe
    
4. dmesg