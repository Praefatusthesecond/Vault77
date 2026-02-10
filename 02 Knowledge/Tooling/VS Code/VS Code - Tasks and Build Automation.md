---
type: knowledge
tags: [ tooling, vscode, automation, tasks ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Tasks & Build Automation

Tasks allow you to define **repeatable, documented commands** inside the repo.
They reduce tribal knowledge and terminal copy- paste rituals.

---

## Why tasks matter
- One- click automation
- Consistent commands across team
- Live in version control
- Discoverable via Command Palette

---

## Where tasks live
.vscode/tasks.json


Committed to the repo.

---

## Basic task example

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Terraform: Format",
      "type": "shell",
      "command": "terraform fmt - recursive",
      "group": "build",
      "problemMatcher": []
    }
  ]
}
```
Run via:

- `Ctrl + Shift + P → Run Task`
---
## Terraform validation task

```json
{
  "label": "Terraform: Validate",
  "type": "shell",
  "command": "terraform validate",
  "group": "test",
  "problemMatcher": []
}
```

---
## Powershell task (Windows)

```json
{
  "label": "Run PowerShell Script",
  "type": "shell",
  "command": "pwsh ./scripts/setup.ps1",
  "problemMatcher": []
}
```

---
## Task groups

- `build`
    
- `test`
    
- `none`
    

Grouped tasks show up nicely in UI.

---

## Chaining tasks

Use `dependsOn`:

```json
{
  "label": "Terraform: Full Check",
  "dependsOn": [
    "Terraform: Format",
    "Terraform: Validate"
  ]
}
```

---
## Problem matchers (advanced)

Problem matchers parse output and surface errors in the **Problems** panel.

Use when:

- Running linters
    
- Running tests
    
- Running compilers
    

Skip initially — add later.

---

## Best practices

- Keep tasks small and composable
    
- Name them clearly
    
- Prefer tasks over README “run this command”
    
- Never bake secrets into tasks
    

---

## Tasks vs scripts

- **Scripts**: logic
    
- **Tasks**: orchestration
    

Tasks call scripts, not the other way around.

---
## Final rule

If you run the same command more than twice:  
👉 make it a task.