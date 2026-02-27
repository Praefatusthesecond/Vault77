---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Data Sharding & Partitioning

This lesson builds on:

- Scaling Models
    
- State vs Stateless
    
- Consistency & Replication
    
- Latency & Tail Latency
    
- Quorum & Consensus
    

We now answer:

> How do you scale data itself?

---

## 1. Core Concept

### What Is Sharding?

Sharding means:

> Splitting a large dataset across multiple machines.

Instead of:

One large database server

You have:

Multiple smaller databases,  
each responsible for a portion of the data.

Each portion is called a **shard**.

---

### What Is Partitioning?

Partitioning is:

> Dividing data into segments based on a rule.

Sharding is horizontal partitioning across machines.

---

## 2. Why This Matters

Databases are stateful.

You cannot scale them infinitely with vertical scaling.

Eventually:

- CPU maxes out
    
- Memory saturates
    
- Disk I/O becomes bottleneck
    
- Lock contention increases
    

Sharding distributes load.

But introduces complexity.

---

## 3. Visual Model – Single Database
```text
All Users → One Database
```
Simple.  
Strong consistency.  
Limited scalability.

---

## 4. Visual Model – Sharded Database
```text
Users A–F → Shard 1  
Users G–M → Shard 2  
Users N–Z → Shard 3
```
Each shard holds a subset of data.

Load distributed.

Capacity increases horizontally.

---

## 5. Sharding Strategies

### 1. Range-Based Sharding

Example:

Users by alphabetical range.

A–F → Shard 1  
G–M → Shard 2

Risk:  
Uneven distribution if data is skewed.

---

### 2. Hash-Based Sharding

Apply hash function to key.

User ID → Hash → Shard

Better distribution.

Less predictable grouping.

---

### 3. Geographic Sharding

EU users → EU database  
US users → US database

Reduces latency.  
Adds cross-region consistency complexity.

---

## 6. Why Sharding Is Hard

Sharding introduces:

- Cross-shard queries
    
- Distributed transactions
    
- Hotspot shards
    
- Rebalancing complexity
    
- Routing logic
    
- Increased operational overhead
    

Scaling state is harder than scaling stateless services.

Lesson 8 returns here.

---

## 7. Cross-Shard Queries

Example:

Find total revenue across all users.

Now you must:

- Query every shard
    
- Aggregate results
    

Performance cost increases.

Global queries become expensive.

---

## 8. Hotspot Problem

If one shard gets disproportionate traffic:

Example:  
Celebrity user ID → all traffic to one shard.

Even if other shards idle,  
one shard becomes bottleneck.

Shard key selection is critical.

---

## 9. Rebalancing Complexity

As data grows:

You may need to:

- Add new shards
    
- Move data between shards
    

Data migration is expensive.

Rebalancing can introduce:

- Downtime
    
- Latency spikes
    
- Consistency risks
    

Sharding adds long-term operational cost.

Lesson 4 (Complexity & Technical Debt) appears again.

---

## 10. Trade-Off Reminder

Sharding:

- Horizontal scalability
    
- Reduced per-node load
    
- Better parallelism
    

But:

- Increased architectural complexity
    
- Harder queries
    
- Harder transactions
    
- Harder consistency guarantees
    

Trade-offs never disappear.

---

## 11. Applied Scenario

You run a social platform with 100 million users.

Single database:

- Writes slow
    
- Queries slow
    
- Scaling expensive
    

Sharded system:

- User data split across 20 shards
    
- Each shard manageable
    
- Parallel processing possible
    

But:

What if a user follows another user on a different shard?

Cross-shard coordination needed.

Engineering decisions compound.

---

## 12. Sharding vs Replication

Important distinction:

Replication:  
Multiple copies of same data.

Sharding:  
Different pieces of data on different nodes.

Many systems combine both:

Each shard may also be replicated.

Now:

You have partitioning + replication + quorum + consensus.

Distributed complexity grows rapidly.

---

## 13. Mini Exercise

Imagine:

1 million users.  
Each user generates activity logs.

Would you shard by:

- User ID?
    
- Geographic region?
    
- Activity type?
    

What happens if 1% of users generate 90% of traffic?

How would you avoid hotspots?

---

## 14. Self-Test

Answer without scrolling:

1. What is sharding?
    
2. How is it different from replication?
    
3. Why is scaling databases harder than scaling stateless services?
    
4. What is a hotspot shard?
    
5. Why do cross-shard queries increase complexity?
    

---

## 15. Connection to Previous Lessons

- Scaling drives need for sharding.
    
- State complicates horizontal scaling.
    
- Replication introduces consistency challenges.
    
- Latency amplified across shards.
    
- Quorum governs replicated shards.
    
- CAP still applies across partitions.
    
- Complexity increases with distribution.
    

Sharding is where scaling meets distributed coordination at data level.

---

## 16. Difficulty Calibration

You can now reason about:

- Horizontal data scaling
    
- Trade-offs in partition strategy
    
- Operational complexity growth
    
- Interaction between replication and sharding
    
- Distributed query implications
    

You are thinking like a distributed database engineer.

---

Back to [[Engineering Foundations - Lesson 21]]