---
tags: [ powershell, performance ]
---

# PowerShell - Performance & Best Practices

Good PowerShell scales. Bad PowerShell melts servers.

---

## Avoid

- Nested pipelines in loops
- Write-Host in logic
- Repeated AD queries
- Loading entire large datasets

---

## Prefer

- Filtering at source
- Strong typing
- Bulk operations
- Caching results

---

## Example Optimization

Bad:

```powershell
Get-ADUser -Filter * | Where-Object { $_.Enabled -eq $true }
```

Better:

```powershell
Get-ADUser -Filter { Enabled -eq $true }
```

---

## Use Measure-Command

```powershell
Measure-Command {
    # code
}
```

---

## Logging Pattern

```powershell
Start-Transcript -Path "C:\logs\script.log"

Stop-Transcript
```

---

## Professional Guidelines

- Idempotent scripts
- Fail fast
- Log everything
- Never assume state
- Always validate input
