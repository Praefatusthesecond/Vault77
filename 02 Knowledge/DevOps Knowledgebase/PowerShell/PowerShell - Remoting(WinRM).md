---
tags: [ powershell, remoting ]
---

# PowerShell - Remoting (WinRM)

PowerShell Remoting allows command execution on remote machines.

Used heavily in:
- Server management
- Domain administration
- CI/CD deployment

---

## Enable Remoting

Enable-PSRemoting -Force

---

## Enter Remote Session

Enter-PSSession -ComputerName SERVER01

---

## Run Command Remotely

```powershell
Invoke-Command -ComputerName SERVER01 -ScriptBlock {
    Get-Service
}
```

---

## Use Credentials

`$cred = Get-Credential`

```powershell
Invoke-Command -ComputerName SERVER01 -Credential $cred -ScriptBlock {
    hostname
}
```

---

## Security Notes

- Uses WinRM (HTTP/HTTPS)
- Kerberos for domain authentication
- Should use HTTPS in production
- Configure TrustedHosts carefully

---

## Related

- [[Active Directory]]
- [[Windows Server]]
- [[Ansible - Windows]]
