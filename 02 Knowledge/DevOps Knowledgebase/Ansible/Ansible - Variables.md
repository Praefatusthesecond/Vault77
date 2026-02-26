---
title: Ansible - Variables
tags: [ ansible, variables, precedence, configuration ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Variables

## Variable Sources

- playbook vars
    
- inventory vars
    
- group_vars
    
- host_vars
    
- role defaults
    
- role vars
    
- extra vars (-e)
    

---

## Precedence (High → Low)

1. Extra vars
    
2. Task vars
    
3. Play vars
    
4. Inventory vars
    
5. Role defaults
    

Understanding precedence prevents debugging nightmares.
