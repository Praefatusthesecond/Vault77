---
tags: [linux, internals, security, selinux, apparmor]
type: note
---

# SELinux & AppArmor

Mandatory Access Control systems.

---

## SELinux

Check status:
```bash
sestatus
```
Modes:

- Enforcing
    
- Permissive
    
- Disabled
    

Temporary disable:

```bash
setenforce 0
```
---

## AppArmor

Check status:

```bash
aa-status
```

Profiles:

```bash
/etc/apparmor.d/
```
---

## Why Not Disable?

Disabling reduces security.  
Better:

- Adjust policy
    
- Diagnose with audit logs