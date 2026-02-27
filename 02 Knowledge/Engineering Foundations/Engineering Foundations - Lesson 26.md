---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Reliability Patterns: Timeouts, Retries & Circuit Breakers

This lesson builds on:

- Backpressure & Load Shedding
    
- Tail Latency
    
- Event-Driven Systems
    
- Idempotency
    
- Network Partitions
    
- Observability
    

We now answer:

> How do distributed systems avoid collapsing under failure?

---

## 1. Core Concept

In distributed systems:

Failures are normal.  
Latency spikes are normal.  
Dependencies fail.  
Networks partition.

Reliability patterns are defensive mechanisms that:

> Prevent small failures from becoming system-wide disasters.

Three core patterns:

Timeouts  
Retries  
Circuit Breakers

---

## 2. Timeouts

### What Is a Timeout?

A timeout is:

> A limit on how long a system waits for a response.

Without timeouts:

- Requests hang forever.
    
- Resources remain allocated.
    
- Thread pools fill.
    
- System eventually collapses.
    

---

### Visual Model – No Timeout
```text
Service A → Service B (slow)  
        ↓ waits indefinitely  
Resources exhausted  
System stalls
```
---

### With Timeout
```text
Service A → Service B  
        ↓  
If no response in 200ms → Fail fast
```
Failing fast protects the system.

---

## 3. Retries

### What Is a Retry?

A retry is:

> Re-attempting a failed request.

Retries are powerful because:

- Many failures are transient.
    
- Network glitches resolve.
    
- Temporary overload recovers.
    

But retries are dangerous.

---

### Retry Storm Problem

If Service B slows down:

Service A retries.  
Service C retries.  
Service D retries.

Now B receives more traffic.

Overload worsens.

Cascading failure begins.

Retries amplify load.

---

### Smart Retries

Good retry strategy includes:

- Exponential backoff
    
- Jitter (randomized delay)
    
- Retry limits
    
- Idempotent operations
    

Retries must be controlled.

---

## 4. Circuit Breakers

### What Is a Circuit Breaker?

A circuit breaker:

> Stops sending requests to a failing service temporarily.

Instead of:

Continuing to send traffic to a broken dependency,

System “opens” the circuit.

---

### Circuit Breaker States

1. Closed → Normal operation
    
2. Open → Stop calls immediately
    
3. Half-open → Test recovery
    

Visual:
```text
Closed → (Failures exceed threshold) → Open  
Open → (After timeout) → Half-Open  
Half-Open → Success → Closed
```
This prevents overload escalation.

---

## 5. Why These Patterns Work Together

Timeouts:  
Prevent infinite waiting.

Retries:  
Recover from transient failure.

Circuit breakers:  
Prevent retry amplification.

Together:  
They stabilize distributed systems.

---

## 6. Interaction With Tail Latency

If tail latency spikes:

Without timeout:  
Threads accumulate.  
Queue grows.  
System collapses.

With timeout:  
Slow requests fail quickly.  
System survives.

Tail latency mitigation depends on timeouts.

---

## 7. Interaction With Backpressure

Backpressure slows intake.

Timeouts and circuit breakers prevent saturation.

Together:  
They prevent cascading failures.

These patterns form a defensive perimeter.

---

## 8. Trade-Off Reminder

Fail fast patterns:

- Protect system
    
- Improve resilience
    
- Prevent cascading collapse
    

But:

- Increase error rate
    
- May reject recoverable requests
    
- Require tuning
    
- Add operational complexity
    

Trade-offs never disappear.

---

## 9. Applied Scenario

Microservice architecture:

Service A → Payment Service → Fraud Service

Fraud Service slows.

Without patterns:

- Payment service blocks
    
- A blocks
    
- Entire checkout fails
    

With patterns:

- Timeout triggers
    
- Circuit breaker opens
    
- Payment temporarily bypasses fraud (policy decision)
    
- System degrades gracefully
    

Engineering = controlled degradation.

---

## 10. Failure Amplification Example

No limits:

1 failure → 10 retries  
10 retries → 100 retries  
100 retries → service collapse

This is exponential amplification.

Retries must be bounded.

---

## 11. Mini Exercise

You design an API calling external weather service.

Questions:

1. Should you retry?
    
2. How many times?
    
3. With what delay?
    
4. What happens if dependency is down for 10 minutes?
    
5. Do you fail fast or block?
    

There is no universal answer.

Context defines policy.

---

## 12. Self-Test

Answer without scrolling:

1. Why are timeouts necessary?
    
2. How can retries cause cascading failure?
    
3. What problem does a circuit breaker solve?
    
4. Why must retries use exponential backoff?
    
5. How do reliability patterns interact with tail latency?
    

---

## 13. Connection to Previous Lessons

- Backpressure protects capacity.
    
- Tail latency increases retry risk.
    
- Event-driven systems rely on idempotent retries.
    
- CAP defines behavior during partition.
    
- Consensus may block under partition.
    
- Observability detects failure patterns.
    
- Risk modeling guides timeout thresholds.
    

Reliability patterns are the operational glue of distributed systems.

---

## 14. Difficulty Calibration

You now understand:

- Defensive distributed architecture
    
- Failure containment
    
- Amplification dynamics
    
- Retry economics
    
- Controlled degradation
    

You are thinking at real production incident level.

---

Back to [[Engineering Foundations - Lesson 25]]