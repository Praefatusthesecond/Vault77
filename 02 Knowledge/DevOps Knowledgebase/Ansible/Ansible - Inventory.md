---
title: Ansible - Inventory
tags: [ ansible, inventory, hosts, infrastructure ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]


# Ansible - Inventory

## Static Inventory (INI style)

[web]  
web01  
web02  
  
[db]  
db01

---

## YAML Inventory

all:  
  children:  
    web:  
      hosts:  
        web01:  
        web02:  
    db:  
      hosts:  
        db01:

---

## Group Variables

group_vars/web.yml  
group_vars/db.yml

---

## Dynamic Inventory

Used for:

- AWS
    
- Azure
    
- VMware
    
- Kubernetes
    

Allows infrastructure discovery automatically.