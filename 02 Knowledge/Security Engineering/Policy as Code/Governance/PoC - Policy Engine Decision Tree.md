---
tags: [ policy-as-code, governance, decision-tree ]
aliases: [ Policy Engine Selection ]
parent: Policy as Code
---
Back to  [[Policy as Code]]

# Policy Engine Decision Tree

Use this decision tree to select the right Policy as Code engine.
Do not start with tools. Start with enforcement location.

---

## Step 1 - Where do you want to enforce?

### In CI/CD pipelines
Go to Step 2A

### At runtime in Kubernetes
Go to Step 2B

### In the cloud platform itself
Go to Step 2C

---

## Step 2A - CI/CD enforcement

### What are you evaluating?

- Terraform plans
- Kubernetes manifests
- YAML or JSON configs

Recommended:
- Open Policy Agent (OPA)
- Conftest

Use when:
- You want fast feedback
- You want shift-left enforcement
- You want tool-agnostic policies

Avoid when:
- You need deep platform context without JSON plumbing

---

### Are you using Terraform Cloud or Enterprise?

Yes:
- HashiCorp Sentinel

No:
- OPA or Conftest

---

## Step 2B - Kubernetes runtime enforcement

### Do you want YAML-based policies?

Yes:
- Kyverno

No:
- Gatekeeper (OPA)

---

### Do you need mutation or auto-fix?

Yes:
- Kyverno

No:
- Gatekeeper or Kyverno

---

### Is policy complexity high?

Yes:
- Gatekeeper (Rego is more expressive)

No:
- Kyverno

---

## Step 2C - Cloud-native enforcement

### Azure environment?

- Azure Policy

### AWS environment?

- IAM policy validation
- SCPs for org guardrails
- CI policy checks for depth

Cloud-native policies are strongest at deny and audit,
weaker at complex logic.

---

## General guidance

| Requirement | Best fit |
|------------|----------|
| Multi-platform | OPA |
| Kubernetes-first | Kyverno |
| Strong runtime deny | Gatekeeper |
| Terraform Cloud | Sentinel |
| Azure governance | Azure Policy |

## Golden rule
Use the simplest engine that meets your enforcement need.
Complexity is a liability in policy systems.
