---
tags: [windows, internals, active-directory]
type: note
---

# Active Directory Internals

## Core Components

- Domain Controller
- NTDS.dit (database)
- SYSVOL
- DNS

---

## NTDS Database

Location:
`C:\Windows\NTDS\NTDS.dit`

Contains:
- Users
- Groups
- Password hashes
- Object metadata

---

## Replication

Uses:
- Multi-master replication
- AD Sites & Services

Check replication:
```powershell
repadmin /replsummary
```
---
## FSMO Roles

- Schema Master
    
- Domain Naming Master
    
- RID Master
    
- PDC Emulator
    
- Infrastructure Master
    

Check:

```powershell
netdom query fsmo```