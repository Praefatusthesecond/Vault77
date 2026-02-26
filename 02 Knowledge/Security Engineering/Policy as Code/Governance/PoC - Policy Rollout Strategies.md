---
tags: [ policy-as-code, governance, rollout ]
parent: Policy as Code
---
Back to  [[Policy as Code - Overview]]

# Policy Rollout Strategies

Hard enforcement without rollout strategy breaks trust fast.

## Rollout phases

### Phase 1 - Visibility
- Policy runs in audit or warn mode
- No blocking
- Collect violations and patterns

### Phase 2 - Soft enforcement
- Block new violations
- Allow existing non-compliant resources
- Time-box remediation

### Phase 3 - Hard enforcement
- Deny all violations
- Enforced consistently

## Rollout dimensions
- Per repository
- Per environment
- Per namespace
- Per cloud account or subscription

## Versioning policies
- Use semantic versioning
- Breaking changes require major version bump
- Communicate changes clearly

## Good practices
- Announce policies before enforcing
- Provide fix guidance
- Track adoption metrics
- Never surprise teams

Slow is smooth. Smooth is fast.
