---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
Back to [[Engineering Foundations - Index]]

## Exactly-Once vs At-Least-Once Delivery

This lesson builds on:

- Event-Driven Systems
    
- Idempotency
    
- Backpressure
    
- Consistency Models
    
- Sharding & Replication
    

We now answer:

> When a system sends a message… how many times is it delivered?

---

## 1. Core Concept

In distributed systems, message delivery is not guaranteed to be perfect.

There are three common delivery guarantees:
```text
At-Most-Once  
At-Least-Once  
Exactly-Once
```
Each has trade-offs.

---

## 2. At-Most-Once Delivery

Guarantee:

> A message is delivered zero or one time.

It may be lost.  
It will never be duplicated.

If a failure happens during delivery,  
the message may disappear.

Pros:

- Simple
    
- No duplication
    

Cons:

- Possible data loss
    

Example:  
Fire-and-forget logging system.

---

## 3. At-Least-Once Delivery

Guarantee:

> A message is delivered one or more times.

If delivery fails,  
system retries.

This prevents data loss.

But duplicates are possible.

Pros:

- Durable
    
- Reliable delivery
    

Cons:

- Consumer must handle duplicates
    

This is the most common real-world model.

---

## 4. Exactly-Once Delivery

Guarantee:

> A message is processed exactly once.

No loss.  
No duplication.

This sounds ideal.

But in distributed systems:

Exactly-once is extremely difficult and expensive.

It requires:

- Coordination
    
- State tracking
    
- Deduplication logic
    
- Transaction boundaries
    

It often increases latency and complexity significantly.

---

## 5. Why Exactly-Once Is Hard

Imagine:

Producer sends message.  
Consumer processes it.  
Acknowledgment sent back.

If network fails after processing but before acknowledgment:

Producer retries.

Now consumer may process again.

To prevent duplication:

System must track:

- Message IDs
    
- Processing state
    
- Commit logs
    

This introduces consensus-level complexity.

Lesson 16 (Consensus) becomes relevant again.

---

## 6. Visual Model – At-Least-Once
```
Producer → Queue → Consumer  
        ↓ retry on failure
```
Duplicates possible.  
Consumer must be idempotent.

---

## 7. Idempotency Returns

If consumer operation is idempotent:

Duplicate messages are harmless.

This is why idempotency is foundational in distributed systems.

Instead of enforcing exactly-once at transport level,  
many systems:

Use at-least-once + idempotent consumers.

Simpler.  
More scalable.

---

## 8. Real-World Example

Online order system.

Message: “Charge Customer”

If delivered twice:

Without idempotency → Double charge.

With idempotency:  
System checks transaction ID.  
Second attempt ignored.

Delivery guarantee becomes less critical.

Design matters more than transport promise.

---

## 9. Trade-Off Reminder

At-Least-Once:

- Reliable
    
- Scalable
    
- Simpler infrastructure
    

But:

- Requires careful consumer design
    

Exactly-Once:

- Cleaner semantics
    

- High complexity
    
- Lower performance
    
- Hard to implement at scale
    

Trade-offs never disappear.

---

## 10. Interaction with Backpressure

When systems overload:

Retries increase.

If not controlled:

Retry storms occur.

Duplicates increase.

Without idempotency:  
Chaos.

Delivery guarantees interact with overload behavior.

---

## 11. Applied Scenario

You design a payment processing pipeline.

Which model do you choose?

At-Most-Once?  
Risk: lost payments.

At-Least-Once?  
Risk: duplicate payments.

Exactly-Once?  
High coordination cost.

Correct answer:

At-Least-Once + Idempotent payment logic.

That is common industry practice.

---

## 12. Mini Exercise

Imagine:

You process user signup events.

Which is acceptable:

- Occasionally missing a welcome email?
    
- Occasionally sending two welcome emails?
    

Now imagine:

Processing financial transactions.

Does your answer change?

Why?

Context defines tolerance.

---

## 13. Self-Test

Answer without scrolling:

1. What is at-most-once delivery?
    
2. What is at-least-once delivery?
    
3. Why is exactly-once difficult in distributed systems?
    
4. Why is idempotency critical with at-least-once delivery?
    
5. How can retries create cascading failures?
    

---

## 14. Connection to Previous Lessons

- Event-driven systems rely on messaging.
    
- Idempotency prevents duplicate harm.
    
- Consensus increases coordination cost.
    
- Backpressure interacts with retries.
    
- Consistency models define state behavior.
    
- Scaling amplifies duplicate risk.
    

Delivery guarantees define how systems behave under failure and retry.

---

## 15. Difficulty Calibration

You can now reason about:

- Message reliability semantics
    
- Retry-induced amplification
    
- Transport vs application guarantees
    
- Why “exactly-once” is often marketing language
    
- How idempotency simplifies distributed design
    

You are now thinking like a distributed systems engineer.

---

Back to [[Engineering Foundations - Lesson 22]]