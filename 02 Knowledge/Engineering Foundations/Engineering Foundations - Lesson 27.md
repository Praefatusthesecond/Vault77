---
type: Course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 4
---
Back to [[Engineering Foundations - Index]]

## Reliability, SLIs, SLOs & SLAs

This lesson builds on:

- Observability
    
- Tail Latency
    
- Fault Tolerance
    
- Risk & Trade-Off Analysis
    
- Backpressure
    
- Distributed Failures
    

We now answer:

> What does “reliable” actually mean?

---

## 1. Core Concept

Reliability is not:

> “The system never fails.”

Reliability is:

> The probability that a system performs its intended function under stated conditions for a specified period of time.

In simpler terms:

How often does the system work as expected?

And what level of failure is acceptable?

---

## 2. Why This Matters

Every system fails sometimes.

Engineering is not about eliminating failure.  
It is about:

- Measuring failure
    
- Defining acceptable limits
    
- Managing trade-offs
    
- Allocating engineering effort wisely
    

Without measurement:  
Reliability discussions become emotional and subjective.

With measurement:  
They become mathematical and economic.

---

# 3️. The Three Core Terms
```text
SLI – Service Level Indicator  
SLO – Service Level Objective  
SLA – Service Level Agreement
```
These terms structure reliability discipline.

---

## 4. SLI – Service Level Indicator

An SLI is:

> A measurable indicator of system performance.

Examples:

- Request success rate
    
- Request latency (p95, p99)
    
- Error rate
    
- Availability percentage
    
- Throughput
    

SLIs are raw measurements.

They come from observability systems.

Lesson 20 returns here.

---

## 5. SLO – Service Level Objective

An SLO is:

> A target value for an SLI.

Example:

- 99.9% of requests succeed over 30 days
    
- 95% of requests complete under 200ms
    
- Checkout error rate below 0.1%
    

SLO defines acceptable reliability.

This is internal to engineering teams.

---

## 6. SLA – Service Level Agreement

An SLA is:

> A formal contract defining consequences if objectives are not met.

Example:

- 99.5% uptime guaranteed
    
- Financial penalty if violated
    

SLA is external.  
SLO is internal target.  
SLI is measurement.

---

## 7. Visual Relationship
```text
SLI → Measurement  
SLO → Target  
SLA → Contract
```
---

## 8. Availability Example

System runs 30 days.

Total minutes in 30 days:

≈ 43,200 minutes

If SLO = 99.9% availability

Allowed downtime:

0.1% of 43,200 = 43.2 minutes

This is your **error budget**.

---

## 9. Error Budget (Critical Concept)

Error budget =

> The amount of failure you are allowed before violating your SLO.

If you exceed it:

- You stop feature releases.
    
- You prioritize reliability.
    
- You stabilize the system.
    

Error budgets align reliability with business trade-offs.

Lesson 3 returns again.

---

## 10. Why 100% Reliability Is Bad

If you target 100%:

- You never deploy.
    
- You over-engineer.
    
- You block innovation.
    
- You increase cost infinitely.
    

Every system has acceptable failure tolerance.

Engineering is balancing:

- Velocity
    
- Stability
    
- Cost
    
- Risk
    

---

## 11. Applied Scenario

You run a checkout service.

Business wants:

“Zero downtime.”

You respond:

“At what cost?”

99.99% vs 99.9%:

- 99.9% = ~43 minutes downtime per month
    
- 99.99% = ~4 minutes
    
- 99.999% = ~26 seconds
    

Each extra “9” increases:

- Redundancy requirements
    
- Complexity
    
- Cost
    
- Operational burden
    

Reliability is economic.

---

## 12. Choosing the Right SLI

Bad SLI:

CPU usage.

Good SLI:

User-visible success rate.

SLIs should reflect:

What users care about.

Not internal implementation metrics.

---

## 13. Mini Exercise

You operate:

A video streaming platform.

What are good SLIs?

- Playback success rate?
    
- Start-up latency?
    
- Buffering ratio?
    
- Resolution quality?
    

Now define reasonable SLOs.

What failure is acceptable?

---

## 14. Self-Test

Answer without scrolling:

1. What is reliability?
    
2. What is an SLI?
    
3. What is an SLO?
    
4. What is an SLA?
    
5. What is an error budget?
    
6. Why is 100% reliability unrealistic?
    

---

## 15. Connection to Previous Lessons

- Observability provides SLIs.
    
- Tail latency defines user experience.
    
- Backpressure protects error budgets.
    
- CAP trade-offs affect availability.
    
- Scaling impacts reliability.
    
- Risk modeling defines acceptable failure.
    
- Distributed failures consume error budgets.
    

Reliability is the measurable discipline built on distributed systems.

---

## 16. Difficulty Calibration

You are now thinking in:

- Probability
    
- Budgeted failure
    
- Engineering economics
    
- Operational accountability
    

This is the beginning of professional reliability engineering.

---

Back to [[Engineering Foundations - Phase 3 Summary]]

Back to [[Engineering Foundations - Lesson 26]]