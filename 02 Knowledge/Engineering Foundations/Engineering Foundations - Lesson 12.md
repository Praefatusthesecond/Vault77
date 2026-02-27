---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 2
---
Back to [[Engineering Foundations - Index]]

## Consistency & Replication Basics

This lesson builds directly on:

- Fault Tolerance & Redundancy
    
- Scaling Models
    
- State vs Stateless
    

We now examine the hidden cost of redundancy: keeping data synchronized.

---

## 1. Core Concept

### What Is Replication?

Replication means:

> Keeping multiple copies of the same data in different places.

Examples:

- Primary database + replica
    
- Data stored in multiple regions
    
- Distributed caches
    

Why replicate?

- Improve fault tolerance
    
- Increase read performance
    
- Reduce latency globally
    
- Distribute load
    

---

### What Is Consistency?

Consistency means:

> All users see the same data at the same time.

If two replicas disagree about the value of something, consistency is broken.

---

## 2. Why This Matters

Once you introduce:

- Redundancy
    
- Horizontal scaling
    
- Geographic distribution
    

You introduce replication.

Once you introduce replication:

You introduce the possibility of disagreement between copies.

And disagreement is not rare — it is normal.

---

## 3. Visual Model – Single vs Replicated

Single database:
```text
User → Database
```
Simple.  
One source of truth.
```text
Replicated database:

          → Replica A  
User →  
          → Replica B
```
Now:

- Updates must synchronize.
    
- Synchronization takes time.
    
- Time creates inconsistency windows.
    

---

## 4. Strong vs Eventual Consistency

There are two broad approaches.

---

### Strong Consistency

After a write:

- All future reads return the updated value immediately.
    

Benefits:

- No conflicting data
    
- Predictable behavior
    

Costs:

- Slower writes
    
- More coordination
    
- Higher latency
    
- Reduced availability during network issues
    

---

### Eventual Consistency

After a write:

- Some users may temporarily see older data.
    
- Over time, replicas synchronize.
    

Benefits:

- Faster performance
    
- Higher availability
    
- Better scalability
    

Costs:

- Temporary inconsistencies
    
- Possible stale reads
    

---

## 5. Real IT Example

Social media likes.

You like a post.  
Your friend refreshes.

Does it update instantly?

Sometimes.  
Sometimes not.

That system likely favors availability and speed over strict consistency.

Now compare with banking transactions.

Delayed balance updates are unacceptable.

Context determines consistency model.

---

## 6. Why Replication Increases Complexity

Replication introduces:

- Synchronization delays
    
- Conflict resolution
    
- Network partitions
    
- Ordering problems
    
- Split-brain scenarios
    

Redundancy improves fault tolerance.  
But consistency becomes harder.

Lesson 3 again: trade-offs.

---

## 7. Applied Scenario

You are designing an online store.

Only 1 item left in stock.

Two users buy at the same time.

If replicas are slightly out of sync:

- Both may see “1 available.”
    
- Both may purchase.
    

Now you oversold.

How do you prevent this?

- Locking?
    
- Strong consistency?
    
- Reservation system?
    
- Accept occasional oversell?
    

Engineering is choosing which risk to accept.

---

## 8. Mini Exercise

Think about:

A messaging app.

If messages arrive slightly delayed,  
is that acceptable?

Now think about:

A financial transaction system.

Is delay acceptable?

Why or why not?

You are learning to match consistency model to context.

---

## 9. Self-Test

Answer without scrolling:

1. What is replication?
    
2. What is consistency?
    
3. Why does replication create consistency challenges?
    
4. What is eventual consistency?
    
5. Why does strong consistency reduce availability or performance?
    

---

## 10. Connection to Previous Lessons

- Redundancy creates replication.
    
- State requires synchronization.
    
- Scaling increases distributed complexity.
    
- Trade-offs determine consistency choice.
    
- Risk modeling defines acceptable inconsistency.
    
- Complexity grows with coordination mechanisms.
    

We are now standing at the threshold of distributed systems theory.

---

## 11. Difficulty Calibration

This lesson introduces:

- Distributed coordination
    
- Synchronization cost
    
- Latency implications
    
- Architectural policy decisions
    

If this felt logical (even if heavier),  
you are ready for Phase 3.

Next logical lesson:

👉 CAP Theorem

That is the formalization of the trade-offs we just explored.

---

[[Engineering Foundations - Phase 2 Summary]]

---

Back to [[Engineering Foundations - Lesson 11]]