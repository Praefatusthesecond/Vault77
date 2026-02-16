---
tags: [terraform, iac, devops]
aliases: [Terraform Overview, Terraform Basics]
domain: DevOps
subcategory: Terraform
parent: DevOps Knowledgebase
---
Back to [[DevOps Knowledgebase]]

# Terraform

Terraform is an **Infrastructure as Code (IaC)** tool used to declaratively define, provision, and manage infrastructure across cloud and on- prem providers.

This note is the **root page** for all Terraform- related knowledge.  
Use it as a refresher, then jump into focused topics via linked notes.

---

## What Terraform Is (High Level)

- Declarative: you describe *what you want*
- Provider- based: AWS, Azure, GCP, GitHub, VMware, etc.
- Idempotent: safe to re- run
- State- driven: tracks real infrastructure

Terraform is best used for **infrastructure provisioning**, not system configuration.

→ See also: [[Terraform vs Ansible]]

---

## Core Concepts (Quick Map)

- Providers → [[Terraform Providers]]
- Resources → [[Terraform Resources]]
- State → [[Terraform State]]
- Variables → [[Terraform Variables]]
- Outputs → [[Terraform Outputs]]
- Modules → [[Terraform Modules]]

---

## Standard Terraform Workflow

1. Initialize project  
2. Validate configuration  
3. Plan changes  
4. Apply changes  

→ Commands explained in: [[Terraform CLI Commands]]

---

## Typical Real- World Usage

Terraform is usually paired with configuration management tools.

Example flow:
1. Terraform provisions infrastructure
2. Ansible configures systems and applications

→ Deep dive: [[Terraform + Ansible]]  
→ CI/CD usage: [[Terraform + GitLab CI]]

---

## Best Practices (Summary)

- Use remote state
- Use modules
- Never commit state files
- Always review plans before apply

→ Full list: [[Terraform Best Practices]]

---

## Index

```dataview
LIST
FROM ""
WHERE parent = this.file.name
SORT file.name ASC
```
