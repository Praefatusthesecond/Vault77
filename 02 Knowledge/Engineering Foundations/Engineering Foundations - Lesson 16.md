---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Consensus Basics (Leader Election & Agreement)

This lesson builds on:

- Quorum & Majority Systems
    
- Consistency Models
    
- CAP Theorem
    
- Fault Tolerance
    

We now address:

> How do distributed systems agree on a single truth when failures occur?

---

## 1. Core Concept

**Consensus** means:

> Multiple distributed nodes agree on the same value, even in the presence of failures.

This usually includes two parts:

1. Leader Election
    
2. Log Replication / Agreement
    

Consensus ensures:

- Only one authority at a time
    
- Ordered updates
    
- Safe state transitions
    

---

## 2. Why This Matters

Without consensus:

- Multiple nodes might act as leader.
    
- Conflicting updates occur.
    
- State diverges.
    
- Split-brain becomes permanent corruption.
    

Consensus is the mechanism that keeps distributed state coherent.

---

## 3. Leader Election

In many distributed systems:

- One node becomes leader.
    
- Others become followers.
    

Leader responsibilities:

- Accept writes
    
- Coordinate updates
    
- Replicate changes
    

Followers:

- Accept instructions
    
- Mirror state
    
- Vote in elections
    

If leader fails:  
A new leader must be elected.

---

## 4. Visual Model – Leader-Based System
```text
        Leader  
       /   |   \  
Follower Follower Follower
```
All writes go through the leader.

This simplifies ordering.

But introduces a need for safe leader replacement.

---

## 5. The Leader Failure Scenario

Leader crashes.

What happens?

Followers must:

1. Detect failure.
    
2. Start election.
    
3. Vote.
    
4. Promote new leader.
    
5. Ensure latest state is preserved.
    

If done incorrectly:

Two leaders may exist.  
State diverges.  
System corrupts.

This is why consensus algorithms are complex.

---

## 6. Agreement on Order

In distributed systems:

Order matters.

Example:

- Transfer $100
    
- Then transfer $50
    

If order reverses,  
results differ.

Consensus ensures:

All nodes apply operations in the same order.

This is often done using a replicated log.

---

## 7. Visual Model – Replicated Log
```text
Leader Log:  
1. Write A  
2. Write B  
3. Write C  
  
Followers replicate:  
4. Write A  
5. Write B  
6. Write C
```
All nodes maintain identical ordered history.

Agreement on order = agreement on state.

---

## 8. Famous Consensus Algorithms

You do not need to know internals yet,  
but awareness is important.

Examples:

- Raft
    
- Paxos
    
- Multi-Paxos
    

Modern systems like:

- etcd
    
- Kubernetes control plane
    
- Distributed databases
    

Use consensus internally.

---

## 9. Trade-Off Reminder

Consensus:

- Strong consistency
    
- Safe leader transitions
    
- Prevents split-brain
    

But:

- Adds coordination overhead
    
- Adds latency
    
- Reduces availability during partition
    
- Complex to implement
    

Lesson 3 still governs everything.

---

## 10. Applied Scenario

You are designing:

A distributed configuration system.

Only one configuration version must be active at a time.

If two leaders accept conflicting updates:

Some servers get version A.  
Some get version B.

System becomes inconsistent.

Consensus ensures:

Only one version is authoritative.

---

## 11. Mini Exercise

Imagine:

5-node cluster.

Leader fails.

2 nodes cannot communicate with 3 nodes due to partition.

Which side elects leader?

Majority side (3 nodes).

Why?

Because quorum must be preserved.

What happens to minority side?

They cannot safely accept writes.

CAP + Quorum + Consensus all connect here.

---

## 12. Self-Test

Answer without scrolling:

1. What is consensus?
    
2. Why is leader election needed?
    
3. Why does order of operations matter?
    
4. What happens if two leaders exist?
    
5. Why does consensus reduce availability during partition?
    

---

## 13. Connection to Previous Lessons

- Quorum defines majority agreement.
    
- CAP defines partition trade-offs.
    
- Replication requires coordination.
    
- State must remain ordered.
    
- Risk modeling defines acceptable downtime.
    
- Fault tolerance requires safe recovery.
    

Consensus is the enforcement mechanism behind strong consistency.

---

## 14. Difficulty Calibration

This lesson introduces:

- Distributed coordination logic
    
- Ordered replication
    
- Failure-driven re-election
    
- State machine reasoning
    

If this feels intellectually heavier,  
that is correct.

You are now thinking at distributed systems depth.

---

We now have multiple possible directions:

1. Network Partitions & Split-Brain in Depth
    
2. Backpressure & Load Shedding
    
3. Observability in Distributed Systems
    
4. Event-Driven Systems & Message Queues
    
5. Latency & Tail Latency
    

My recommendation:

👉 Network Partitions & Split-Brain next.

It deepens everything we’ve discussed.

---

Back to [[Engineering Foundations - Lesson 15]]