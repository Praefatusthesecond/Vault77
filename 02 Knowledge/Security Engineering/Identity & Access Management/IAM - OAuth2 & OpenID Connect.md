---
tags: [security, iam, oauth, oidc]
parent: "IAM - Overview"
---
Back to [[IAM - Overview]]

# OAuth2 & OpenID Connect

## OAuth2

Delegated authorization framework.

Allows:
Application to access resource on behalf of user.

Actors:
- Resource Owner
- Client
- Authorization Server
- Resource Server

---

## OIDC

Authentication layer on top of OAuth2.

Provides:
- ID tokens (JWT)
- User identity information

---

## Common Flows

- Authorization Code Flow
- Client Credentials Flow
- Device Code Flow

---

## Security Risks

- Token leakage
- Misconfigured redirect URIs
- Scope over-permissioning
