---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Consistency Models

This lesson builds directly on:

- Consistency & Replication Basics
    
- CAP Theorem
    
- Fault Tolerance
    
- State vs Stateless
    

We now go deeper into what “consistency” actually means.

---

## 1. Core Concept

A **consistency model** defines:

> The rules that determine when and how updates to data become visible to other users in a distributed system.

It answers:

- If I write data, when will others see it?
    
- Can two users see different values?
    
- In what order are updates applied?
    
- Can the system temporarily disagree?
    

Consistency is not binary.  
It exists on a spectrum.

---

## 2. Why This Matters

In distributed systems:

- Data is replicated.
    
- Networks introduce delay.
    
- Nodes may fail.
    
- Messages may arrive out of order.
    

Without a clear consistency model:

- You cannot reason about system behavior.
    
- You cannot design predictable user experiences.
    
- You cannot safely build distributed systems.
    

Consistency models define the “rules of truth” in a system.

---

## 3. The Consistency Spectrum

From strongest to weakest:
```text
Strong Consistency  
    ↓  
Read-After-Write  
    ↓  
Monotonic Reads  
    ↓  
Causal Consistency  
    ↓  
Eventual Consistency
```
Each step down reduces coordination requirements.

Each step down increases scalability and availability.

---

## 4. Strong Consistency

Guarantee:

After a successful write, all future reads return the updated value.

The system behaves as if:  
There is only one copy of the data.

Benefits:

- Predictable
    
- Safe for financial systems
    
- Easier reasoning
    

Costs:

- High coordination overhead
    
- Higher latency
    
- Reduced availability during partitions
    

Strong consistency often requires quorum or leader-based coordination.

---

## 5. Read-After-Write Consistency

Guarantee:

After you write something, you will immediately see your own update.

Others may not yet.

Example:  
You update your profile picture.  
You refresh.  
You see it.

But your friend might briefly see the old version.

This improves user experience without full strong consistency.

---

## 6. Monotonic Reads

Guarantee:

Once you see a value, you will never see an older value later.

Prevents “time travel” behavior.

Example:

You refresh a page.  
It shows version 5.

Later refresh:  
You will not suddenly see version 3.

This ensures forward progression.

---

## 7. Causal Consistency

Guarantee:

Related operations are seen in logical order.

Example:

You post:  
“I’m getting married.”

Then:  
“Wedding was amazing!”

It would be strange if someone saw the second post first.

Causal consistency preserves logical relationships between events.

Unrelated events may still appear in different orders.

---

## 8. Eventual Consistency

Guarantee:

If no new updates occur, all replicas will eventually converge to the same value.

There is no guarantee about when.

Temporary inconsistency is acceptable.

Common in:

- Social feeds
    
- Large-scale distributed systems
    
- Highly available NoSQL systems
    

---

## 9. Visual Model – Strong vs Eventual

Strong consistency:
```text
Write → All replicas update before response
```
Eventual consistency:
```text
Write → Replica A updates  
      → Replica B updates later  
      → Replica C updates later
```
Time creates temporary divergence.

---

## 10. Applied Scenario

You design:

A collaborative document editor.

Two users type simultaneously.

Questions:

- Who sees what first?
    
- What if updates arrive out of order?
    
- What if a network partition occurs?
    

Strong consistency may ensure correctness but increase latency.

Causal consistency may preserve logical order with better performance.

Now compare:

A product review counter.

Is strict consistency required?  
Probably not.

Eventual consistency is sufficient.

Context determines the model.

Lesson 3 applies again.

---

## 11. Mini Exercise

Consider two systems:

1. Online banking system
    
2. Social media “like” counter
    

For each:

- Which consistency model is appropriate?
    
- Why?
    
- What trade-offs are acceptable?
    

You should reach different conclusions.

---

## 12. Self-Test

Answer without scrolling:

1. What is a consistency model?
    
2. Why is consistency not binary?
    
3. What does strong consistency guarantee?
    
4. What is eventual consistency?
    
5. Why is causal consistency important in collaborative systems?
    
6. Why do stronger consistency models reduce availability or increase latency?
    

---

## 13. Connection to Previous Lessons

- Replication creates divergence.
    
- CAP explains the consistency vs availability trade-off.
    
- Fault tolerance introduces partitions.
    
- State complicates synchronization.
    
- Scaling increases distributed coordination.
    
- Trade-offs determine acceptable behavior.
    

Consistency models define how distributed systems behave under stress.

---

## 14. Difficulty Calibration

This lesson introduces:

- Formal behavioral guarantees
    
- Ordering logic
    
- Distributed timing awareness
    
- Coordination cost reasoning
    

If this feels logical — even if slightly abstract — you are progressing correctly through Phase 3.

---

Back to [[Engineering Foundations - Lesson 13]]