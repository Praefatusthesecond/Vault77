---
tags: [security, iam, authorization]
parent: "IAM - Overview"
---
Back to [[IAM - Overview]]

# Authorization Models

## RBAC (Role-Based Access Control)

Access based on role assignment.

Example:
Developer role → Read-only production logs.

Pros:
- Simple
- Scalable

Cons:
- Role explosion

---

## ABAC (Attribute-Based Access Control)

Access based on attributes.

Example:
Allow access if:
- Department = DevOps
- Location = Office network
- Device = Compliant

More flexible than RBAC.

---

## PBAC (Policy-Based Access Control)

Central policy engine evaluates conditions.

Often implemented as:
Policy as Code.

---

## Cloud IAM

Cloud providers use hybrid RBAC + ABAC + policy engines.
