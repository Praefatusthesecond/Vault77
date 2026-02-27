---
type: exercise
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 3
---
## Design a Global E-Commerce Platform

This exercise synthesizes:

- Scaling
    
- Stateless vs Stateful
    
- Sharding
    
- Replication
    
- CAP
    
- Quorum
    
- Consensus
    
- Event-driven architecture
    
- Delivery guarantees
    
- Sagas
    
- Backpressure
    
- Reliability patterns
    
- Observability
    
- Tail latency
    

You are now the architect.

---

# 🎯 Scenario

You are designing:

A **global e-commerce platform** similar to Amazon.

Requirements:

- Millions of users
    
- Global regions (US, EU, Asia)
    
- High availability
    
- Fast checkout
    
- Inventory accuracy
    
- Payment reliability
    
- Eventual shipment tracking
    
- Flash sale traffic spikes
    

Business constraints:

- Checkout must not double-charge users
    
- Temporary inconsistency in product reviews is acceptable
    
- System must survive region failure
    
- Latency must remain low under load
    

---

# 🏗 Step 1 – High-Level Architecture

Start simple.
```text
Users  
   ↓  
API Gateway  
   ↓  
Microservices:  
- Auth  
- Catalog  
- Cart  
- Order  
- Payment  
- Inventory  
- Shipping  
   ↓  
Databases (sharded + replicated)  
   ↓  
Message Queue / Event Bus
```
Now we apply lessons.

---

# 🧠 Step 2 – Apply Scaling

### Web Layer

- Stateless application servers
    
- Horizontal scaling
    
- Auto-scaling groups
    

Why?  
Stateless → easier scaling.

Lesson 8 + Lesson 10.

---

# 🗃 Step 3 – Database Strategy

### Catalog Data

- Read-heavy
    
- Eventually consistent acceptable
    
- Replicated across regions
    
- Cached heavily
    

### Orders & Payments

- Strong consistency required
    
- Possibly CP configuration
    
- Quorum writes
    
- Leader-based replication
    

### User Data

- Sharded by user ID
    
- Replicated within region
    
- Multi-region read replicas
    

You now reason in consistency tiers.

Lesson 14 applied.

---

# 🌍 Step 4 – Multi-Region Design

Each region:

- Has its own application cluster
    
- Has regional databases
    
- Uses replication across regions
    

If US region fails:

EU continues.

CAP choice:

Better to reject some writes  
than risk inconsistent payment state.

Risk modeling applied.

---

# 🔁 Step 5 – Checkout Flow (Saga)

Checkout includes:

1. Reserve inventory
    
2. Charge payment
    
3. Create order
    
4. Trigger shipment
    

Do we use 2PC?

No.

We use a Saga.

If payment fails:  
Release inventory.

If shipping fails:  
Refund payment.

Event-driven orchestration.

Lesson 25 applied.

---

# 📬 Step 6 – Event-Driven Backbone

Order Created event:

- Inventory service listens
    
- Payment service listens
    
- Email service listens
    
- Analytics listens
    

Queue buffers spikes during flash sales.

Backpressure prevents overload.

Lesson 18 + Lesson 19 applied.

---

# 🛡 Step 7 – Reliability Patterns

Each service:

- Has timeouts
    
- Has bounded retries
    
- Uses exponential backoff
    
- Has circuit breakers
    

Prevents cascading failure.

Lesson 26 applied.

---

# ⏱ Step 8 – Latency Management

Monitor:

- p95
    
- p99
    

Reduce fan-out calls.  
Cache frequently accessed data.  
Use asynchronous processing for non-critical tasks.

Tail latency managed.

Lesson 21 applied.

---

# 📊 Step 9 – Observability

Implement:

- Metrics (traffic, errors, saturation)
    
- Structured logs
    
- Distributed tracing
    

Trace checkout flow end-to-end.

Without this, debugging is impossible.

Lesson 20 applied.

---

# 🧮 Step 10 – Handling Flash Sales

Traffic spikes 20x.

System response:

- Auto-scale stateless services
    
- Queue absorbs bursts
    
- Rate limiting protects database
    
- Load shedding protects core checkout
    

Graceful degradation.

Lesson 18 applied.

---

# 🔐 Step 11 – Payment Safety

Use:

- Idempotent transaction IDs
    
- At-least-once delivery
    
- Deduplication at payment service
    

Exactly-once via application-level logic.

Lesson 23 applied.

---

# ⚠ Step 12 – Partition Scenario

Network partition isolates EU region.

Inventory updates conflict.

Decision:

EU rejects writes to prevent inconsistency.

Better downtime than oversell.

CAP decision in context.

Lesson 13 applied.

---

# 🧩 Synthesis Reflection

You just applied:

- Trade-offs
    
- Risk modeling
    
- Distributed coordination
    
- Scaling strategy
    
- Failure containment
    
- Performance optimization
    
- Delivery semantics
    
- Data partitioning
    
- Event-driven workflows
    
- Observability principles
    

This is full distributed systems reasoning.

---

# 🧠 Self-Evaluation

Without scrolling back, answer:

1. Why is Saga better than 2PC here?
    
2. Where must strong consistency exist?
    
3. Where is eventual consistency acceptable?
    
4. How do retries interact with payment safety?
    
5. What prevents flash-sale collapse?
    
6. What happens during region partition?
    
7. Why is sharding necessary?
    
8. Where do tail latency risks appear?
    

If you can answer clearly,  
Phase 3 concepts are internalizing.

---

# 📈 Where You Stand Now

You can now reason about:

- Global distributed architecture
    
- Failure under partition
    
- Scalability limits
    
- Consistency trade-offs
    
- Reliability strategies
    
- Operational observability
    

This is senior-level distributed systems thinking.
