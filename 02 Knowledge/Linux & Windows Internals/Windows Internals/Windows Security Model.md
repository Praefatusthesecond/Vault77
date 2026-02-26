---
tags: [windows, internals, security]
type: note
---

# Windows Security Model

## Security Identifier (SID)

Each object and user has a SID.

View current user SID:
```powershell
whoami /user
```
---
## Access Tokens

Created at login.  
Contain:

- SID
    
- Group SIDs
    
- Privileges
    

---

## Privileges

Examples:

- SeDebugPrivilege
    
- SeBackupPrivilege
    
- SeImpersonatePrivilege
    

Check privileges:

```powershell
whoami /priv
```
---

## UAC

User Account Control:

- Limits privilege escalation
    
- Requires elevation for admin tasks