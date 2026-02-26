---
tags: [networking, tls, https, security]
type: note
---

# TLS & HTTPS Deep Dive

TLS encrypts communication.

---

## TLS Handshake Simplified

1. Client Hello
2. Server Hello
3. Certificate exchange
4. Key exchange
5. Encrypted session established

---

## Certificate Chain

- Server certificate
- Intermediate CA
- Root CA

---

## Debug TLS

Linux:
```bash
openssl s_client -connect example.com:443
```
Check cert:

```bash
openssl x509 -in cert.pem -text -noout
```

---

## Common Issues

- Expired certificate
    
- Wrong hostname (CN mismatch)
    
- Missing intermediate CA
    
- Weak cipher suite