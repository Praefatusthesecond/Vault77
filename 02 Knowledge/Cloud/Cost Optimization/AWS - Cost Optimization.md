---
title: AWS - Cost Optimization
tags: [ aws, cloud, cost-optimization, finops ]
type: knowledge
domain: cloud
status: active
parent: Cost Optimization Index
---
Back to [[Cost Optimization Index]]

# AWS - Cost Optimization

## 🔹 Core AWS Cost Areas

- EC2
    
- RDS
    
- S3
    
- Data Transfer
    
- EBS
    
- Lambda
    
- NAT Gateways
    
- Load Balancers
    

---

## 1️⃣ Right-Sizing EC2

- Use Compute Optimizer
    
- Monitor CPU & memory
    
- Downsize overprovisioned instances
    
- Remove idle instances
    

Common waste:

- t3.large running at 5% CPU
    
- Instances left running after testing
    

---

## 2️⃣ Reserved Instances

Commit 1 or 3 years → lower cost.

Best for:

- Steady-state workloads
    

---

## 3️⃣ Savings Plans

More flexible than RIs.

Applies to:

- EC2
    
- Fargate
    
- Lambda
    

---

## 4️⃣ Spot Instances

Use for:

- Batch jobs
    
- Non-critical workloads
    
- CI pipelines
    

Massive savings but interruptible.

---

## 5️⃣ S3 Optimization

- Lifecycle policies
    
- Intelligent Tiering
    
- Glacier for archive
    
- Remove unused buckets
    
- Compress data
    

---

## 6️⃣ NAT Gateway Costs

Often underestimated.

Optimize by:

- Using VPC endpoints
    
- Reducing cross-AZ traffic
    
- Replacing with NAT instance (in some cases)
    

---

## 7️⃣ AWS Cost Tools

- Cost Explorer
    
- AWS Budgets
    
- Compute Optimizer
    
- Trusted Advisor
    
- Cost and Usage Reports (CUR)