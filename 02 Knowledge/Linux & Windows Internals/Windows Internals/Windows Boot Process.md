---
tags: [windows, internals, boot]
type: note
---

# Windows Boot Process

## High-Level Flow

UEFI/BIOS -> Windows Boot Manager -> winload.efi -> ntoskrnl.exe -> Services & Session Manager

---

## Boot Manager

- File: \EFI\Microsoft\Boot\bootmgfw.efi
- Reads Boot Configuration Data (BCD)

View BCD:
```powershell
bcdedit
```
---
## Windows Loader (winload.efi)

- Loads kernel (ntoskrnl.exe)
    
- Loads HAL (Hardware Abstraction Layer)
    
- Loads boot drivers
    

---

## Kernel Initialization

- ntoskrnl.exe starts
    
- Initializes memory manager
    
- Starts Session Manager (smss.exe)
    

---

## Troubleshooting

Boot logs:

```powershell
Get-WinEvent -LogName System | Where-Object {$_.Id -eq 1001}
```
Recovery options:

- Advanced Startup
    
- Safe Mode
    
- WinRE