---
tags: [ powershell, debugging ]
parent: PowerShell
---

# PowerShell - Error Handling & Debugging

## Try/Catch

```powershell
try {
    Get-Item "C:\NotExist"
}
catch {
    Write-Error "Something failed: $_"
}
```

---

## Common Patterns

- -ErrorAction Stop
- $Error[0]
- Write-Verbose
- Set-StrictMode -Version Latest
