---
title: Ansible - Vault
tags: [ ansible, vault, security, encryption, secrets ]
type: knowledge
domain: devops
status: active
---
Back to [[Ansible - Overview]]

# Ansible - Vault

## Encrypt a file

ansible-vault create secrets.yml

Use nano (preferred):

EDITOR=nano ansible-vault edit secrets.yml

---

## Encrypt string

ansible-vault encrypt_string 'SuperSecretPassword'

---

## Run playbook with vault

ansible-playbook site.yml --ask-vault-pass

