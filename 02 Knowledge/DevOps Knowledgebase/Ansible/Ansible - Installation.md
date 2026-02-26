---
title: Ansible - Installation
tags: [ ansible, installation, linux, automation ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Installation

## Install via pip (recommended)
```bash
python3 -m venv ansible-env  
source ansible-env/bin/activate  
pip install ansible
```
Check version:
```bash
ansible --version
```
---

## Install via package manager (Ubuntu example)
```bash
sudo apt update  
sudo apt install ansible
```
---

## Directory Structure Best Practice

```text
ansible/  
├── inventory/  
├── group_vars/  
├── host_vars/  
├── roles/  
├── playbooks/  
└── ansible.cfg
```