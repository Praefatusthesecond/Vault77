---
title: Ansible - Windows Automation
tags: [ ansible, windows, winrm, automation ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Windows Automation

## Communication Method

- WinRM
    
- PowerShell-based modules
    

---

## Example Task

- name: Install IIS  
  hosts: windows  
  tasks:  
    - name: Install feature  
      win_feature:  
        name: Web-Server  
        state: present

---

## Important Considerations

- Proper WinRM configuration
    
- Authentication method
    
- Firewall rules
    
- Certificate handling

