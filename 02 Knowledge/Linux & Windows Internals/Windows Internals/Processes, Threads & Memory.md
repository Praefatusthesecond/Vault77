---
tags: [windows, internals, processes, memory]
type: note
---

# Processes, Threads & Memory

## Processes

List processes:
```powershell
Get-Process
```
Each process contains:

- Threads
    
- Virtual address space
    
- Security token
    
- Handles
    

---

## Threads

- Smallest execution unit
    
- Scheduled by kernel
    

---

## Virtual Memory

Windows uses:

- Virtual address space
    
- Page file (pagefile.sys)
    

Check memory:

```powershell
Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize,FreePhysicalMemory
```
---

## Handles

Processes use handles for:

- Files
    
- Registry
    
- Network
    
- Events
    

Tool:

- Sysinternals Process Explorer