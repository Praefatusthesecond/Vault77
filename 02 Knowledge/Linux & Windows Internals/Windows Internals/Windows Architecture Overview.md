---
tags: [windows, internals, architecture]
type: note
---

# Windows Architecture Overview

Windows uses a hybrid kernel architecture.

---

## User Mode vs Kernel Mode

User Mode:
- Applications
- Limited privileges
- Cannot directly access hardware

Kernel Mode:
- ntoskrnl.exe
- Drivers
- Full hardware access

---

## Core Components

- Executive
- Kernel
- HAL
- Device Drivers
- Win32 Subsystem

---

## Important Processes

- smss.exe (Session Manager)
- csrss.exe (Client Server Runtime)
- winlogon.exe
- services.exe
- lsass.exe

Understanding LSASS is critical for security analysis.