---
title: Ansible - Troubleshooting
tags: [ ansible, troubleshooting, debugging, devops ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]


# Ansible - Troubleshooting

## Increase verbosity

ansible-playbook site.yml -vvv

---

## Test connectivity

ansible all -m ping

---

## Common Issues

- Wrong inventory
    
- Variable precedence conflicts
    
- SSH/WinRM failures
    
- Missing Python on Linux
    
- YAML indentation errors