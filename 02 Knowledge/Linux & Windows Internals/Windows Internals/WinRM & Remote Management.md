---
tags: [windows, internals, winrm, remote-management]
type: note
---

# WinRM & Remote Management

WinRM enables remote PowerShell execution.

---

## Check Status

```powershell
winrm quickconfig
```

---
## Common Ports

- 5985 (HTTP)
    
- 5986 (HTTPS)
    

---

## Trusted Hosts

```powershell
Get-Item WSMan:\localhost\Client\TrustedHosts
```

---

## Security Considerations

- Prefer HTTPS
    
- Use Kerberos where possible
    
- Avoid basic auth