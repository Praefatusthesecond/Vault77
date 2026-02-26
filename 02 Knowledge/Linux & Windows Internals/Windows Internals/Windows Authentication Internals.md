---
tags: [windows, internals, authentication, kerberos, ntlm]
type: note
---

# Windows Authentication Internals

## Authentication Flow

1. User enters credentials
2. LSASS handles authentication
3. Kerberos or NTLM used
4. Security token created

---

## Kerberos

Default in domain environments.

Flow:
- Client requests TGT from KDC
- KDC issues TGT
- Client requests service ticket
- Service validates ticket

Key components:
- TGT
- Service Ticket
- SPN

Check Kerberos tickets:
```powershell
klist
```

---
## NTLM

Used when:

- No domain
    
- Fallback scenario
    

Less secure than Kerberos.

---

## LSASS

Process:

- lsass.exe
    

Stores:

- Authentication data
    
- Security tokens
    

Critical attack target.