---
type: knowledge
tags: [ tooling, vscode, snippets, productivity ]
status: evergreen
parent: vscode
created: 2026-02-05
---
# VS Code - Snippets

Snippets eliminate repetitive typing.
They encode **patterns**, not shortcuts.

---

## When snippets shine
- Frontmatter templates
- Terraform resources
- Markdown structures
- PowerShell boilerplate
- Repeated YAML blocks

---

## Snippet types
- Global
- Language- specific
- Workspace- level

---

## Creating a snippet
1. Command Palette
2. `Configure User Snippets`
3. Choose language or global

---

## Example: Markdown frontmatter snippet

```json
{
  "Obsidian Frontmatter": {
    "prefix": "fm",
    "body": [
      "---",
      "tags:",
      "  - $1",
      "---",
      "",
      "$0"
    ],
    "description": "Standard Obsidian frontmatter"
  }
}
```

Type `fm` → Tab

---
## Terraform resource snippet

```json
{
  "Terraform Resource": {
    "prefix": "tfres",
    "body": [
      "resource \"${1:type}\" \"${2:name}\" {",
      "  $0",
      "}"
    ]
  }
}
```

---
- `$1`, `$2` → tab order
    
- `$0` → final cursor position
    
- `${1:default}` → default value

---

## Best practices

- Snippets should be generic
    
- Avoid project- specific values
    
- Version control workspace snippets
    
- Document snippets in README if shared

---

## Snippets vs templates

- **Snippets**: fast insertion
    
- **Templates**: file- level structure
    

Use both.

---
