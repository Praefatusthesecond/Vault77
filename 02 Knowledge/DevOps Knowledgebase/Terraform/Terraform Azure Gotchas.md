---
tags: [terraform, iac, devops, azure, gotchas]
aliases: []
domain: DevOps
subcategory: Terraform
parent: Terraform
---
Back to [[Terraform]]

…immediately after creating a role assignment.

### Mitigations
- Use `depends_on`
- Split apply phases when necessary
- Re- run apply after propagation completes

Yes, this is normal for Azure.

---

## 4. Managed Identities Lag Behind Reality

After creating:
- System- assigned identities
- User- assigned identities

Terraform may attempt to use them before Azure fully registers them.

### Result
- “Principal not found”
- Authorization errors

### Mitigations
- Explicit dependencies
- Separate identity creation from usage
- Retry applies when needed

---

## 5. Resource Group Deletes Are Nuclear

Deleting a resource group deletes:
- All contained resources
- Immediately and irreversibly

Terraform does not provide a safety net here.

### Best Practices
- One resource group per logical stack
- Never mix environments
- Protect production resource groups with Azure locks

---

## 6. Azure Policies Can Break Terraform Silently

Azure Policy may:
- Deny resource creation
- Modify resource properties
- Inject default values

Terraform symptoms:
- Apply succeeds
- Drift appears on next plan
- Endless diffs

### Guidance
- Know which policies are applied
- Align Terraform configuration with enforced policy defaults

---

## 7. Subnets Are More Fragile Than They Look

Changes to:
- Address prefixes
- Delegations
- Service endpoints

Often cause:
- Subnet replacement
- Cascading failures in dependent resources

### Rule
Treat subnets as semi- immutable infrastructure.

---

## 8. Azure Storage Accounts for Remote State Need Extra Care

Azure backends require:
- Storage account
- Blob container
- Correct IAM and network access

Common issues:
- Missing permissions
- Network rules blocking CI access
- Key rotation breaking pipelines

### Tip
Lock down networking only after Terraform workflows are stable.

---

## 9. Azure Locks vs Terraform

Azure resource locks:
- Prevent deletion
- Prevent modification

Terraform:
- Does not understand locks
- Fails hard when encountering them

### Result
Plan succeeds, apply fails.

Always verify lock presence before major changes.

---

## 10. Case Sensitivity Causes Endless Drift

Azure APIs often normalize case.
Terraform does not.

Common offenders:
- Tags
- Identity names
- Diagnostic settings

Result:
- No- op changes every plan

---

## 11. Azure Tags Drift Constantly

Azure may:
- Add system tags
- Change casing
- Inject metadata

Terraform detects this as drift.

### Mitigation (when appropriate)
```hcl
lifecycle {
  ignore_changes = [tags]
}
```

---
## 12. Multiple Subscriptions Require Explicit Providers

Each Azure subscription requires:

- Its own provider block
    
- Explicit alias usage
    

Common failure modes:

- Resources created in the wrong subscription
    
- Cryptic authorization errors
    

Double- check provider usage inside modules.

---

## 13. Importing Existing Azure Resources Is Painful

Azure resource IDs are:

- Long
    
- Deeply nested
    
- Difficult to map cleanly to modules
    

Expect:

- Manual imports
    
- Configuration cleanup
    
- Drift resolution work
    

Import is a migration tool, not a daily workflow.

---

## Final Azure Rule

If Terraform fails on Azure, assume:

- IAM propagation delay
    
- Policy interference
    
- Immutable field changes
    

Then verify.

---

## Related Notes

- [[Terraform Debugging Playbook]]
    
- [[Terraform Gotchas]]
    
- [[Terraform State]]
    
- [[Terraform + GitLab CI]]
    
- [[Terraform]]
