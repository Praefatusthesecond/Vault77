---
title: Ansible - Linux Automation
tags: [ ansible, linux, ssh, automation ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Linux Automation

## SSH Requirements

- SSH access
    
- Python installed on target
    

---

## Example

- name: Install Docker  
  hosts: linux  
  become: true  
  tasks:  
    - name: Install package  
      package:  
        name: docker  
        state: present