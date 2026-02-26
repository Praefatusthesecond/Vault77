---
tags: [windows, internals, networking]
type: note
---

# Windows Networking Stack

## View Configuration

```powershell
ipconfig /all
Get-NetIPAddress
```
---
## Routes

```powershell
route print Get-NetRoute
```
---

## Open Ports

```powershell
netstat -ano Get-NetTCPConnection
```
---

## DNS

Flush cache:

```powershell
ipconfig /flushdns
```

Test:

```Powershell
Resolve-DnsName google.com
```