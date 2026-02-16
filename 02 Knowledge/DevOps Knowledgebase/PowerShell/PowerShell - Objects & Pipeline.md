---
tags: [ powershell, pipeline ]
parent: PowerShell
---

# PowerShell - Objects & Pipeline

Example:

```powershell
Get-Service | Where-Object { $_.Status -eq "Running" }
```

Pipeline flow:
1. Get-Service outputs ServiceController objects
2. Where-Object filters those objects

Inspect object:

Get-Service | Get-Member

### Key Concepts

- $_ → Current pipeline object
    
- Select-Object → Projection
    
- Where-Object → Filtering
    
- Sort-Object → Sorting
    
- ForEach-Object → Iteration
