---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phase 2
---
Back to [[Engineering Foundations - Index]]

# Coupling & Cohesion

---

## 1. Core Concept

These two ideas describe **how parts of a system relate internally and externally**.

### Coupling

Coupling measures:

> How strongly one component depends on another.

High coupling:

- Many dependencies
    
- Tight integration
    
- Hard to change independently
    

Low coupling:

- Components interact through clear boundaries
    
- Easier to modify or replace parts
    

---

### Cohesion

Cohesion measures:

> How focused a component is on a single responsibility.

High cohesion:

- One clear purpose
    
- Well-defined role
    

Low cohesion:

- Does many unrelated things
    
- Hard to understand
    

---

## 2. Why This Matters

Good systems aim for:

> Low coupling + High cohesion

That combination creates systems that are:

- Easier to change
    
- Easier to debug
    
- Easier to scale
    
- Easier to replace parts of
    

---

## 3. Visual Model

### High Coupling (Bad)
```text
A ↔ B ↔ C  
 ↘  ↖  ↙  
   D
```
Everything talks to everything.

Change one part → unpredictable side effects.

---

### Low Coupling (Good)
```text
A → B → C → D
```
Clear boundaries.

Each component has a defined role.

---

## 4. Cohesion Example

### Low Cohesion Component

Imagine a script that:

- Processes payments
    
- Sends emails
    
- Logs analytics
    
- Handles user authentication
    

That’s low cohesion.

One component doing everything.

Hard to maintain.

---

### High Cohesion Component

Separate components:

- Payment service
    
- Email service
    
- Authentication service
    
- Analytics service
    

Each does one thing well.

That’s high cohesion.

---

## 5. Restaurant Analogy

High coupling kitchen:

- One chef handles cooking, ordering, plating, and billing.
    
- Everyone depends on that one person.
    

High cohesion kitchen:

- Prep team preps.
    
- Line cooks cook.
    
- Servers serve.
    
- Manager handles billing.
    

Roles are clear.  
Dependencies are structured.

---

## 6. Why Beginners Create High Coupling

Common reasons:

- “Just make it work.”
    
- Copy-paste coding.
    
- Rapid growth without design.
    
- Lack of abstraction awareness.
    

Over time:

- Small changes break other areas.
    
- Fear of modification grows.
    
- Technical debt increases.
    

You now see the connection to Lesson 4.

---

## 7. Real IT Scenario

Imagine two systems:

### System A

The authentication system directly accesses the database of the payment system.

### System B

The authentication system calls a defined API exposed by the payment system.

Which one is more loosely coupled?

System B.

Because:

- The payment system could change its database.
    
- The interface remains stable.
    

That’s abstraction reducing coupling.

---

## 8. Trade-Off Reminder

Low coupling sometimes increases:

- Complexity
    
- Number of components
    
- Communication overhead
    

Again:  
Trade-offs exist.

Microservices are not automatically better than monoliths.

They reduce coupling.  
But increase operational complexity.

---

## 9. Debugging Through Coupling Awareness

When something breaks:

Ask:

- Is this component too dependent on others?
    
- Could we isolate it?
    
- Can we test it independently?
    

Highly coupled systems are harder to test.

High cohesion systems are easier to reason about.

---

## 10. Mini Exercise

Think about a simple app:

It:

- Stores user data
    
- Sends notifications
    
- Generates reports
    

Design it two ways:

1. One single application doing everything.
    
2. Three separate services communicating through APIs.
    

Now ask:

- Which is easier to deploy?
    
- Which is easier to scale?
    
- Which is easier to maintain?
    
- Which introduces more complexity?
    

There is no universal answer.

Only context.

Lesson 3 again.

---

## 11. Self-Test

Answer without scrolling:

1. What is coupling?
    
2. What is cohesion?
    
3. Why is low coupling desirable?
    
4. Why is high cohesion beneficial?
    
5. Why aren’t microservices automatically better?
    

---

## 12. Connection to Previous Lessons

- Abstraction reduces coupling.
    
- Trade-offs explain why high coupling sometimes happens.
    
- Complexity increases with poor cohesion.
    
- Risk grows when components are tightly intertwined.
    
- Systems Thinking reveals dependency chains.
    

We are building a structural engineering mindset.

---

## 13. Difficulty Check

This is a noticeable increase in architectural reasoning.

If someone truly understands:

- Layers
    
- Coupling
    
- Cohesion
    

They can now reason about:

- Monolith vs microservices
    
- API boundaries
    
- Service design
    
- Refactoring decisions
    

Next lesson would logically be:

👉 State vs Stateless Systems

That prepares us for scaling, distributed systems, and cloud architecture.

---

Back to [[Engineering Foundations - Lesson 6]]