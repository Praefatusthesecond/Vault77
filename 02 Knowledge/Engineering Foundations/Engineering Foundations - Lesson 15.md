---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Quorum & Majority Systems

This lesson builds directly on:

- Consistency Models
    
- CAP Theorem
    
- Replication Basics
    
- Fault Tolerance
    

We now answer:

> How do distributed systems agree on truth?

---

## 1. Core Concept

A **quorum** is:

> The minimum number of nodes that must agree for an operation to be considered valid.

In most systems, quorum means:

> A majority of nodes.

If you have 3 replicas:

- Majority = 2
    

If you have 5 replicas:

- Majority = 3
    

Quorum prevents “split brain” scenarios.

---

## 2. Why This Matters

In replicated systems:

- Multiple nodes store data.
    
- Nodes may fail.
    
- Networks may partition.
    
- Messages may be delayed.
    

Without a quorum rule:

Two partitions could both accept writes.  
Now you have two “truths.”

Quorum enforces controlled agreement.

---

## 3. Visual Model – 3 Node Cluster
```text
Node A  
Node B  
Node C
```
Majority = 2 nodes.

To accept a write:  
At least 2 nodes must confirm it.

If one node fails:  
The remaining 2 can still operate.

Fault tolerance maintained.

---

## 4. How Quorum Preserves Consistency

Suppose:

Network partition divides nodes:
```text
Node A  |  Node B  
         |  
         |  Node C
```
If A is alone on one side,  
and B + C are together:

Only B + C have majority.

So:

- B + C continue accepting writes.
    
- A cannot accept writes.
    

This prevents conflicting updates.

Consistency preserved.

Availability sacrificed for minority partition.

CAP in action.

---

## 5. Read and Write Quorums

Many systems define:

- Write quorum (W)
    
- Read quorum (R)
    
- Total replicas (N)
    

To guarantee strong consistency:

> R + W > N

This ensures overlap.

Example:

N = 3  
W = 2  
R = 2

Since 2 + 2 > 3  
Strong consistency is possible.

Why?

Because any read will intersect with at least one node that has the latest write.

---

## 6. Trade-Off Reminder

Larger quorum:

- Stronger consistency
    

- Higher latency
    
- Lower availability during failure
    

Smaller quorum:

- Higher availability
    
- Faster operations
    

- Weaker consistency
    

Trade-offs never disappear.

---

## 7. Real-World Example

Distributed databases like:

- Cassandra
    
- Dynamo-style systems
    
- Many modern NoSQL databases
    

Allow configurable quorum settings.

You can tune:

- Stronger consistency
    
- Or higher availability
    

Depending on workload.

---

## 8. Split-Brain Problem

Split brain occurs when:

Two partitions both believe they are authoritative.

Without quorum:

Partition A writes version 5.  
Partition B writes version 6.

When partition heals:  
Conflict.

Quorum prevents minority partitions from accepting writes.

---

## 9. Applied Scenario

You operate a distributed configuration service.

3 nodes.

Network isolates one node.

Question:

Should the isolated node:

- Continue accepting configuration changes?
    
- Or reject them?
    

If it continues:  
You risk conflicting system states.

If it rejects:  
You sacrifice availability for safety.

Which do you choose?

Depends on context.

---

## 10. Mini Exercise

Imagine:

5 database replicas across regions.

Two regions go offline.

Can system continue?

Majority = 3.

If only 3 nodes remain reachable:  
Yes.

If only 2 remain:  
No.

Now think:

Is that acceptable for your business?

---

## 11. Self-Test

Answer without scrolling:

1. What is a quorum?
    
2. Why is majority commonly used?
    
3. How does quorum prevent split-brain?
    
4. Why does R + W > N matter?
    
5. What happens if a minority partition continues accepting writes?
    

---

## 12. Connection to Previous Lessons

- Replication creates multiple copies.
    
- Consistency models define visibility rules.
    
- CAP defines partition trade-offs.
    
- Fault tolerance requires safe failure handling.
    
- Risk modeling defines acceptable downtime.
    
- Scaling increases distributed nodes.
    

Quorum is the mechanism that enforces consistency under partition.

---

## 13. Difficulty Calibration

This lesson introduces:

- Formal distributed coordination rules
    
- Mathematical reasoning (R + W > N)
    
- Partition behavior modeling
    

If this feels:

- Logical but heavier → Perfect progression.
    
- Clear but abstract → Good.
    
- Overwhelming → We reinforce with applied scenarios.
    

---

Next logical step:

👉 Consensus Basics (Leader Election & Agreement)

This explains how systems decide _who is allowed to write_.

We are now entering serious distributed systems territory.

---

Back to [[Engineering Foundations - Lesson 14]]