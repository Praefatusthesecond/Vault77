---
tags: [windows, internals, logging, etw]
type: note
---

# Event Logging & ETW

## Windows Event Logs

Common logs:
- Application
- System
- Security

View:
```powershell
Get-WinEvent -LogName Security -MaxEvents 10
```
---
## mportant Security Event IDs

- 4624 - Successful logon
    
- 4625 - Failed logon
    
- 4672 - Special privileges assigned
    
- 4688 - Process created
    

---

## ETW (Event Tracing for Windows)

High-performance tracing system used by:

- Defender
    
- Sysmon
    
- Performance tools
    

Advanced monitoring relies heavily on ETW.