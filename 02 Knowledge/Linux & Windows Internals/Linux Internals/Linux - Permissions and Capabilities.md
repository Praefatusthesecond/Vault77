---
title: Linux - Permissions and Capabilities
aliases: [Linux File Permissions, Linux Capabilities Model]
tags: [linux, security, permissions, access-control, devops]
type: operating-system
domain: linux
related: [Linux - Users and Groups, Linux - File System, Linux - Process Management]
status: draft
---

## 1. Overview

Linux access control is based on two primary mechanisms:

1. **Traditional UNIX permissions (rwx model)**
    
2. **Linux capabilities (fine-grained privilege model)**
    

Understanding both is essential for:

- Secure server hardening
    
- Container security
    
- DevSecOps pipelines
    
- Least privilege enforcement
    

---

# Part 1 — Traditional Linux Permissions

---

## 2. The Basic Permission Model

Each file/directory has:

- Owner (user)
    
- Group
    
- Others
    

Each category can have:

- Read (r)
    
- Write (w)
    
- Execute (x)
    

Example:
```bash
-rwxr-x---
```
Breakdown:

|Section|Meaning|
|---|---|
|-|File type|
|rwx|Owner permissions|
|r-x|Group permissions|
|---|Others permissions|

---

## 3. Numeric (Octal) Representation

Permissions are often written in octal form.

|Permission|Value|
|---|---|
|r|4|
|w|2|
|x|1|

Examples:

|Symbolic|Numeric|
|---|---|
|rwx|7|
|rw-|6|
|r-x|5|
|r--|4|

Example:
```bash
chmod 755 script.sh
```
Means:

- Owner: 7 (rwx)
    
- Group: 5 (r-x)
    
- Others: 5 (r-x)
    

---

## 4. File vs Directory Permissions

Important distinction:

### For Files

- r = read file
    
- w = modify file
    
- x = execute file
    

### For Directories

- r = list contents
    
- w = create/delete files inside
    
- x = enter directory (traverse)
    

You need **execute permission on a directory to access files inside it**.

---

## 5. Changing Ownership
```bash
chown user file  
chown user:group file  
chgrp group file
```
Ownership is critical for service hardening.

Never run services as root unless absolutely required.

---

## 6. Special Permission Bits

There are three special bits:

### 1. SUID (Set User ID)

chmod 4755 file

When executed, runs as file owner.

Common example:

```bash
/usr/bin/passwd
```

Security risk if misused.

---

### 2. SGID (Set Group ID)
```bash
chmod 2755 dir
```
For directories:

- New files inherit group ownership.
    

Useful for shared directories.

---

### 3. Sticky Bit
```bash
chmod 1777 /shared
```
Used on directories.

Users can only delete their own files.

Example:

```bash
/tmp
```
---

# Part 2 — Linux Capabilities

Now we move from 1980s UNIX to modern Linux security.

---

## 7. The Problem with Root

Traditionally:

- UID 0 (root) has ALL privileges.
    
- Everyone else has none.
    

This is binary and dangerous.

Linux introduced **capabilities** to split root privileges into smaller units.

---

## 8. What Are Linux Capabilities?

Capabilities divide root privileges into discrete permissions.

Examples:

- `CAP_NET_BIND_SERVICE` → bind to ports <1024
    
- `CAP_SYS_ADMIN` → broad system admin privileges
    
- `CAP_NET_ADMIN` → network configuration
    
- `CAP_SYS_TIME` → change system clock
    

This allows fine-grained privilege assignment.

---

## 9. Viewing Capabilities

Install tools:
```bash
sudo apt install libcap2-bin
```
Check file capabilities:
```bash
getcap /path/to/file
```
Set capability:
```bash
setcap cap_net_bind_service=+ep /usr/bin/myapp
```
Now `myapp` can bind to port 80 without running as root.

That’s real least privilege.

---

## 10. Capabilities in Containers

Docker and Kubernetes use Linux capabilities heavily.

By default, containers drop many dangerous capabilities.

Example:
```bash
docker run --cap-drop ALL --cap-add NET_BIND_SERVICE nginx
```
This is significantly safer than running privileged containers.

Never use `--privileged` unless you truly understand what you are doing.

---

## 11. Capability Sets

Each process has capability sets:

- Permitted
    
- Effective
    
- Inheritable
    
- Bounding
    
- Ambient
    

Most engineers don’t go this deep — but for hardened environments, this matters.

---

## 12. Permissions vs Capabilities

|Feature|Permissions|Capabilities|
|---|---|---|
|Scope|File-based|Process-based|
|Model|User/Group|Fine-grained privilege|
|Granularity|Coarse|Fine|
|Security Model|Classic UNIX|Modern Linux|

Both work together.

---

## 13. Security Hardening Best Practices

- Avoid 777 permissions
    
- Minimize SUID binaries
    
- Audit with:
    
```bash
find / -perm -4000 2>/dev/null
```
- Avoid running services as root
    
- Use capabilities instead of full root
    
- Drop unnecessary container capabilities
    
- Enforce umask settings
    

---

## 14. Interview-Level Explanation

If asked:

“How does Linux handle permissions?”

Answer:

Linux uses a traditional user/group permission model with read, write, and execute bits. Additionally, modern Linux systems implement capabilities that divide root privileges into fine-grained permissions, allowing least-privilege enforcement at the process level.

Clear. Senior-level. No fluff.

---

## 15. DevSecOps Alignment

In modern infrastructure:

- Containers rely heavily on capability dropping
    
- CI agents must not run as root unnecessarily
    
- File permissions impact secret storage
    
- Kubernetes PodSecurityContexts control capabilities
    

Understanding this prevents privilege escalation vulnerabilities.