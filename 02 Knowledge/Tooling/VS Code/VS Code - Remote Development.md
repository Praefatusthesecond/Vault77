---
type: knowledge
tags: [ tooling, vscode, remote, ssh, wsl, containers ]
status: evergreen
parent: VS Code - Overview
created: 2026-02-05
---
Back to [[VS Code - Overview]]

# VS Code - Remote Development

Remote Development turns VS Code into a **distributed IDE**.
You edit locally, execute remotely.

---

## Core idea

VS Code UI runs locally  
Language server, terminal, tools run remotely

Result:
- Native performance
- Correct tooling
- No environment drift

---

## Remote SSH

Use when:
- Editing servers
- Managing infra nodes
- Running automation remotely

Features:
- File explorer over SSH
- Integrated terminal
- Debugging support
- Extensions installed per remote

---

## WSL integration

Use when:
- You want Linux tooling on Windows
- Terraform / Ansible / Bash- heavy work
- Avoiding Windows path weirdness

VS Code treats WSL like a native environment.

---

## Dev Containers

Use when:
- Toolchain must be reproducible
- Onboarding others
- Avoiding “works on my machine”

Defined via:
.devcontainer/

Benefits:
- Same tools, same versions
- Disposable environments
- Perfect for CI parity

---

## Extension behavior (important)

Extensions are:
- Installed **locally**
- Installed **per remote**

Some extensions must live where the code runs.

---

## Mental rule
If the code executes remotely,  
the tools should live there too.

---

## Best practices
- Name remotes clearly
- Keep SSH configs clean
- Treat servers as cattle, not pets
- Avoid editing prod directly unless necessary

---

## Remote ≠ risky
Remote development is safer when:
- You understand where commands run
- You respect environments
- You avoid cowboy edits

---
