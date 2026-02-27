---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 4
---
Back to [[Engineering Foundations - Index]]

## Incident Response & Postmortems

This lesson builds on:

- SLIs, SLOs & Error Budgets
    
- Observability
    
- Tail Latency
    
- Reliability Patterns
    
- Distributed Failure Modes
    

We now answer:

> What should happen when production breaks?

---

## 1. Core Concept

An **incident** is:

> Any event that significantly degrades or disrupts service.

Examples:

- Checkout unavailable
    
- Latency exceeds SLO
    
- Error rate spikes
    
- Region outage
    
- Data inconsistency
    

Incidents are not personal failures.

They are system-level events.

---

## 2. Why This Matters

Distributed systems will fail.

Without structured response:

- Panic spreads
    
- Guessing replaces data
    
- Communication collapses
    
- Recovery slows
    
- Trust erodes
    

With structured response:

- Clear ownership
    
- Clear communication
    
- Fast mitigation
    
- Measured recovery
    
- Organizational learning
    

Incident response is a reliability mechanism.

---

## 3. The Incident Lifecycle
```text
Detection → Triage → Mitigation → Resolution → Postmortem
```
Each stage has a distinct purpose.

---

## 4. Detection

Incidents are detected through:

- SLO burn rate alerts
    
- Latency threshold breaches
    
- Error rate spikes
    
- Synthetic monitoring failures
    
- User reports
    

Detection depends on:

- Good SLIs
    
- Proper alert thresholds
    
- Observability maturity
    

Without measurement, detection is delayed.

---

## 5. Triage

Triage answers:

- Is this a real incident?
    
- What is the severity?
    
- What is the user impact?
    
- Which systems are involved?
    

Example severity levels:

- SEV1 → Critical outage
    
- SEV2 → Major degradation
    
- SEV3 → Minor impact
    

Clarity reduces chaos.

---

## 6. Mitigation

Mitigation means:

> Reducing user impact as quickly as possible.

It is not root cause fixing.

Examples:

- Roll back deployment
    
- Disable feature flag
    
- Scale horizontally
    
- Open circuit breaker
    
- Redirect traffic
    
- Fail over region
    

Speed over perfection.

---

## 7. Resolution

Resolution involves:

- Identifying root cause
    
- Restoring normal behavior
    
- Verifying stability
    
- Confirming SLO compliance
    

System returns to healthy state.

But the work is not finished.

---

## 8. Postmortems

A **postmortem** is:

> A structured review of the incident to extract learning.

Key principle:

Blameless analysis.

We do not ask:  
“Who broke it?”

We ask:  
“What conditions allowed this to happen?”

---

## 9. Structure of a Good Postmortem

A strong postmortem includes:

1. Timeline of events
    
2. User impact
    
3. Root cause
    
4. Contributing factors
    
5. What worked
    
6. What failed
    
7. Action items
    
8. Ownership & deadlines
    

The goal is systemic improvement.

---

## 10. Root Cause Thinking

Distributed failures rarely have one cause.

Example:

Database overload incident.

Root cause:  
Connection pool exhaustion.

Contributing factors:

- No timeout on downstream calls
    
- Retry storm amplified load
    
- Missing rate limiting
    
- Alert triggered too late
    

Failures cascade.

Postmortems uncover systemic weaknesses.

---

## 11. Error Budget Interaction

Incidents consume error budget.

If burn rate is high:

- Feature releases may pause
    
- Stability work is prioritized
    
- Risk tolerance decreases
    

Incident management ties directly to SLO discipline.

---

## 12. Applied Scenario

Latency p99 spikes to 4 seconds.

Error rate rises.  
Retries increase.

Questions:

- What immediate mitigation is applied?
    
- Do you scale?
    
- Do you shed load?
    
- Do you open circuit breakers?
    
- Do you roll back a deployment?
    

Mitigation stabilizes first.  
Root cause later.

---

## 13. Mini Exercise

Imagine:

A new deployment introduces subtle memory leak.

After 6 hours:  
Instances crash gradually.

Design the incident response flow:

1. How is it detected?
    
2. What severity?
    
3. What is first mitigation?
    
4. How is root cause confirmed?
    
5. What long-term fix is introduced?
    

Think in lifecycle stages.

---

## 14. Self-Test

Answer without scrolling:

1. What defines an incident?
    
2. Why is mitigation separate from root cause resolution?
    
3. What is a blameless postmortem?
    
4. Why do distributed failures rarely have a single cause?
    
5. How do incidents interact with error budgets?
    

---

## 15. Connection to Previous Lessons

- Observability enables detection.
    
- Tail latency breaches SLO.
    
- Retry storms amplify incidents.
    
- Backpressure limits blast radius.
    
- Consensus affects failover behavior.
    
- Sharding impacts outage scope.
    
- Error budgets quantify impact.
    

Incident response operationalizes distributed systems theory.

---

## 16. Difficulty Calibration

You now understand:

- Structured outage handling
    
- Mitigation vs resolution
    
- Systemic root cause analysis
    
- Organizational reliability maturity
    
- Failure as a learning tool
    

You are thinking at professional production-operations depth.

---

Back to [[Engineering Foundations - Lesson 28]]