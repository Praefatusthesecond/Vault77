---
tags: [linux, internals, filesystem, storage]
type: note
---

# Filesystems & Storage

## Inodes

Each file has:
- Data blocks
- Inode (metadata)

Check inode usage:
```bash
df -i
```
You can run out of inodes before disk space.

---

## Disk Usage

Check disk:

```bash
df -h du -sh *
```
---

## Mount Points

View mounts:

```bash
mount lsblk
```

Persistent mounts:

```bash
/etc/fstab
```

---

## Common Filesystems

- ext4
    
- xfs
    
- btrfs
    

Check filesystem type:

```bash
lsblk -f
```
---

## LVM Basics

Logical Volume Manager allows:

- Flexible resizing
    
- Snapshotting
    

Commands:

```bash
pvs
vgs
lvs
```

---
tags: [linux, internals, permissions, security]
type: note
---

# Permissions & Capabilities

## Standard Permissions

Format:
rwx r-x r-x


Check:
```bash
ls -l
```
Change:
Change:

`chmod 755 file chown user:group file`

---

## Special Bits

### setuid

Runs as file owner.

```bash
-rwsr-xr-x
```
### setgid

Group inheritance on directories.

### Sticky Bit

Common on /tmp.  
Only owner can delete files.

---

## Linux Capabilities

Fine-grained privileges instead of full root.

Example:

```bash
getcap /usr/bin/ping
```
You may see:

```bash
cap_net_raw=ep
```

View capabilities:

```bash
getcap -r /
```