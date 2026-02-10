---
tags: [aws, iam, security, devops]
domain: DevOps
subcategory: AWS
parent: AWS
---

↑ [[AWS]]

# AWS IAM Fundamentals

## What this is
IAM (Identity and Access Management) controls **who can do what** in AWS.

## Core building blocks
- **Users**: Human identities
- **Roles**: Assumable identities (preferred)
- **Policies**: Permission documents
- **Groups**: User collections

## Policies
- Written in JSON
- Define allowed or denied actions
- Always evaluated explicitly

## Roles vs Users
- Roles are temporary
- Roles are safer
- Roles scale better
- Roles are preferred for automation

## Trust vs Permission policies
- **Trust policy**: Who can assume the role
- **Permission policy**: What the role can do

## Common pitfalls
- Over- permissive policies (`*:*`)
- Hardcoded credentials
- Confusing trust and permission policies

## Terraform relevance
- IAM is one of the most complex Terraform domains
- Misconfigured IAM causes most CI/CD failures
