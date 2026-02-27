---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## The Saga Pattern (Distributed Transaction Alternative)

This lesson builds on:

- Distributed Transactions & 2PC
    
- Event-Driven Systems
    
- Exactly-Once vs At-Least-Once
    
- Idempotency
    
- Backpressure
    
- Consistency Models
    

We now answer:

> How can distributed systems coordinate multi-step operations without strict atomic transactions?

---

## 1. Core Concept

A **Saga** is:

> A sequence of local transactions coordinated through events, where failures are handled by compensating actions instead of rollback.

Instead of:

“All succeed or none succeed”

We use:

“If one step fails, undo previous steps through compensation.”

Sagas embrace eventual consistency.

---

## 2. Why This Exists

2PC:

- Blocks during failures
    
- Reduces availability
    
- Limits scalability
    
- Increases coordination overhead
    

Modern distributed systems prefer:

- High availability
    
- Event-driven workflows
    
- Asynchronous coordination
    

Sagas trade strict atomicity for scalability and resilience.

---

## 3. Visual Model – 2PC vs Saga

### 2PC
```text
Begin → Lock A → Lock B → Commit → Unlock
```
All participants coordinated synchronously.

---

### Saga
```text
Step A → Event → Step B → Event → Step C  
        ↑ failure triggers compensation
```
Each step commits independently.

If failure occurs:  
Compensation steps execute.

---

## 4. Two Types of Sagas

### 1. Choreography-Based Saga

Each service reacts to events.

No central coordinator.

Example:
```text
Order Created → Payment Service  
Payment Completed → Inventory Service  
Inventory Reserved → Shipping Service
```
Services listen and respond autonomously.

Pros:

- Decentralized
    
- Flexible
    
- Loosely coupled
    

Cons:

- Harder to trace
    
- Complex event chains
    

---

### 2. Orchestrated Saga

A central orchestrator coordinates steps.

Example:

Orchestrator:

- Calls Payment
    
- Calls Inventory
    
- Calls Shipping
    

If failure:  
Orchestrator triggers compensation.

Pros:

- Clear flow control
    
- Easier visibility
    

Cons:

- Central coordination logic
    
- Slightly more coupling
    

---

## 5. Compensation Logic

Key idea:

Instead of rollback,  
we use compensating actions.

Example:

Order Saga:

1. Reserve inventory
    
2. Charge payment
    
3. Create shipment
    

If shipment fails:

- Refund payment
    
- Release inventory
    

State evolves forward — not backward.

---

## 6. Why Idempotency Is Critical

In Sagas:

- Events may retry
    
- Compensation may retry
    
- Messages may duplicate
    

Without idempotency:

Compensation may execute twice.  
Refund may occur twice.  
Inventory may be released twice.

Idempotent operations are mandatory.

Lesson 9 becomes foundational here.

---

## 7. Trade-Off Reminder

Sagas:

- Highly scalable
    
- Avoid global locks
    
- Better availability
    
- Natural fit for event-driven systems
    

But:

- More complex business logic
    
- Harder debugging
    
- Temporary inconsistencies
    
- Requires careful compensation design
    

Again:  
Trade-offs govern architecture.

---

## 8. Real-World Example

Online marketplace.

Strict atomic transaction across:

- Payment processor
    
- Inventory service
    
- Shipping system
    
- Fraud detection
    

Not feasible at scale.

Saga approach:

Each service commits locally.  
Failures compensated asynchronously.

System remains responsive even during failure.

---

## 9. CAP & Saga

Sagas generally favor:

Availability + Partition Tolerance (AP)

Consistency is eventual.

This matches large-scale cloud systems.

---

## 10. Applied Scenario

You design a ride-sharing platform.

Trip booking involves:

- Driver allocation
    
- Payment pre-authorization
    
- Ride creation
    
- Notification
    

Driver cancels after payment pre-auth.

Saga compensation:

- Release driver
    
- Cancel ride
    
- Void payment authorization
    

System remains consistent over time.

---

## 11. Mini Exercise

Imagine:

E-commerce checkout.

Which steps require compensation?

- Payment
    
- Inventory
    
- Loyalty points
    
- Email confirmation
    

For each:  
Design a compensating action.

Which are reversible?  
Which are not?

---

## 12. Self-Test

Answer without scrolling:

1. What is a Saga?
    
2. How is it different from 2PC?
    
3. What is a compensating action?
    
4. Why is idempotency required in Sagas?
    
5. When would 2PC be preferable over Saga?
    

---

## 13. Connection to Previous Lessons

- Event-driven systems enable Saga flow.
    
- Idempotency prevents duplicate harm.
    
- CAP trade-offs favor availability.
    
- Backpressure interacts with retries.
    
- Sharding complicates atomic updates.
    
- Observability is critical for debugging Sagas.
    
- Consistency becomes eventual.
    

Saga pattern is distributed coordination without global locking.

---

## 14. Difficulty Calibration

You can now reason about:

- Distributed transaction alternatives
    
- Compensation-based workflows
    
- Availability vs atomicity
    
- Asynchronous coordination
    
- Event-driven reliability design
    

You are thinking at real-world cloud-scale architecture level.

---

Back to [[Engineering Foundations - Lesson 24]]
