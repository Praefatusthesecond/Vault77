---
type: knowledge
tags: [ tooling, vscode, regex, refactoring ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Search, Replace & Regex

This note exists to prevent **accidental repo destruction** while doing powerful mass edits.

---

## Core shortcuts

| Action | Shortcut |
|------|---------|
| Find in file | `Ctrl + F` |
| Replace in file | `Ctrl + H` |
| Find in files | `Ctrl + Shift + F` |
| Replace in files | `Ctrl + Shift + H` |
| Toggle regex | `Alt + R` |
| Match case | `Alt + C` |
| Whole word | `Alt + W` |

---

## Absolute safety rules

1. **Always preview matches**
2. Prefer **Replace in Selection**
3. Scope to a folder if possible
4. Regex in steps:
   - Find first
   - Replace one
   - Replace all

If your preview looks scary → stop.

---

## Regex basics (VS Code flavor)

- `.` → any character
- `*` → zero or more
- `+` → one or more
- `?` → optional
- `^` → start of line
- `$` → end of line
- `()` → capture group
- `[]` → character class

---

## Common real- world patterns

### Find empty lines
```regex
^\s*$
```
### Match frontmatter block

```regex
^---[\s\S]*?^---
```
### Find files missing frontmatter

```regex
^(?!---)
```
### Capture and reuse content

```regex
(\[\[.*?\]\])
```
Replace with:

```regex
- $1`
```
---

## Replace with capture groups

Use `$1`, `$2`, etc.

**Example**

```
regex
^title:\s*(.*)
```
Replace:

```text
title: "$1"
```
---

## Multiline awareness

VS Code regex works **line by line**, unless you use:

```regex
[\s\S]
```
to cross line boundaries.

---

## Replace modes you should prefer

### Replace in selection

- Select block
    
- `Ctrl + H`
    
- Replace safely
    

### Replace in folder

- Limit blast radius
    
- Especially useful in Obsidian vaults
    

---

## When NOT to use regex

- Renaming variables/functions → use **Rename Symbol**
    
- Language- aware edits → use refactors
    
- Structural code changes → debugger/refactor tools
    

---

## Regex mindset

Regex is a **scalpel**, not a hammer.  
Use it when structure is predictable and repetition is high.

When in doubt: dry- run first.
