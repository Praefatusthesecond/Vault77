---
tags: [linux, bash, permissions]
---

# Bash - Permissions

## View permissions

```bash
ls -l
```

## Change permissions
```bash
chmod 755 file
```
## Change ownership
```bash
chown user:group file
```
## Numeric breakdown
```bash
7 = read + write + execute
5 = read + execute
4 = read
```
