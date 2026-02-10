---
type: knowledge
tags: [ tooling, vscode, cicd, yaml, pipelines ]
status: evergreen
parent: vscode
created: 2026-02-05
---

# VS Code + CI/CD Authoring (YAML Ergonomics)

This note documents how to use VS Code to author **CI/CD YAML safely, sanely, and at speed**.
The goal is to reduce:
- indentation bugs
- schema mistakes
- copy- paste drift
- pipeline trial- and- error

---

## The YAML reality (accept it early)

YAML is:
- whitespace- sensitive
- schema- driven
- unforgiving
- deceptively simple

Most CI/CD failures are **editor problems**, not logic problems.

VS Code is your primary defense.

---

## Absolute baseline setup (non- negotiable)

### Enable visible whitespace
```json
"editor.renderWhitespace": "boundary"
```

Indentation errors become _visible_, not mystical.

---

### Enable format- on- save (workspace- level)

`"editor.formatOnSave": true`

CI/CD YAML should always be auto- formatted.

---

### Use spaces, not tabs

`"editor.insertSpaces": true "editor.tabSize": 2`

Most CI/CD systems expect **2 spaces**.

---

## YAML schema validation (this is huge)

VS Code can validate YAML **against CI/CD schemas**.

### Example: pipeline schema mapping

```yaml
"yaml.schemas": {
  "https://json.schemastore.org/github- workflow.json": ".github/workflows/*.yml",
  "https://json.schemastore.org/gitlab- ci.json": ".gitlab- ci.yml",
  "https://json.schemastore.org/azure- pipelines.json": "azure- pipelines.yml"
}

```

Benefits:

- autocomplete
    
- inline errors
    
- documentation on hover
    

This turns YAML from guesswork into guided authoring.

---

## Autocomplete & hover documentation

When schemas are active:

- Keys autocomplete correctly
    
- Invalid keys error immediately
    
- Hover explains what a field does
    

If autocomplete feels dumb:  
👉 schema is missing or misconfigured

---

## Folding & structure navigation

### Fold by sections

- Click gutter arrows
    
- Or: `Ctrl + Shift + [ / ]`
    

Great for:

- long pipelines
    
- multi- stage configs
    
- templates/includes
    

---

## Multi- cursor for YAML (with discipline)

### Safe use cases

- Editing repeated steps
    
- Aligning values
    
- Adding/removing keys
    

Example:

`image: alpine image: alpine image: alpine`

Multi- cursor edit → safe.

---

### Dangerous use cases

- Mixed indentation levels
    
- Conditional blocks
    
- `rules`, `only/except`, `if` trees
    

When indentation differs:  
👉 stop and use structure- aware edits

---

## Snippets for pipelines (massive ROI)

Create snippets for:

- job skeletons
    
- stages
    
- steps
    
- reusable blocks
    

### Example snippet (generic job)

```yaml
{
  "CI Job": {
    "prefix": "cijob",
    "body": [
      "${1:job_name}:",
      "  stage: ${2:stage}",
      "  script:",
      "    - ${3:command}",
      ""
    ]
  }
}

```

Snippets reduce:

- syntax errors
    
- missing keys
    
- copy drift
    

---

## Comments as structure markers

YAML benefits from **intentional comments**:

```yaml
# ------------------
# Build stage
# ------------------
```

VS Code folding respects this and improves readability.

---

## Tasks for pipeline validation

Use VS Code tasks to run:

- local linters
    
- schema checks
    
- pipeline validation commands
    

Example:

```yaml
{
  "label": "Validate CI config",
  "type": "shell",
  "command": "yamllint ."
}

```

One command → fewer broken pushes.

---

## Diffing YAML safely

VS Code diff view helps catch:

- indentation drift
    
- accidental nesting
    
- moved blocks
    

Always review diffs **side- by- side** for YAML.

---

## Regex tricks (careful but powerful)

### Normalize indentation mistakes

```regex
^\t+
```
### Detect trailing spaces

```regex
[ \t]+$
```

Use regex for cleanup, not logic changes.

---

## When YAML gets too big

If you notice:

- copy- paste repetition
    
- huge files
    
- logic branching everywhere
    

Then:

- use templates/includes
    
- split files
    
- centralize shared logic
    

VS Code supports this — pipelines do too.

---

## CI/CD YAML authoring rules

1. Enable schemas
    
2. Let autocomplete guide you
    
3. Respect indentation religiously
    
4. Snippets > copy- paste
    
5. Review diffs every time
    
6. Validate locally when possible
    

---

## Final thought

CI/CD YAML is **executable infrastructure**.  
Treat it like code, not configuration.

VS Code gives you the guardrails —  
you just have to turn them on.
