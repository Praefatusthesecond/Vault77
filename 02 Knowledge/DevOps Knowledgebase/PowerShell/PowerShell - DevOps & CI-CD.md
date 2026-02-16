---
tags: [ powershell, devops ]
parent: PowerShell
---

# PowerShell - DevOps & CI/CD

## Common Use Cases

- Silent software installs
- IIS configuration
- Certificate automation
- SQL Server setup
- Windows service configuration
- CI job scripts

---

## Example: Silent Install Pattern

```powershell
Start-Process -FilePath "setup.exe" -ArgumentList "/quiet /norestart" -Wait -PassThru
```

---

## GitLab CI Example

windows_job:
  script:
    - powershell.exe -ExecutionPolicy Bypass -File install.ps1
