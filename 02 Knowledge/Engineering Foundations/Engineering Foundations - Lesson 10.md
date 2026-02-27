---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 2
---
Back to [[Engineering Foundations - Index]]

# Scaling Models

---

## 1. Core Concept

Scaling means:

> Increasing system capacity to handle more load.

Load can mean:

- More users
    
- More data
    
- More requests
    
- More processing
    

There are two primary scaling models.

---

## 2. Vertical Scaling (Scale Up)

Vertical scaling means:

> Increase the power of a single machine.

Example:

- Add more CPU
    
- Add more RAM
    
- Upgrade to faster disk
    

Visual:
```text
[Server Small] → [Server Bigger] → [Server Even Bigger]
```
---

### Advantages

- Simple to implement
    
- No architectural changes required
    
- No distributed complexity
    

---

### Disadvantages

- Has a hard limit
    
- Downtime may be required for upgrades
    
- Expensive at higher tiers
    
- Single point of failure remains
    

---

## 3. Horizontal Scaling (Scale Out)

Horizontal scaling means:

> Add more machines instead of upgrading one.

Visual:
```text
[Server 1]  
[Server 2]  
[Server 3]  
[Server 4]
```
Load is distributed across servers.

---

### Advantages

- Can scale much further
    
- Better fault tolerance
    
- No single machine is critical
    
- Supports cloud-native architecture
    

---

### Disadvantages

- Requires stateless design
    
- Introduces coordination complexity
    
- Load balancing required
    
- Data synchronization becomes harder
    

---

## 4. Why Stateless Matters Again

Horizontal scaling works best when:

- Servers do not store local state
    
- Any server can handle any request
    

If servers hold session data locally:  
Horizontal scaling becomes difficult.

Lesson 8 now becomes practical.

---

## 5. Elasticity

Elasticity means:

> Scaling automatically based on demand.

Example:

- Traffic increases → Add servers
    
- Traffic decreases → Remove servers
    

Visual:
```text
Low Load → 2 Servers  
Medium Load → 5 Servers  
High Load → 15 Servers
```
This is common in cloud environments.

---

## 6. Trade-Off Reminder

Vertical scaling:

- Simpler
    
- Lower complexity
    
- Higher risk concentration
    

Horizontal scaling:

- Higher complexity
    
- More resilient
    
- More operational overhead
    

Lesson 3: no perfect solution.

---

## 7. Real Scenario

You run an online store.

Traffic spikes during promotions.

Option A:  
Upgrade server before sale.

Risk:  
If traffic exceeds capacity → crash.

Option B:  
Auto-scale horizontally.

Trade-offs:

- Handles unpredictable spikes
    

- More complex setup
    
- Higher monitoring requirements
    

Lesson 5: risk management.

---

## 8. Scaling and State

Databases are harder to scale horizontally.

Why?

Because:

- They store state
    
- They require consistency
    
- They must synchronize data
    

Web servers:

- Often stateless
    
- Easy to duplicate
    

This is why most systems scale:

- Application layer horizontally
    
- Database layer carefully
    

---

## 9. Bottlenecks Revisited

Remember Lesson 1:

A system is limited by its slowest component.

You can scale web servers infinitely,  
but if the database is slow,  
the system is still slow.

Scaling requires:

- Identifying the bottleneck first.
    

---

## 10. Scaling Is Not Just About Servers

You can scale:

- CPU
    
- Memory
    
- Storage
    
- Network throughput
    
- Database replicas
    
- Caching layers
    
- Message queues
    

Scaling is architectural, not just hardware.

---

## 11. Applied Exercise

You run a video streaming platform.

During peak hours:

- Users triple.
    
- Streaming buffers.
    
- Login becomes slow.
    

Questions:

1. Which layer is bottlenecked?
    
2. Is the problem CPU? Network? Database?
    
3. Would vertical scaling fix it?
    
4. Would horizontal scaling help?
    
5. Where does state live in this system?
    

This is architectural reasoning.

---

## 12. Self-Test

Answer without scrolling:

1. What is vertical scaling?
    
2. What is horizontal scaling?
    
3. Why is stateless design important for horizontal scaling?
    
4. What is elasticity?
    
5. Why can scaling one layer fail to solve performance issues?
    

---

## 13. Connection to Previous Lessons

- Systems Thinking identifies bottlenecks.
    
- Trade-offs determine scaling strategy.
    
- Stateless systems scale more easily.
    
- Idempotency supports retry in distributed scaling.
    
- Risk modeling explains why redundancy matters.
    
- Complexity increases with distributed systems.
    

You are now entering true infrastructure reasoning territory.

---

## 14. Difficulty Calibration

At this point, a learner can:

- Explain why cloud systems scale horizontally
    
- Understand why state is difficult
    
- Reason about architecture choices
    
- See trade-offs clearly
    

We are approaching distributed systems fundamentals.

---

Back to [[Engineering Foundations - Lesson 9]]