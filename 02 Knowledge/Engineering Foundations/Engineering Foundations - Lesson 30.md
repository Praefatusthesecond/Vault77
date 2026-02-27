---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 4
---
Back to [[Engineering Foundations - Index]]

## Capacity Planning

This lesson builds on:

- Scaling Models
    
- Backpressure & Load Shedding
    
- Tail Latency
    
- SLIs & SLOs
    
- Error Budgets
    
- Incident Response
    

We now answer:

> How do we ensure the system can handle future demand?

---

## 1. Core Concept

Capacity planning is:

> The process of predicting future resource needs and ensuring sufficient system capacity to meet SLOs.

It is proactive reliability engineering.

Instead of waiting for overload,  
we forecast and prepare.

---

## 2. Why This Matters

Without capacity planning:

- Traffic spikes cause outages.
    
- Latency grows unexpectedly.
    
- Error budgets burn quickly.
    
- Scaling becomes reactive.
    
- Costs spiral unpredictably.
    

With capacity planning:

- Growth is controlled.
    
- Performance is predictable.
    
- Reliability remains stable.
    
- Business scaling is supported.
    

---

## 3. Core Dimensions of Capacity

Capacity planning typically considers:
```text
Compute (CPU)  
Memory  
Storage  
Network throughput  
Concurrency  
Request rate (RPS)  
Latency
```
Capacity is multi-dimensional.

One bottleneck defines failure.

---

## 4. Demand vs Capacity

Visual model:
```text
Demand ↑  
Capacity Line ─────────
```
When demand exceeds capacity:

- Queues form
    
- Latency rises
    
- Retries increase
    
- Cascading failure risk grows
    

Capacity must stay above peak demand.

---

## 5. Types of Capacity Planning

### 1. Reactive Scaling

Scale after overload.

Risk:  
SLO violations occur first.

---

### 2. Predictive Scaling

Use historical data trends.

Example:

Traffic grows 10% per month.

Forecast 6 months ahead.  
Provision accordingly.

---

### 3. Event-Based Planning

Plan for:

- Black Friday
    
- Product launches
    
- Marketing campaigns
    
- Seasonal peaks
    

These spikes are predictable.

---

## 6. Headroom (Critical Concept)

Headroom is:

> Extra unused capacity reserved to absorb spikes.

Example:

If average CPU is 60%,  
and peak is 75%,  
you may aim for 50% normal load.

Headroom protects against:

- Traffic spikes
    
- Latency amplification
    
- Retry storms
    

Distributed systems require safety margins.

---

## 7. Connection to Tail Latency

As utilization approaches 100%:

Latency increases non-linearly.

Small load increases → huge latency spikes.

This is queueing theory in action.

High utilization = high tail latency risk.

Capacity planning reduces tail risk.

---

## 8. Capacity & Error Budgets

If system frequently runs near limits:

- Small spikes cause outages.
    
- Error budget burns quickly.
    

Capacity planning protects reliability targets.

---

## 9. Real-World Example

E-commerce platform.

Average traffic:  
10,000 RPS.

Flash sale:  
80,000 RPS.

Without planning:  
System collapses.

With planning:

- Pre-scale instances
    
- Add queue capacity
    
- Warm caches
    
- Increase database replicas
    

Reliability preserved.

---

## 10. Scaling Limits

Important reality:

Scaling is not infinite.

Constraints include:

- Database write throughput
    
- Lock contention
    
- Network bandwidth
    
- External API limits
    
- Cloud quotas
    

Capacity planning must include dependency limits.

---

## 11. Cost Consideration

Capacity planning is also financial planning.

Over-provision:

- Safe
    

- Expensive
    

Under-provision:

- Cheap
    

- Risky
    

Reliability economics applies again.

Lesson 28 returns here.

---

## 12. Applied Scenario

Your API runs at:

70% CPU average  
p95 latency stable

Marketing announces new campaign next week.

Questions:

1. Expected traffic increase?
    
2. Do you add headroom?
    
3. Do you run load tests?
    
4. Do you increase database replicas?
    
5. What SLIs must be monitored closely?
    

Plan before spike, not during.

---

## 13. Mini Exercise

Imagine:

Your service handles 1,000 RPS.  
Each request consumes 5ms CPU.

How many CPU cores are needed?

Now traffic doubles.

What happens if scaling lags 5 minutes?

Think in capacity + latency + retry behavior.

---

## 14. Self-Test

Answer without scrolling:

1. What is capacity planning?
    
2. Why is headroom important?
    
3. Why does high utilization increase tail latency?
    
4. How does capacity planning protect error budgets?
    
5. Why must dependency limits be considered?
    

---

## 15. Connection to Previous Lessons

- Scaling distributes load.
    
- Backpressure protects during overload.
    
- Tail latency spikes under saturation.
    
- Observability reveals capacity limits.
    
- Error budgets define acceptable failure.
    
- Incident response handles under-provision.
    
- Trade-offs govern cost vs reliability.
    

Capacity planning is proactive reliability engineering.

---

## 16. Difficulty Calibration

You now understand:

- Predictive scaling
    
- Headroom strategy
    
- Performance saturation dynamics
    
- Capacity vs cost trade-offs
    
- Distributed bottleneck identification
    

You are thinking like a production reliability engineer.

---

Back to [[Engineering Foundations - Lesson 29]]