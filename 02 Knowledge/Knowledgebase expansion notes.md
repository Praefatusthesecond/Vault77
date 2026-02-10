# ☁️ AWS Knowledgebase — What to Record

Create:  
`AWS Knowledgebase.md`  
(Parent: `DevOps Knowledgebase`)

---

## 1️⃣ Core AWS Concepts (Must- have)

These are _foundational_, not service- specific trivia.

- **AWS Global Infrastructure**
    
    - Regions vs Availability Zones
        
    - Edge locations
        
- **AWS Shared Responsibility Model**
    
- **AWS IAM Fundamentals**
    
    - Users vs Roles vs Policies
        
    - Trust vs Permission policies
        
- **AWS Account Structure**
    
    - Root account risks
        
    - Multi- account strategies (Organizations)
        
- **AWS Billing & Cost Basics**
    
    - Cost Explorer
        
    - Budgets
        
    - Tag- based cost allocation
        

👉 These notes explain _why_ AWS works the way it does.

---

## 2️⃣ Identity & Access Management (Critical)

This should feel familiar after Terraform IAM modules.

- **AWS IAM Roles**
    
- **AWS IAM Policies**
    
- **STS & Temporary Credentials**
    
- **Cross- Account Access**
    
- **IAM Best Practices**
    
    - Least privilege
        
    - Role chaining
        
- **AWS Organizations & SCPs**
    

This is _gold_ when debugging CI/CD or Terraform failures.

---

## 3️⃣ Networking (Non- Negotiable)

Networking is where most production pain lives.

- **VPC Fundamentals**
    
- **Subnets (Public vs Private)**
    
- **Route Tables**
    
- **Internet Gateway vs NAT Gateway**
    
- **Security Groups vs NACLs**
    
- **VPC Peering**
    
- **Transit Gateway (conceptual)**
    
- **PrivateLink / VPC Endpoints**
    

You don’t need _every_ feature — just the mental model.

---

## 4️⃣ Compute (Conceptual, Not Exhaustive)

Focus on **when to use what**, not button- clicks.

- **EC2 Basics**
    
- **AMI Concepts**
    
- **Auto Scaling Groups**
    
- **Elastic Load Balancing (ALB / NLB)**
    
- **ECS vs EKS vs Lambda (decision note)**
    
- **Lambda Fundamentals**
    

One “decision matrix” note here is incredibly valuable.

---

## 5️⃣ Storage (Patterns Matter)

Capture _use cases_, not marketing.

- **S3 Fundamentals**
    
    - Buckets, objects, prefixes
        
- **S3 Security**
    
    - Bucket policies vs IAM
        
- **S3 Lifecycle Rules**
    
- **EBS vs EFS**
    
- **Backup Strategies in AWS**
    

---

## 6️⃣ State, Secrets & Configuration

Very Terraform- adjacent.

- **AWS Parameter Store**
    
- **AWS Secrets Manager**
    
- **KMS Basics**
    
- **Encryption at Rest vs In Transit**
    

---

## 7️⃣ Observability & Ops

High signal, low noise.

- **CloudWatch Basics**
    
- **Logs vs Metrics vs Alarms**
    
- **AWS CloudTrail**
    
- **Operational Best Practices**
    

---

## 8️⃣ AWS + Terraform Integration (Bridge Notes 🔗)

These tie your vault together.

- **Terraform AWS Provider**
    
- **Managing AWS IAM with Terraform**
    
- **Remote State in S3 + DynamoDB**
    
- **Multi- Account Terraform Deployments**
    

---

# ☁️ Azure Knowledgebase — What to Record

Create:  
`Azure Knowledgebase.md`  
(Parent: `DevOps Knowledgebase`)

Azure benefits _even more_ from structured notes because terminology is… special 😅

---

## 1️⃣ Core Azure Concepts (Essential)

These prevent 90% of confusion.

- **Azure Global Infrastructure**
    
    - Regions & Paired Regions
        
- **Azure Resource Manager (ARM)**
    
- **Subscriptions vs Tenants**
    
- **Resource Groups**
    
- **Azure Shared Responsibility Model**
    

---

## 2️⃣ Identity (Very Important in Azure)

Azure = identity- first.

- **Azure Active Directory (Entra ID) Basics**
    
- **Users vs Groups vs Service Principals**
    
- **Managed Identities**
    
- **Role- Based Access Control (RBAC)**
    
- **Azure AD vs Azure RBAC (key difference!)**
    

This mirrors AWS IAM, but _is not the same_.

---

## 3️⃣ Networking (Azure- Flavored)

Concepts differ subtly from AWS.

- **Azure Virtual Networks (VNet)**
    
- **Subnets in Azure**
    
- **NSGs vs ASGs**
    
- **Azure Load Balancer vs Application Gateway**
    
- **Azure Firewall (conceptual)**
    
- **Private Endpoints**
    

---

## 4️⃣ Compute

Again: decisions, not catalogs.

- **Azure Virtual Machines**
    
- **VM Scale Sets**
    
- **App Services**
    
- **Azure Functions**
    
- **AKS (conceptual overview)**
    

---

## 5️⃣ Storage

Azure storage has quirks worth documenting.

- **Azure Storage Accounts**
    
- **Blob Containers**
    
- **File Shares**
    
- **Disk Storage**
    
- **Access Tiers (Hot / Cool / Archive)**
    

---

## 6️⃣ Secrets & Config

This will map nicely to AWS notes.

- **Azure Key Vault**
    
- **Secrets vs Keys vs Certificates**
    
- **Access Policies vs RBAC**
    
- **Encryption Basics in Azure**
    

---

## 7️⃣ Monitoring & Ops

- **Azure Monitor**
    
- **Log Analytics Workspaces**
    
- **Application Insights**
    
- **Azure Activity Log**
    

---

## 8️⃣ Azure + Terraform Integration (Very Important)

- **Terraform AzureRM Provider**
    
- **Authentication Methods**
    
    - Service Principals
        
    - Managed Identity
        
- **Remote State in Azure Storage**
    
- **Multi- Subscription Deployments**
    

---

# 🧠 Mentor- Level Advice (This matters)

### Don’t try to:

- Mirror AWS and Azure _service- by- service_
    
- Document every SKU or pricing tier
    
- Turn this into vendor documentation
    

### Do:

- Capture **mental models**
    
- Capture **decision logic**
    
- Capture **“why this failed at 2am” lessons**
    

Your vault should answer:

> “What do I need to remember so I don’t have to re- learn this in 6 months?”