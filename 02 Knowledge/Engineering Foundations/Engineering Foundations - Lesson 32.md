---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 4
---
Back to [[Engineering Foundations - Index]]

## Change Management & Safe Deployments

This lesson builds on:

- Incident Response
    
- Error Budgets
    
- Alerting Philosophy
    
- Capacity Planning
    
- Distributed Systems Failure Modes
    
- Reliability Patterns
    

We now answer:

> How do we change production systems without breaking them?

---

## 1. Core Concept

Change management is:

> The disciplined process of introducing modifications to a production system in a controlled and observable manner.

Every change carries risk.

The goal is not to eliminate change.  
The goal is to reduce blast radius.

---

## 2. Why This Matters

Statistics across industry show:

A majority of outages are triggered by:

- New deployments
    
- Config changes
    
- Infrastructure updates
    
- Database migrations
    
- Feature flags gone wrong
    

Change is the primary reliability risk.

---

## 3. The Risk Model of Change

Every change increases:

- Uncertainty
    
- System state variation
    
- Interaction complexity
    

Distributed systems amplify this risk.

Sharded data.  
Replicated services.  
Event-driven workflows.

Small change → large ripple effect.

---

## 4. Deployment Strategies

### 1️. Big Bang Deployment

Deploy to all servers at once.

Risk:  
High blast radius.

---

### 2️. Rolling Deployment

Deploy gradually across instances.
```text
Old Version → New Version (instance by instance)
```
Reduces simultaneous failure risk.

---

### 3️. Blue-Green Deployment

Two environments:

Blue (current)  
Green (new)

Switch traffic only when ready.
```text
Blue ←→ Green  
Traffic switch controlled
```
Allows instant rollback.

---

### 4️. Canary Deployment

Release to small percentage of users first.

Example:  
5% → 25% → 50% → 100%

Monitor SLIs carefully.

Limits blast radius.

---

## 5. Feature Flags

Feature flags allow:

- Enabling/disabling functionality without redeploying.
    
- Gradual rollout.
    
- Fast rollback.
    

But:

Flags increase system complexity.  
Old flags must be removed.

---

## 6. Observability & Deployments

Every deployment must be:

- Measured
    
- Monitored
    
- Compared to baseline
    

Track:

- Error rate
    
- Latency
    
- Saturation
    
- Burn rate
    

Deployment without monitoring is gambling.

---

## 7. Error Budgets & Change Velocity

If error budget is healthy:

More aggressive deployment allowed.

If error budget nearly exhausted:

Slow down change velocity.

Reliability becomes a deployment throttle.

Lesson 28 applied.

---

## 8. Database Migrations (High Risk Area)

Danger zones:

- Schema changes
    
- Index rebuilds
    
- Long-running locks
    
- Data backfills
    

Safer approach:

- Backward-compatible changes
    
- Two-phase migrations
    
- Gradual rollouts
    
- Shadow writes
    

Database changes are often more dangerous than code changes.

---

## 9. Rollback Strategy

Every deployment should answer:

If this fails,  
how do we revert quickly?

Rollback must be:

- Automated
    
- Tested
    
- Fast
    

If rollback is complex,  
deployment risk increases.

---

## 10. Blast Radius Thinking

Before deploying, ask:

- Which services depend on this?
    
- Which shards are affected?
    
- Which regions are impacted?
    
- What is worst-case failure mode?
    

Minimize scope.

Distributed systems amplify blast radius.

---

## 11. Applied Scenario

You deploy a new checkout feature.

After 5 minutes:

- p99 latency increases
    
- Error rate doubles
    

Questions:

1. Do you roll back?
    
2. Do you scale?
    
3. Do you disable feature flag?
    
4. What does burn rate show?
    

Good change discipline prevents escalation.

---

## 12. Mini Exercise

You manage an API serving 10 million users.

Plan a safe deployment strategy:

- Which deployment model?
    
- What monitoring thresholds?
    
- What rollback trigger?
    
- What percentage initial rollout?
    

Think in reliability terms.

---

## 13. Self-Test

Answer without scrolling:

1. Why is change the biggest reliability risk?
    
2. What is a canary deployment?
    
3. Why are feature flags powerful but dangerous?
    
4. Why must rollback be simple?
    
5. How do error budgets affect deployment speed?
    

---

## 14. Connection to Previous Lessons

- Observability monitors deployments.
    
- Tail latency reveals hidden regressions.
    
- Backpressure may mask issues temporarily.
    
- Error budgets limit risky changes.
    
- Incident response handles failed deployments.
    
- Distributed complexity increases blast radius.
    
- Capacity planning supports rollout scaling.
    

Change management is applied reliability economics.

---

## 15. Difficulty Calibration

You now understand:

- Deployment risk modeling
    
- Blast radius control
    
- Safe rollout patterns
    
- Observability-driven change
    
- Reliability governance
    

You are thinking like a production engineering organization.

---

Back to [[Engineering Foundations - Lesson 31]]