---
tags: [ powershell, patterns ]
---

# PowerShell - Real-World Patterns

Patterns you will reuse constantly.

---

## Silent Install Pattern

```powershell
Start-Process -FilePath "installer.exe" `
    -ArgumentList "/quiet /norestart" `
    -Wait `
    -PassThru
```

---

## Service Check Pattern

```powershell
$service = Get-Service -Name "Spooler"

if ($service.Status -ne "Running") {
    Start-Service -Name "Spooler"
}
```

---

## Idempotent File Creation

```powershell
if (-not (Test-Path "C:\Temp\example.txt")) {
    New-Item -Path "C:\Temp\example.txt"
}
```

---

## Secure Password Handling

```powershell
$secure = ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force
```

---

## CI/CD Execution Pattern

```powershell
powershell.exe -ExecutionPolicy Bypass -File deploy.ps1 -Verbose
```
---

## AD Bulk Creation Pattern

```powershell
Import-Csv users.csv | ForEach-Object {
    New-ADUser -Name $_.Name -SamAccountName $_.Sam
}
```

---

## Related

- [[PowerShell - DevOps & CI/CD]]
- [[PowerShell - AD Automation]]
- [[Active Directory]]
