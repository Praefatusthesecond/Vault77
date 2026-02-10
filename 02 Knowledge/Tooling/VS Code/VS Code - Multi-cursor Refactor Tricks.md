---
type: knowledge
tags: [ tooling, vscode, productivity, refactoring ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Multi- cursor Refactor Tricks

Multi- cursor editing is one of VS Code’s most powerful features.
Used well, it replaces dozens of repetitive edits.
Used poorly, it creates subtle disasters.

This note teaches **how to use it safely and deliberately**.

---

## The mental model (important)

Multi- cursor is best when:
- The structure is identical
- The change is mechanical
- Context does not vary

Multi- cursor is dangerous when:
- Logic differs per line
- Meaning depends on position
- You’re “hoping” it lines up

If you have to *hope*, stop.

---

## Core shortcuts (commit these to muscle memory)

| Action | Shortcut |
|-----|--------|
| Add cursor | `Alt + Click` |
| Select next occurrence | `Ctrl + D` |
| Select all occurrences | `Ctrl + Shift + L` |
| Skip current occurrence | `Ctrl + K Ctrl + D` |
| Column select (mouse) | `Shift + Alt + Drag` |
| Column select (keyboard) | `Shift + Alt + ↑ / ↓` |
| Undo last cursor | `Ctrl + U` |

---

## The safest multi- cursor pattern

1. Select the first instance
2. Press `Ctrl + D` **incrementally**
3. Stop when structure diverges
4. Edit once
5. Exit multi- cursor mode intentionally

This avoids accidental over- selection.

---

## Common refactor patterns

### Rename repeated values (safe)
```text
old_name
old_name
old_name
```
Steps:

- Select one `old_name`
    
- `Ctrl + Shift + L`
    
- Type `new_name`
    

Use this only when **all occurrences must change**.

---

### Edit aligned blocks (column editing)

Useful for:

- Tables
    
- YAML values
    
- Markdown lists
    
- Terraform attributes
    

Example:

`name    = "a" name    = "b" name    = "c"`

Steps:

- `Shift + Alt + Drag` over values
    
- Edit once
    

---

### Prefix / suffix edits

Example:

`resource_a resource_b resource_c`

Steps:

- Multi- cursor select lines
    
- Go to line start or end
    
- Insert once
    

Great for:

- Adding bullets
    
- Commenting blocks
    
- Wrapping values
    

---

## Combining multi- cursor with navigation

This is where it gets powerful.

Example:

- Multi- cursor select
    
- `Ctrl + →` to jump words
    
- `Home` / `End` to align edits
    
- `Ctrl + Backspace` for clean deletes
    

You can **navigate with multiple cursors**.

---

## Multi- cursor + regex (advanced but deadly)

Workflow:

1. Use regex search to narrow scope
    
2. Select matches
    
3. Convert to multi- cursor
    
4. Edit safely
    

Example:

`^tags:\s+-`

Then multi- cursor edit tag lists cleanly.

---

## When to prefer other tools

### Use **Rename Symbol** (`F2`) when:

- Language- aware refactor exists
    
- Variables / functions / methods
    
- Risk of partial renames
    

### Use **Regex Replace** when:

- Pattern is structural
    
- Captures are needed
    
- Large- scale transformation
    

Multi- cursor sits **between** these tools.

---

## Escape hatches (very important)

- Exit multi- cursor: `Esc`
    
- Undo last cursor: `Ctrl + U`
    
- Full undo: `Ctrl + Z`
    

If something feels wrong:  
👉 stop immediately

---

## Anti- patterns (learn these once)

❌ `Ctrl + Shift + L` without reviewing matches  
❌ Editing logic- heavy code blindly  
❌ Using multi- cursor where refactor exists  
❌ Fixing mistakes _after_ committing

Speed never beats correctness.

---

## Pro tips

- Use a monospace font with clear alignment
    
- Zoom in when column editing
    
- Keep the minimap visible during large edits
    
- Commit immediately after successful refactors
    

---

## Final rule

Multi- cursor editing is a **precision tool**, not a shortcut.  
When used deliberately, it turns minutes into seconds.  
When rushed, it creates bugs that hide in plain sight.