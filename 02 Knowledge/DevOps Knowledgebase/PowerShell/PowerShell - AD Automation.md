---
tags: [ powershell, active-directory ]
parent: PowerShell
---

# PowerShell - AD Automation

Requires RSAT module:

```powershell
Import-Module ActiveDirectory
```

---

## Create OU

```powershell
New-ADOrganizationalUnit -Name "Test-Users" -Path "DC=lab,DC=local"
```

## Create User

```powershell
New-ADUser `
  -Name "John Doe" `
  -GivenName "John" `
  -Surname "Doe" `
  -SamAccountName "jdoe" `
  -UserPrincipalName "jdoe@lab.local" `
  -Path "OU=Test-Users,DC=lab,DC=local" `
  -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
  -Enabled $true
```
