---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Distributed Transactions & Two-Phase Commit (2PC)

This lesson builds on:

- Consistency Models
    
- Quorum & Consensus
    
- Sharding & Replication
    
- Exactly-Once vs At-Least-Once
    
- Network Partitions
    

We now answer:

> How can multiple distributed systems update together safely?

---

## 1. Core Concept

### What Is a Transaction?

A transaction is:

> A group of operations that must succeed or fail together.

In a single database:

- Deduct $100
    
- Add $100 to another account
    

If one fails:  
Both are rolled back.

Atomicity is preserved.

---

### What Is a Distributed Transaction?

A distributed transaction is:

> A transaction that spans multiple machines, services, or shards.

Example:

- Update user balance in Database A
    
- Record audit log in Database B
    
- Update inventory in Database C
    

All must succeed — or none should.

Now coordination becomes complex.

---

## 2. Why This Matters

In distributed systems:

- Data is sharded.
    
- Services are decoupled.
    
- Network partitions occur.
    
- Latency exists.
    

Coordinating atomic behavior across nodes is difficult.

Without coordination:

Partial updates create corruption.

---

## 3. Two-Phase Commit (2PC)

Two-Phase Commit is a protocol to coordinate distributed transactions.

It works in two stages:

Phase 1: Prepare  
Phase 2: Commit (or Abort)

---

## 4. Visual Model – Two-Phase Commit
```text
Coordinator → Participant A  
            → Participant B  
            → Participant C
```
---

### Phase 1 – Prepare

Coordinator asks each participant:

“Can you commit?”

Each participant:

- Reserves resources
    
- Locks data
    
- Replies YES or NO
    

If any say NO → Abort.

---

### Phase 2 – Commit

If all say YES:

Coordinator sends COMMIT.

Participants finalize changes.

If any fail before commit:  
System may block.

---

## 5. Why 2PC Is Problematic

2PC guarantees atomicity.  
But introduces serious trade-offs.

### Blocking Problem

If coordinator crashes after prepare phase:

Participants may be stuck waiting.

They cannot commit.  
They cannot abort.

System blocks.

---

### Performance Cost

2PC requires:

- Multiple network round trips
    
- Coordination
    
- Locks held during protocol
    

Latency increases.  
Throughput decreases.

---

### Partition Risk

If network partitions occur mid-transaction:

Some nodes may be in prepared state.  
Others unreachable.

Resolution becomes complex.

CAP trade-offs reappear.

---

## 6. Why Many Systems Avoid 2PC

Modern distributed systems often prefer:

Eventual consistency + compensation logic.

Instead of atomic distributed transaction:

They use:

- Event-driven workflows
    
- Saga patterns
    
- Retry with compensation
    
- Idempotent operations
    

Because:

2PC reduces scalability and availability.

---

## 7. Real-World Example

Online order system.

Traditional approach:

- Deduct inventory
    
- Charge payment
    
- Update shipping
    

Using 2PC:  
All locked until final commit.

Modern approach:

- Create order
    
- Emit event
    
- Payment service processes
    
- Inventory updated asynchronously
    
- If failure → compensation event
    

Less strict atomicity.  
More resilience.

Trade-offs.

---

## 8. CAP & 2PC

During partition:

Should system:

- Block until consistency restored?
    
- Or allow progress and resolve later?
    

2PC often sacrifices availability for consistency.

This may be unacceptable at scale.

---

## 9. Applied Scenario

You operate a banking core ledger.

Atomicity is critical.

You may accept:

- Blocking behavior
    
- Reduced availability
    
- Higher latency
    

Now consider:

A social media comment system.

Would you use distributed 2PC?  
Probably not.

Context defines strictness.

Lesson 3 governs again.

---

## 10. Mini Exercise

Imagine:

Two shards.  
Transaction updates both.

Network partition occurs between shards after prepare phase.

What risks exist?

- Deadlock?
    
- Inconsistent commit?
    
- Blocking state?
    

How would you design around this?

---

## 11. Self-Test

Answer without scrolling:

1. What is a distributed transaction?
    
2. What are the two phases of 2PC?
    
3. Why can 2PC block?
    
4. Why does 2PC reduce availability?
    
5. Why do modern systems often prefer eventual consistency + compensation?
    

---

## 12. Connection to Previous Lessons

- Replication requires coordination.
    
- Consensus enforces ordering.
    
- CAP forces partition trade-offs.
    
- Idempotency helps compensation strategies.
    
- Event-driven systems enable saga patterns.
    
- Sharding complicates atomic operations.
    
- Risk modeling determines acceptable inconsistency.
    

2PC represents strict coordination in distributed systems.

---

## 13. Difficulty Calibration

You now understand:

- Atomicity across nodes
    
- Coordination costs
    
- Blocking behavior
    
- Partition-induced deadlock risk
    
- Why “just use transactions” does not scale
    

You are operating at serious distributed systems depth.

---

Back to [[Engineering Foundations - Lesson 23]]