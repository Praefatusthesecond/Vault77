---
tags: [windows, internals, services]
type: note
---

# Windows Services & Service Control Manager

SCM (services.exe) manages services.

---

## View Services

```powershell
Get-Service
```
Service config:

```powershell
sc qc servicename
```
## Service States

- Running
    
- Stopped
    
- Paused
    

---

## Service Accounts

Common service accounts:

- LocalSystem
    
- NetworkService
    
- LocalService
    
- Domain account
    

Security impact depends heavily on account used.
