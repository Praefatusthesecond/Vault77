---
title: Ansible - Roles
tags: [ ansible, roles, structure, reusable ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Roles

## Why Roles?

- Reusability
    
- Clean structure
    
- Modular automation
    
- Separation of concerns
    

---

## Standard Role Structure
```text
roles/  
└── nginx/  
    ├── tasks/main.yml  
    ├── handlers/main.yml  
    ├── defaults/main.yml  
    ├── vars/main.yml  
    ├── templates/  
    ├── files/  
    └── meta/main.yml
```
---

## Using Roles

- hosts: web  
  roles:  
    - nginx