---
title: Ansible - Playbooks
tags: [ ansible, playbooks, yaml, automation ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Playbooks

## Basic Structure

- name: Install nginx  
  hosts: web  
  become: true  
  tasks:  
    - name: Install package  
      package:  
        name: nginx  
        state: present

---

## Playbook Concepts

- hosts
    
- tasks
    
- become
    
- vars
    
- handlers
    
- roles
    
- tags
    

---

## Idempotency

If nginx is already installed → nothing changes.

This makes automation safe and repeatable.