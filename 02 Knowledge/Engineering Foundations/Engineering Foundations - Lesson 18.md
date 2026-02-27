---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Backpressure & Load Shedding

This lesson builds on:

- Scaling Models
    
- Fault Tolerance
    
- Network Partitions
    
- Risk & Uncertainty
    
- Systems Thinking
    

We now explore:

> What happens when demand exceeds capacity?

---

## 1. Core Concept

### Backpressure

Backpressure is:

> A mechanism that slows down incoming work when a system is overloaded.

Instead of crashing,  
the system pushes back.

---

### Load Shedding

Load shedding is:

> Intentionally dropping or rejecting work to protect system stability.

Instead of trying to handle everything,  
the system sacrifices some requests to survive.

---

## 2. Why This Matters

When systems receive more load than they can process:

Three things can happen:

1. They slow down gradually.
    
2. They fail catastrophically.
    
3. They degrade gracefully.
    

Good engineering aims for option 3.

Overload is inevitable:

- Traffic spikes
    
- Sudden popularity
    
- Misconfigured clients
    
- DDoS attacks
    
- Dependency slowdown
    

If you don’t design for overload,  
your system collapses unpredictably.

---

## 3. Visual Model – Overload Without Control
```text
Incoming Requests → Server → Queue grows → Memory fills → Crash
```
No backpressure.  
No limits.  
Eventual failure.

---

## 4. Visual Model – Backpressure
```text
Incoming Requests → Server  
        ↓  
If capacity reached → Slow intake / signal upstream
```
The system communicates:

“I am at capacity.”

Upstream components slow down.

This stabilizes the system.

---

## 5. Load Shedding Model
```text
Incoming Requests  
        ↓  
Capacity reached  
        ↓  
Reject excess requests  
        ↓  
System remains stable
```
Some users get errors.  
But the system survives.

This is controlled sacrifice.

---

## 6. Real-World Examples

### Web Servers

Return:

- HTTP 503 (Service Unavailable)
    

Instead of:

- Hanging indefinitely
    
- Consuming all memory
    

---

### Rate Limiting

API limits requests per second.

Excess requests rejected.

Prevents one client from overwhelming system.

---

### Circuit Breakers

If downstream dependency fails:

Stop sending requests temporarily.

Prevents cascading failure.

---

## 7. Why Overload Is Dangerous

Without protection:

- Latency increases
    
- Queues grow
    
- Memory usage spikes
    
- Timeouts cascade
    
- Retry storms amplify load
    
- Entire system crashes
    

This is called cascading failure.

Distributed systems amplify overload.

---

## 8. Trade-Off Reminder

Backpressure and load shedding:

- Preserve core functionality
    
- Prevent total collapse
    
- Improve resilience
    

But:

- Some requests fail
    
- Users may see errors
    
- Metrics may show degraded performance
    

Again:

You choose which failure mode is acceptable.

---

## 9. Applied Scenario

You operate an online ticketing system.

Concert goes live.  
Traffic spikes 50x normal.

Without limits:  
System crashes.

With rate limiting:  
Some users receive “Please wait.”  
System survives.

Which is better?

Temporary frustration  
or  
Total outage?

Lesson 5 + Lesson 3 combined.

---

## 10. Connection to Scaling

Scaling handles predictable growth.

Backpressure handles sudden spikes.

You cannot scale infinitely in real time.

Elastic systems still have limits.

Backpressure bridges the gap.

---

## 11. Mini Exercise

Imagine:

A microservices system.

Service A calls Service B.

Service B slows down.

What happens to A?

Without backpressure:  
A queues requests.  
Eventually crashes.

With backpressure:  
A slows or rejects new requests.

Which design is safer?

---

## 12. Self-Test

Answer without scrolling:

1. What is backpressure?
    
2. What is load shedding?
    
3. Why is overload inevitable?
    
4. What happens without overload control?
    
5. Why is rejecting requests sometimes better than accepting them?
    

---

## 13. Connection to Previous Lessons

- Scaling increases capacity.
    
- Fault tolerance handles failure.
    
- Partitions cause degraded capacity.
    
- Consistency requires coordination.
    
- Risk modeling anticipates spikes.
    
- Trade-offs define acceptable degradation.
    

Backpressure protects distributed systems from self-destruction.

---

## 14. Difficulty Calibration

You can now reason about:

- Cascading failures
    
- Retry storms
    
- Rate limiting
    
- Graceful degradation
    
- Capacity limits
    

You are thinking at production-system depth.

---

Back to [[Engineering Foundations - Lesson 17]]