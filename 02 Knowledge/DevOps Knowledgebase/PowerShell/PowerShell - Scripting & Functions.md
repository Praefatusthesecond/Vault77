---
tags: [ powershell, scripting, functions ]
---

# PowerShell - Scripting & Functions

Professional PowerShell means writing reusable, structured, testable code.

Not loose scripts.

---

## Script Structure (Production Standard)

```powershell
param(
    [Parameter(Mandatory)]
    [string]$Name,

    [ValidateSet("Dev","Test","Prod")]
    [string]$Environment = "Dev"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

try {
    Write-Verbose "Starting execution"
    
    # Main logic
    
}
catch {
    Write-Error "Failure: $_"
    exit 1
}
```

---

## Functions

```powershell
function Get-Example {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    process {
        Write-Output "Hello $Name"
    }
}
```

---

## Advanced Function Pattern

Use CmdletBinding() to behave like native cmdlets.

Features unlocked:
- -Verbose
- -Debug
- -ErrorAction
- -WhatIf
- -Confirm

---

## Best Practice Rules

- One responsibility per function
- Return objects, not strings
- No Write-Host in production
- Always validate parameters
- Avoid global variables
