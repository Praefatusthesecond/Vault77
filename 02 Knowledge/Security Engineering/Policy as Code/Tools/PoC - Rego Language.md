---
tags: [ policy-as-code, opa, rego, language ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Rego Language

Rego is the policy language used by OPA.

## Mental model
- Input: data to evaluate (JSON)
- Rules: logic that evaluates the input
- Output: allow, deny, violations, reasons

Rego is:
- Declarative
- Functional
- Data-oriented

## Core concepts
- Rules return sets or booleans
- Everything is evaluated against input
- No side effects

## Example
```rego
package terraform.tags

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  not resource.change.after.tags.Owner
  msg := "Missing Owner tag"
}
```

## Best practices

- One responsibility per policy file
    
- Human-readable messages
    
- Avoid deep nesting
    
- Write tests for every rule
    

Rego gets easier once you stop thinking imperatively.

