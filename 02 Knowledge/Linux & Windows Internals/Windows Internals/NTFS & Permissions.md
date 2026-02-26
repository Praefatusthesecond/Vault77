---
tags: [windows, internals, ntfs, permissions]
type: note
---

# NTFS & Permissions

## NTFS Basics

Each file has:
- Owner
- DACL
- SACL

---

## View Permissions

```powershell
icacls C:\Folder
```
---
## Permission Types

- Full Control
    
- Modify
    
- Read & Execute
    
- List Folder
    
- Read
    
- Write
    

---

## Inheritance

Permissions inherit unless blocked.

Check:

```powershell
Get-Acl C:\Folder
```
---

## Effective Permissions

Effective access depends on:

- Group membership
    
- Deny rules
    
- Inheritance
