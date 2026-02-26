---
title: Docker - Images and Layers
aliases: [Docker Image Architecture, Docker Layering Model]
tags: [docker, containers, devops, container-architecture]
type: tooling
domain: containers
related: [Docker - Containers, Docker - Dockerfile, Docker - Storage Drivers]
status: draft
---

## 1. Overview

A Docker image is a **read-only, immutable template** used to create containers.

A Docker container is a **running instance of an image** with an additional writable layer.

Images are composed of **stacked filesystem layers**, each created by a Dockerfile instruction.

Understanding layers is critical for:

- Efficient builds
    
- Storage optimization
    
- Security hardening
    
- CI/CD performance tuning
    

---

## 2. How Docker Images Are Built

Each instruction in a Dockerfile creates a new layer.

Example:
```bash
FROM ubuntu:22.04  
RUN apt-get update  
RUN apt-get install -y nginx  
COPY . /app
```
Layer breakdown:

1. Base image layer (`ubuntu:22.04`)
    
2. Package index update layer
    
3. Nginx installation layer
    
4. Application copy layer
    

Each layer is:

- Immutable
    
- Content-addressable (SHA256 hash)
    
- Cached independently
    
- Stored only once on the host
    

---

## 3. The Union Filesystem Model

Docker uses a union filesystem (e.g., `overlay2`) to stack layers.

Conceptually:

- Lower layers are read-only
    
- A new writable layer is added when a container runs
    
- Files in upper layers override files in lower layers
    

This allows multiple images to share base layers efficiently.

---

## 4. Copy-on-Write Mechanism

When a container starts:

- Docker adds a thin writable layer on top of the image layers
    
- Any file modification is written only to this top layer
    

This is called **Copy-on-Write (CoW)**.

Implications:

- Image layers remain untouched
    
- Containers are ephemeral
    
- Deleting a container removes its writable layer
    
- Image reusability is preserved
    

---

## 5. Layer Caching and Build Optimization

Docker caches layers during builds.

If an instruction has not changed, Docker reuses the cached layer.

Bad example:
```bash
COPY . .  
RUN npm install
```
Any code change invalidates cache for dependency installation.

Better:
```bash
COPY package*.json ./  
RUN npm install  
COPY . .
```
Stable dependencies first. Volatile application code last.

This dramatically reduces CI build times.

---

## 6. Layer Size and Image Optimization

Each layer contributes to image size.

Common mistakes:

- Using large base images
    
- Installing unnecessary packages
    
- Leaving package caches
    
- Splitting logical steps unnecessarily
    

Example of improvement:

Instead of:
```bash
RUN apt-get update  
RUN apt-get install -y curl  
RUN apt-get clean
```
Use:
```bash
RUN apt-get update && \  
    apt-get install -y curl && \  
    apt-get clean && \  
    rm -rf /var/lib/apt/lists/*
```
Fewer layers, smaller final image.

---

## 7. Multi-Stage Builds

Multi-stage builds separate build-time dependencies from runtime.

Example:
```bash
FROM node:20 AS builder  
WORKDIR /app  
COPY package*.json ./  
RUN npm install  
COPY . .  
RUN npm run build  
  
FROM nginx:alpine  
COPY --from=builder /app/dist /usr/share/nginx/html
```
Benefits:

- Smaller runtime image
    
- Reduced attack surface
    
- No build tools in production image
    
- Faster vulnerability scans
    

In DevSecOps environments, multi-stage builds are considered best practice.

---

## 8. Security Considerations

Important:

Deleting a file in a later layer does NOT remove it from previous layers.

Example:

COPY secret.txt /tmp/  
RUN rm /tmp/secret.txt

The file still exists in lower layers.

Therefore:

Never bake secrets into images.

Use:

- Environment variables
    
- Runtime secret injection
    
- Docker secrets
    
- External secret managers
    

---

## 9. Inspecting Image Layers

To view layer history:

docker history <image>

To inspect metadata:

docker inspect <image>

These reveal:

- Layer sizes
    
- Build instructions
    
- Creation timestamps
    
- SHA identifiers
    

Useful for troubleshooting bloated images.

---

## 10. Storage Drivers

Docker relies on storage drivers to manage layers.

Common driver:

- `overlay2` (modern Linux default)
    

Others (legacy or specialized environments):

- aufs
    
- btrfs
    
- zfs
    

`overlay2` is recommended for production.

---

## 11. Operational Implications in CI/CD

Understanding layers allows:

- Faster pipeline builds
    
- Smarter Dockerfile ordering
    
- Reduced registry storage usage
    
- More efficient vulnerability scanning
    

Layer caching directly impacts pipeline runtime.

In large environments, poor Dockerfile design can cost hours per day in cumulative CI time.

---

## 12. Interview-Level Explanation

If asked:

“How do Docker images and layers work?”

Answer:

A Docker image consists of immutable filesystem layers created by each Dockerfile instruction. These layers are stacked using a union filesystem. When a container runs, Docker adds a thin writable layer using copy-on-write. This allows efficient storage reuse, caching, and container isolation.

Concise. Accurate. Senior-level.