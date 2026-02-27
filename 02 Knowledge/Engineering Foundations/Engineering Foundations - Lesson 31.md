---
type: course
status: evergreen
created: 2026-02-27
category: Engineering Foundations Phsae 4
---
Back to [[Engineering Foundations - Index]]

## Alerting Philosophy – Signal vs Noise

This lesson builds on:

- Observability
    
- SLIs & SLOs
    
- Error Budgets
    
- Incident Response
    
- Capacity Planning
    
- Tail Latency
    

We now answer:

> When should the system wake up a human?

---

## 1. Core Concept

An alert is:

> A signal that requires human action.

If no action is required,  
it should not be an alert.

Logs are data.  
Dashboards are information.  
Alerts are interruptions.

Alerts are expensive.

---

## 2. Why This Matters

Bad alerting causes:

- Alert fatigue
    
- Ignored pages
    
- Delayed responses
    
- Burned-out engineers
    
- Missed real incidents
    

Too many alerts are worse than too few.

Signal must outweigh noise.

---

## 3. The Core Rule

A good alert must meet three criteria:

1. It indicates a real user-impacting issue.
    
2. It requires immediate action.
    
3. It is actionable.
    

If any of these fail:  
It should not page someone.

---

## 4. Symptom-Based vs Cause-Based Alerts

### Cause-Based Alert

“CPU usage above 85%.”

Maybe fine.  
Maybe not.

Often noisy.

---

### Symptom-Based Alert

“Checkout success rate below SLO.”

This reflects user impact.

SRE philosophy prefers:

Alert on symptoms,  
not internal causes.

SLIs drive alerts.

---

## 5. Error Budget Burn Alerts

Modern SRE alerting uses:

Burn rate alerts.

Example:

If service is consuming error budget at 10× normal rate,  
alert early.

This detects major incidents before full SLO violation.

Burn rate alerts align directly with reliability goals.

---

## 6. Severity Levels

Not every alert should wake someone at 3AM.

Example:

- Page (SEV1): User-visible outage.
    
- Ticket (SEV2): Degradation requiring follow-up.
    
- Dashboard only (SEV3): Informational.
    

Alert severity must match impact.

---

## 7. False Positives & False Negatives

Two failure modes:

False Positive:  
Alert triggers, no real problem.

False Negative:  
Real problem, no alert.

Goal:

Minimize both.  
But prioritize avoiding missed critical incidents.

Balance matters.

---

## 8. Latency Alerting

Bad alert:

“Average latency > 200ms.”

Better alert:

“p99 latency > 500ms for 5 minutes AND error rate rising.”

Combine signals.  
Reduce noise.  
Detect real impact.

Tail latency matters.

Lesson 21 returns here.

---

## 9. Alert Stability

Alerts should:

- Have thresholds tuned to historical baselines.
    
- Avoid flapping (rapid on/off).
    
- Use time windows (e.g., 5-minute rolling average).
    
- Include context in message.
    

An alert that flaps erodes trust.

---

## 10. Real-World Scenario

Service has:

- Occasional CPU spikes.
    
- No user-visible impact.
    

If alert triggers on every spike:

Engineers ignore it.

One day:  
CPU spike causes request failure.

Now alert is ignored.

Noise hides signal.

---

## 11. The Human Cost

Every page:

- Interrupts sleep
    
- Increases stress
    
- Reduces morale
    
- Accumulates fatigue
    

Reliability engineering must respect human capacity.

Over-alerting reduces real reliability.

---

## 12. Applied Scenario

You operate checkout service.

Define:

- Which SLI should trigger paging?
    
- What threshold?
    
- For how long?
    
- Who gets notified?
    
- When does escalation happen?
    

Now think:

Which metrics belong only on dashboards?

Design consciously.

---

## 13. Mini Exercise

You observe:

- CPU at 90%
    
- Memory stable
    
- Error rate normal
    
- Latency stable
    

Should you alert?

Why or why not?

Now consider:

- Error rate at 3%
    
- p99 latency at 2 seconds
    
- CPU at 60%
    

Should you alert?

Reason in user-impact terms.

---

## 14. Self-Test

Answer without scrolling:

1. What defines a good alert?
    
2. Why are symptom-based alerts preferred?
    
3. What is alert fatigue?
    
4. What is burn rate alerting?
    
5. Why should not all alerts page immediately?
    

---

## 15. Connection to Previous Lessons

- Observability provides metrics.
    
- SLIs define what matters.
    
- Error budgets guide burn alerts.
    
- Tail latency defines user pain.
    
- Capacity planning predicts overload.
    
- Incident response handles alerts.
    
- Reliability patterns reduce alert frequency.
    

Alerting philosophy protects both system reliability and human reliability.

---

## 16. Difficulty Calibration

You now understand:

- Signal vs noise discipline
    
- Human cost of operational systems
    
- SLO-driven alerting
    
- Threshold tuning
    
- Escalation structure
    

You are thinking like a mature SRE organization.

---

Back to [[Engineering Foundations - Lesson 30]]
