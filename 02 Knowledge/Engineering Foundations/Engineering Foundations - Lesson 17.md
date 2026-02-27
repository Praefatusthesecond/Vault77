---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Network Partitions & Split-Brain

This lesson builds on:

- CAP Theorem
    
- Quorum Systems
    
- Consensus Basics
    
- Fault Tolerance
    

We now examine one of the most dangerous distributed failure modes.

---

## 1. Core Concept

### What Is a Network Partition?

A network partition occurs when:

> Two or more groups of nodes cannot communicate with each other, even though they are still running.

Nothing crashed.  
Nothing shut down.

But communication is broken.

---

### What Is Split-Brain?

Split-brain happens when:

> Two partitions both believe they are the authoritative system and continue accepting writes independently.

This creates two conflicting versions of truth.

When connectivity returns,  
the system must reconcile incompatible states.

This is dangerous.

---

## 2. Why This Matters

In distributed systems:

- Network partitions are inevitable.
    
- Cloud regions disconnect.
    
- Routers fail.
    
- Firewalls misconfigure.
    
- Latency spikes.
    

If your system does not handle partitions properly:

You risk data corruption.

Not just downtime.  
Corruption.

---

## 3. Visual Model – Healthy Cluster
```text
Node A ↔ Node B ↔ Node C
```
All nodes communicate.

Leader exists.  
State synchronized.

---

## 4. Visual Model – Partition
```text
Node A ↔ Node B   |   Node C
```
Partition separates Node C from A and B.

Now:

- A & B can communicate.
    
- C is isolated.
    

Which side is authoritative?

This depends on quorum rules.

---

## 5. How Quorum Prevents Split-Brain

In a 3-node system:

Majority = 2.

A + B = majority.  
C = minority.

Only majority side continues accepting writes.

Minority side must refuse writes.

If minority continues anyway:  
Split-brain occurs.

Quorum protects consistency.

---

## 6. What Happens Without Proper Control

Imagine no quorum rule.

Partition A writes:

Balance = $100

Partition B writes:

Balance = $80

When partition heals:

Which value wins?

You must:

- Overwrite one
    
- Merge
    
- Ask user
    
- Lose data
    

All are problematic.

Split-brain is costly to fix.

---

## 7. Why Partitions Are Inevitable

Even in modern cloud:

- Availability zones disconnect.
    
- Packet loss occurs.
    
- DNS propagation delays.
    
- Latency spikes cause timeouts.
    

Distributed systems must assume partitions will happen.

Ignoring partitions is naive engineering.

---

## 8. CAP in Action

During partition:

You must choose:

- Continue accepting requests (Availability)
    
- Or block writes to preserve consistency
    

If you choose availability on both sides:

Split-brain risk increases.

If you choose consistency:

Minority partition sacrifices availability.

CAP is not theoretical.  
It governs real failure behavior.

---

## 9. Applied Scenario

You run a distributed database across two regions.

Network partition isolates Region B.

Options:

Option A:  
Region B continues accepting writes.

Risk:  
Data divergence.

Option B:  
Region B rejects writes until connectivity restored.

Cost:  
Reduced availability.

Which do you choose?

Depends on:

- Business impact
    
- Data sensitivity
    
- Risk tolerance
    

Lesson 5 + Lesson 3 applied again.

---

## 10. Healing After Partition

When partition resolves:

System must:

- Compare logs
    
- Resolve conflicts
    
- Reconcile state
    
- Possibly roll back writes
    

Consensus-based systems prevent conflicting writes in the first place.

AP systems must resolve later.

Both approaches have costs.

---

## 11. Mini Exercise

Imagine:

5-node cluster.  
Network splits into 2 nodes and 3 nodes.

Which side continues operating?

The 3-node majority.

What happens to 2-node side?

It must reject writes.

Now ask:

Is this acceptable for a global banking system?  
Is it acceptable for a chat app?

Your answers should differ.

---

## 12. Self-Test

Answer without scrolling:

1. What is a network partition?
    
2. What is split-brain?
    
3. Why are partitions unavoidable?
    
4. How does quorum prevent split-brain?
    
5. What trade-off does CAP force during partition?
    
6. Why is split-brain more dangerous than downtime?
    

---

## 13. Connection to Previous Lessons

- CAP defines partition trade-offs.
    
- Quorum prevents conflicting leaders.
    
- Consensus enforces ordered agreement.
    
- Replication introduces divergence risk.
    
- Risk modeling determines acceptable failure behavior.
    
- Scaling increases partition likelihood.
    

This lesson grounds distributed theory in failure reality.

---

## 14. Difficulty Calibration

At this point, you can reason about:

- Why distributed systems block writes.
    
- Why cloud databases sometimes reject requests.
    
- Why multi-region systems are complex.
    
- Why split-brain is catastrophic.
    

You are now thinking at distributed systems depth.

---

Back to [[Engineering Foundations - Lesson 16]]