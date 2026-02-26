---
tags: [linux, internals, boot]
type: note
---

# Boot Process

## High-level flow

BIOS/UEFI -> Bootloader (GRUB) -> Kernel -> init/systemd (PID 1) -> Services/Targets

## BIOS vs UEFI
- UEFI largely replaced BIOS on modern systems
- Supports Secure Boot and an EFI system partition

## Bootloader (GRUB)
- Loads the Linux kernel and initramfs
- Common config file location: `/boot/grub/grub.cfg`

Useful commands:
```bash
cat /proc/cmdline
ls -lah /boot
```
## Kernel startup

- Initializes hardware and drivers
    
- Mounts the root filesystem (often via initramfs)
    
- Starts PID 1 (usually systemd)
    

Check kernel version:

```bash
uname -r
```

## init and systemd (PID 1)

- PID 1 is special: it adopts orphaned processes and manages services
    
- On most modern distros, PID 1 is `systemd`
    

Verify:

```bash
ps -p 1 -o pid,comm,args
```
## Troubleshooting boot

- View last boot logs:
    

```bash
journalctl -b
```
- Previous boot:
    

```bash
journalctl -b -1
```

- Kernel ring buffer:
    

```bash
dmesg -T | less
```