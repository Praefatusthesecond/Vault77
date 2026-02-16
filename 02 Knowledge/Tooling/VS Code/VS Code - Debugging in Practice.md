---
type: knowledge
tags: [ tooling, vscode, debugging, powershell, scripting ]
status: evergreen
parent: VS Code - Overview
created: 2026-02-05
---
Back to [[VS Code - Overview]]

# VS Code - Debugging in Practice

Debugging is not about fixing bugs faster.
It’s about **understanding behavior**.

This note focuses on *practical* debugging, not theory.

---

## Debugger mental model
A debugger gives you:
- Controlled execution
- State inspection
- Intentional pauses

Instead of guessing, you **observe**.

---

## Core debugger concepts
- Breakpoints
- Step over / into / out
- Call stack
- Variables & watch expressions

If you understand these, the language doesn’t matter.

---

## launch.json basics

Lives in:
`.vscode/launch.json`

Defines:
- What to run
- How to run it
- With which arguments

---

## PowerShell debugging example

```json
{
  "type": "PowerShell",
  "request": "launch",
  "name": "Debug Script",
  "script": "${file}",
  "cwd": "${workspaceFolder}"
}
```
Set breakpoints → press F5.

---
## Breakpoints you should use

- Line breakpoints
    
- Conditional breakpoints
    
- Logpoints (log without stopping)
    

Logpoints are **criminally underused**.

---
## Watch expressions

Add variables or expressions to:

- Inspect changing values
    
- Track state over time
    
- Avoid `Write- Host` spam
    

---

## Debugging mindset

Ask:

- What do I _expect_ to happen?
    
- What _actually_ happens?
    
- Where does reality diverge?
    

Debuggers answer this brutally honestly.

---

## When NOT to debug

- Pure config errors → lint/validate
    
- Formatting issues
    
- Known syntax mistakes
    

Debuggers shine when logic is involved.

---

## Rule of thumb

If you add more than 3 print statements:  
👉 you should be debugging instead.

---

## Final thought

A debugger turns uncertainty into facts.  
Use it sooner.
