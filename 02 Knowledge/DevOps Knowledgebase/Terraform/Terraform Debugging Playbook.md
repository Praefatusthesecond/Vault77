---
tags: [terraform, iac, devops, debugging]
aliases: [Terraform Debugging]
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

# Terraform Debugging Playbook

This is a **step- by- step playbook** for when Terraform behaves unexpectedly.
Follow this **in order**. Skipping steps usually makes things worse.

← Back to [[Terraform]]

---

## 0. Stop and Don’t Apply

If something looks wrong:

❌ Do NOT run:
```bash
terraform apply
```

Debug first. Terraform failures compound fast.

---

## 1. Read the Error Message (Slowly)

Terraform errors are often:

- Long
    
- Ugly
    
- But accurate
    

Focus on:

- Resource name
    
- Attribute mentioned
    
- Provider error vs Terraform error
    

> If the error mentions the provider API → not Terraform’s fault  
> If it mentions state → probably Terraform’s fault

---

## 2. Run `terraform validate`

`terraform validate`

Catches:

- Syntax errors
    
- Missing variables
    
- Invalid references
    

If this fails, **fix it first**.

---

## 3. Run `terraform plan` (Again)

`terraform plan`

Look for:

- Unexpected destroys
    
- Forced replacements
    
- Large diffs for small changes
    

Red flags 🚩:

- `-/+` (destroy + recreate)
    
- Changes you didn’t touch
    
- “Forces new resource”
    

---

## 4. Check What Terraform Thinks Exists (State)

### List state

`terraform state list`

### Inspect a resource

`terraform state show <resource>`

Common discoveries:

- Resource exists but config changed
    
- Resource renamed
    
- Resource manually deleted
    

---

## 5. Check for Drift

Did someone:

- Click in Azure Portal?
    
- Change something in AWS?
    
- Modify GitHub settings manually?
    

Terraform will **not always detect this cleanly**.

Try:

`terraform plan - refresh- only`

If drift is large → pause and reassess.

---

## 6. Enable Debug Logging (When Stuck)

`TF_LOG=TRACE terraform plan`

Useful when:

- Provider behaves oddly
    
- API errors are vague
    

⚠️ Logs may contain secrets — don’t paste them blindly.

---

## 7. Verify Provider Versions

`terraform providers`

Then check:

- Required provider version
    
- Lock file (`.terraform.lock.hcl`)
    

Mismatch between machines or CI = classic bug source.

---

## 8. Confirm Variable Values

Print variables:

`terraform console`

Then:

`var.some_variable`

Common issues:

- Wrong `terraform.tfvars`
    
- CI passing different values
    
- Environment variables overriding defaults
    

---

## 9. Narrow the Blast Radius

Target **only one resource** (debugging only):

`terraform plan - target=aws_instance.web`

⚠️ Never use `- target` long- term — this is a scalpel, not a hammer.

---

## 10. Check for `count` / `for_each` Issues

If resources are being recreated unexpectedly:

- Look for list order changes
    
- Look for index- based resources
    

Classic symptom:

> “Why did Terraform delete everything when I removed one item?”

→ See [[Terraform Gotchas]]

---

## 11. Resource Rename? Use `state mv`

If you renamed something:

`terraform state mv old.name new.name`

Never rely on Terraform “figuring it out”.

---

## 12. When All Else Fails

Ask yourself:

- Is the module too complex?
    
- Should this be split?
    
- Is Terraform the right tool here?
    

Sometimes the fix is **design**, not debugging.

---

## Debugging Mindset (Important)

> Terraform is deterministic  
> If it behaves oddly, **your inputs are odd**

---

## Related Notes

- [[Terraform Gotchas]]
    
- [[Terraform State]]
    
- [[Terraform Best Practices]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]
