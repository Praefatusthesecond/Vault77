---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 2
---
Back to [[Engineering Foundations - Index]]

# Fault Tolerance & Redundancy

---

## 1. Core Concept

### Fault Tolerance

Fault tolerance means:

> A system continues to operate even when part of it fails.

Not perfectly.  
Not at full performance.  
But it keeps functioning.

---

### Redundancy

Redundancy means:

> Having extra components so failure of one does not stop the system.

Redundancy is a method.  
Fault tolerance is the goal.

---

## 2. Why This Matters

Failure is not rare in IT.

- Servers crash
    
- Networks drop packets
    
- Disks fail
    
- Software has bugs
    
- Humans misconfigure things
    

The question is not:

> Will something fail?

The question is:

> What happens when it does?

This connects directly to Lesson 5 (Risk & Uncertainty).

---

## 3. Visual Model – Single Point of Failure
```text
User → Load Balancer → Server → Database
```
If the database fails:  
Entire system fails.

That database is a **Single Point of Failure (SPOF).**

---

## 4. Removing Single Points of Failure

Add redundancy:
```text
User → Load Balancer → Server 1  
                       Server 2  
                         ↓  
                  Database Replica
```
Now:

- One server can fail.
    
- System continues.
    
- Database replication protects data.
    

Fault tolerance increases.

---

## 5. Types of Redundancy

### 1. Hardware Redundancy

Multiple disks (RAID)  
Multiple power supplies

### 2. Server Redundancy

Multiple application servers

### 3. Network Redundancy

Multiple internet links

### 4. Geographic Redundancy

Multiple data centers  
Multiple availability zones

Redundancy can exist at every layer.

Lesson 6 (Layers) becomes real again.

---

## 6. Trade-Off Reminder

Redundancy:

- Increases reliability
    
- Reduces downtime
    
- Reduces risk
    

But:

- Increases cost
    
- Increases complexity
    
- Requires monitoring
    
- Requires synchronization
    

Lesson 3 again.

---

## 7. Fault Tolerance vs High Availability

They are related but not identical.

High Availability (HA):

- Minimize downtime
    
- Often measured in uptime percentage
    

Fault Tolerance:

- Continue operating seamlessly despite failure
    

Example:

- Two servers behind load balancer = High Availability
    
- System that instantly reroutes traffic without user noticing = Fault Tolerant
    

Fault tolerance is stronger.

---

## 8. Real IT Example – Cloud Zones

Cloud providers divide regions into:

- Availability Zones
    

Each zone:

- Separate power
    
- Separate networking
    
- Separate hardware
    

If one zone fails:  
System in another zone continues.

That is redundancy applied geographically.

---

## 9. The Hidden Cost of Redundancy

Redundancy introduces new complexity:

- Data synchronization
    
- Split-brain scenarios
    
- Consistency challenges
    
- Failover timing
    
- Load balancing configuration
    

This leads us toward distributed systems.

Redundancy is not just “duplicate everything.”

It must be engineered.

---

## 10. Applied Scenario

You are designing a small company website.

Option A:

- Single server
    
- Daily backups
    

Option B:

- Two servers
    
- Database replication
    
- Automated failover
    

Which is appropriate?

Depends on:

- Business impact of downtime
    
- Budget
    
- Risk tolerance
    

Lesson 5 + Lesson 3 applied.

---

## 11. Failure Modes Thinking

Good engineers ask:

- What if server crashes?
    
- What if disk fails?
    
- What if network partitions?
    
- What if database locks?
    
- What if region goes down?
    

Design begins with failure modeling.

Not feature lists.

---

## 12. Mini Exercise

Think about:

An online payment system.

What components must never fail?

- Authentication?
    
- Payment processing?
    
- Database?
    
- Network?
    

Now ask:  
Where are the single points of failure?

How would you remove them?

---

## 13. Self-Test

Answer without scrolling:

1. What is fault tolerance?
    
2. What is redundancy?
    
3. What is a single point of failure?
    
4. Why does redundancy increase complexity?
    
5. Why is fault modeling important?
    

---

## 14. Connection to Previous Lessons

- Scaling distributes load.
    
- Stateless systems simplify redundancy.
    
- Idempotency supports retries during failure.
    
- Risk awareness drives redundancy decisions.
    
- Coupling increases blast radius.
    
- Complexity grows with distributed components.
    

We are now very close to distributed systems reasoning.

---

## 15. Difficulty Calibration

At this stage, someone understands:

- Scaling models
    
- State implications
    
- Idempotency
    
- Redundancy
    
- Risk modeling
    

They are ready to understand:

👉 Consistency & Replication Basics

This is the gateway into distributed systems theory.

This will be the first concept that feels intellectually heavier.

---

Back to [[Engineering Foundations - Lesson 10]]