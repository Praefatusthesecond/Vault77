---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 4
---
Back to [[Engineering Foundations - Index]]

## MTTR, MTBF & Reliability Math

This lesson builds on:

- SLOs & SLIs
    
- Error Budgets
    
- Incident Response
    
- Capacity Planning
    
- Tail Latency
    
- Availability
    

We now answer:

> How do we mathematically reason about reliability?

---

## 1. Core Concept

Reliability can be expressed as a probability over time.

Two key metrics:
```text
MTTR – Mean Time To Recovery  
MTBF – Mean Time Between Failures
```
Together, they define system stability.

---

## 2. MTTR – Mean Time To Recovery

MTTR is:

> The average time it takes to restore service after an incident begins.

Formula:

MTTR = Total downtime / Number of incidents

Example:

3 outages:

- 10 minutes
    
- 20 minutes
    
- 30 minutes
    

Total = 60 minutes

MTTR = 60 / 3 = 20 minutes

Lower MTTR = faster recovery.

---

## 3. MTBF – Mean Time Between Failures

MTBF is:

> The average time between incident occurrences.

Formula:

MTBF = Total operational time / Number of incidents

Example:

System runs 30 days (~43,200 minutes)  
3 outages occurred

MTBF ≈ 43,200 / 3 ≈ 14,400 minutes

Higher MTBF = fewer failures.

---

## 4. Availability Formula

Availability can be approximated as:
```text
Availability = MTBF / (MTBF + MTTR)
```
This connects incident frequency and recovery speed.

---

### Example

If:

MTBF = 10,000 minutes  
MTTR = 10 minutes

Availability ≈ 10,000 / (10,010) ≈ 99.9%

Both frequency and recovery matter.

---

## 5. Key Insight

You can improve availability by:

- Increasing MTBF (fewer failures)
    
- Decreasing MTTR (faster recovery)
    

Sometimes improving MTTR is easier.

This is why:

Good incident response discipline is powerful.

---

## 6. Reliability vs Perfection

100% availability implies:

MTTR = 0  
or  
MTBF = ∞

Neither is realistic.

SRE accepts:

Failure is normal.  
Recovery speed is controllable.

---

## 7. MTTR and Change Management

Fast rollback reduces MTTR.

Good monitoring reduces detection time.

Clear incident roles reduce confusion time.

Automated recovery reduces human delay.

MTTR improvement often yields large reliability gains.

---

## 8. MTBF and System Design

Increasing MTBF involves:

- Better testing
    
- Safer deployments
    
- Redundancy
    
- Capacity planning
    
- Reduced blast radius
    
- Removing single points of failure
    

Distributed system discipline increases MTBF.

---

## 9. Visual Model – Reliability Trade-Off
```text
High MTBF + Low MTTR → High Availability  
Low MTBF + Low MTTR → Moderate Availability  
High MTBF + High MTTR → Moderate Availability  
Low MTBF + High MTTR → Poor Availability
```
Both axes matter.

---

## 10. Real-World Example

Two teams:

Team A:

- Rare outages
    
- Takes 3 hours to fix
    

Team B:

- Slightly more frequent outages
    
- Fixes within 5 minutes
    

Which is more reliable?

Math answers this, not intuition.

---

## 11. Relationship to Error Budgets

Each outage:

Consumes error budget.

MTTR affects how fast budget is consumed.  
MTBF affects how often budget is consumed.

Reliability math connects directly to SLO discipline.

---

## 12. Latency vs Availability

Important distinction:

Availability:  
Binary success/failure.

Latency SLO:  
Performance degradation counts as failure if threshold exceeded.

High tail latency can reduce effective availability.

Lesson 21 returns here.

---

## 13. Mini Exercise

System runs 7 days (10,080 minutes).

It has:

2 outages:

- 15 minutes
    
- 5 minutes
    

Total downtime = 20 minutes.

Calculate:

1. MTTR
    
2. MTBF
    
3. Availability percentage
    

Then compare to SLO of 99.9%.

---

## 14. Self-Test

Answer without scrolling:

1. What is MTTR?
    
2. What is MTBF?
    
3. How is availability calculated from them?
    
4. Why can reducing MTTR dramatically improve reliability?
    
5. Why is 100% availability unrealistic?
    

---

## 15. Connection to Previous Lessons

- Incident response reduces MTTR.
    
- Change discipline increases MTBF.
    
- Capacity planning prevents overload failures.
    
- Tail latency impacts effective availability.
    
- Error budgets measure allowed failure.
    
- Observability reduces detection time.
    
- Backpressure reduces cascade duration.
    

Reliability math formalizes operational maturity.

---

## 16. Difficulty Calibration

You now understand:

- Statistical reliability modeling
    
- Availability economics
    
- Recovery optimization strategy
    
- Incident frequency vs severity trade-offs
    
- How operational discipline impacts math
    

You are thinking quantitatively about reliability.

---

Back to [[Engineering Foundations - Lesson 32]]