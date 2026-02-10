---
type: knowledge
tags: [ tooling, vscode, markdown, obsidian ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Markdown Power User Mode

VS Code is an **excellent Markdown power tool**, especially for Obsidian- style knowledge bases.

This note documents how to use it *intentionally*.

---

## Why VS Code for Markdown?
- Massive batch edits
- Regex search/replace
- Multi- cursor editing
- Git- native
- Snippets & tasks

Obsidian is for thinking.
VS Code is for **surgery**.

---

## Markdown preview
- Open preview: `Ctrl + Shift + V`
- Side- by- side preview supported

Useful for:
- Tables
- Lists
- Frontmatter validation

---

## Structural edits (common ops)

### Promote/demote headings
Use multi- cursor or regex:
```regex
\n{3,}
```
Replace with:
```regex
\n\n
```
---
## Frontmatter manipulation

VS Code excels at:

- Adding missing frontmatter
    
- Normalizing tags
    
- Removing legacy metadata
    

Always:

- Scope to folder
    
- Preview first
    

---

## Link refactors

Examples:

- Convert plain text → `[[Wiki Links]]`
    
- Normalize casing
    
- Add backlinks/footers
    

Regex + capture groups = superpower.

---

## Markdown linting

Optional but useful:

- Enforces consistency
    
- Catches malformed lists
    
- Flags broken structure
    

Enable per workspace, not globally.

---

## Snippets for Markdown

Create snippets for:

- Note templates
    
- Section headers
    
- Callouts
    
- Checklists
    

Reduce friction → increase writing.

---

## Git + Markdown

VS Code shines for:

- Reviewing diffs
    
- Resolving conflicts
    
- Tracking knowledge evolution
    

Markdown + Git = versioned thinking.

---

## Final rule

- Think in Obsidian
    
- Operate in VS Code
    
- Commit often