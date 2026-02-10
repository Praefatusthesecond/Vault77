---
tags: [aws, iam, cicd, security, devops]
domain: DevOps
subcategory: AWS
parent: AWS
aliases: [AWS CI/CD Authentication, IAM for Pipelines]
---

↑ [[AWS]]

# AWS IAM + CI/CD Authentication

This note explains **how CI/CD systems authenticate to AWS**, and why roles + temporary credentials are the only sane option.

---

## The core problem
CI/CD systems need to:
- Authenticate non- interactively
- Access AWS securely
- Avoid long- lived secrets
- Work across accounts and environments

IAM solves this using **roles + temporary credentials**.

---

## The golden rule
> **CI/CD systems must never use IAM users with static access keys.**

If you see:
- `AWS_ACCESS_KEY_ID` stored long- term
- Credentials committed to Git
- Shared keys across environments

That’s technical debt (and a security risk).

---

## The modern solution: AssumeRole

### High- level flow
1. CI/CD system authenticates **itself**
2. AWS issues **temporary credentials**
3. Pipeline uses those credentials
4. Credentials expire automatically

This is implemented using:
- IAM Roles
- STS
- Trust Policies

---

## Common CI/CD authentication patterns

### 1️⃣ GitHub Actions (OIDC - preferred)

#### How it works
- GitHub acts as an OIDC identity provider
- AWS trusts GitHub tokens
- No secrets stored

#### Components
- IAM OIDC Provider
- IAM Role with trust policy
- GitHub workflow assumes role

#### Benefits
- No long- lived secrets
- Per- repo and per- branch control
- Short- lived credentials

> This is the **best- practice** pattern today.

---

### 2️⃣ GitLab CI (AssumeRole with credentials)

#### Typical setup
- One bootstrap credential (limited)
- Pipeline assumes a deployment role
- Temporary credentials used for actions

#### Variants
- IAM User → AssumeRole (legacy)
- GitLab OIDC → AssumeRole (modern, preferred)

#### Risks
- Misconfigured trust policy
- Over- permissioned bootstrap credentials

---

### 3️⃣ Self- hosted CI (EC2 / Runner)

#### Pattern
- CI runner runs on EC2
- EC2 has an **instance profile**
- Instance assumes role automatically

#### Benefits
- No credentials in pipelines
- Transparent credential rotation

---

## Trust policies (where most failures occur)

### What a trust policy does
Defines **who is allowed to assume a role**.

Example trust relationships:
- `ec2.amazonaws.com`
- `sts.amazonaws.com`
- GitHub OIDC provider
- Another AWS account

If trust is wrong:
- AssumeRole fails
- Permissions don’t matter

---

## Permission policies (second most common failure)

Once the role is assumed:
- Permission policy defines allowed actions
- Missing permissions = runtime failure

Typical mistakes:
- Forgetting `sts:AssumeRole`
- Missing `iam:PassRole`
- Over- restrictive resource ARNs

---

## Multi- account CI/CD (real- world pattern)

### Typical setup
- Central CI/CD account
- One role per target account
- CI assumes environment- specific roles

Example:
- `ci- deploy- dev`
- `ci- deploy- prod`

### Benefits
- Strong isolation
- Blast radius control
- Clear audit trail

---

## Environment separation strategy

| Environment | AWS Account | IAM Role |
|------------|-----------|----------|
| Dev | Dev Account | ci- deploy- dev |
| Test | Test Account | ci- deploy- test |
| Prod | Prod Account | ci- deploy- prod |

Never reuse the same role across environments.

---

## Debugging IAM + CI/CD failures

### Step- by- step checklist
1. Does the pipeline authenticate at all?
2. Does AssumeRole succeed?
3. Is the trust policy correct?
4. Does the role have permissions?
5. Are SCPs blocking access?
6. Is the correct account targeted?

### Tools
- CloudTrail
- AWS CLI `sts get- caller- identity`
- Terraform plan output

---

## Terraform relevance

Terraform in CI/CD typically:
- Uses `assume_role`
- Targets multiple accounts
- Requires IAM bootstrapping

Common patterns:
- One provider per account
- Explicit role ARNs
- Separate state per environment

See also:
- [[Terraform AWS Provider]]
- [[Terraform IAM Modules]]
- [[AWS IAM Deep Dive]]

---

## Security best practices (non- negotiable)

- Use OIDC where possible
- Use short session durations
- Scope roles tightly
- Log all role assumptions
- Rotate and delete legacy keys

---

## When to revisit this note
- Pipeline authentication fails
- Moving from static keys to OIDC
- Introducing new environments
- Security audits
