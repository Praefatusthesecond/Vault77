---
title: Ansible - Overview
tags: [ ansible, devops, automation, configuration-management, orchestration ]
type: knowledge
domain: devops
status: active
---

# Ansible - Overview

## What is Ansible?

Ansible is an **agentless automation framework** used for:

- Configuration management
    
- Infrastructure provisioning
    
- Application deployment
    
- Orchestration
    
- Security hardening
    
- Compliance enforcement
    

It operates over:

- SSH (Linux)
    
- WinRM (Windows)
    

No agents required on managed nodes.

---

## Core Architecture

Control Node

- Where Ansible is installed
    
- Executes playbooks
    

Managed Nodes

- Target systems being configured
    

Inventory

- Defines target hosts
    

Modules

- Units of work (copy, service, package, etc.)
    

Playbooks

- YAML automation definitions
    

Roles

- Reusable automation structures
    

---

## Why Ansible in DevSecOps?

- Infrastructure as Code
    
- Idempotent operations
    
- Easy Git integration
    
- CI/CD compatible
    
- Security automation friendly
    
- Works well with cloud providers
    

---

## Key Characteristics

- Agentless
    
- Declarative style
    
- YAML-based
    
- Idempotent
    
- Large module ecosystem