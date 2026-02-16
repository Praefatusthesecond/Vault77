---
tags: [ powershell, modules ]
---

# PowerShell - Modules & Packaging

Modules allow reusable automation libraries.

---

## Module Structure

```text
MyModule/
 ├── MyModule.psm1
 ├── MyModule.psd1
 └── Public/
      └── Get-Something.ps1
```
---

## Create Module Manifest

```powershell
New-ModuleManifest -Path .\MyModule.psd1
```

---

## Import Module

```powershell
Import-Module MyModule
```

---

## Export Functions

In .psm1:

```powershell
Export-ModuleMember -Function Get-Something
```

---

## Internal vs Public Functions

Public → exported
Private → internal helpers

---

## When to Build a Module

- Used in multiple projects
- Used in CI pipelines
- Shared across servers
- Requires versioning

---

## Related

- [[GitLab CI]]
- [[Azure DevOps]]
- [[PowerShell - DevOps & CI/CD]]
