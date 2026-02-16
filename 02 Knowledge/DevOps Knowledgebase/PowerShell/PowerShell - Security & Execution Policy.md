---
tags: [ powershell, security ]
parent: PowerShell
---

# Execution Policies

Get-ExecutionPolicy -List

Types:
- Restricted
- RemoteSigned
- AllSigned
- Bypass
- Unrestricted

Best practice:
Use RemoteSigned for servers.
