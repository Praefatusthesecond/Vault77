---
tags: [security, threat-modeling, cicd]
parent: Threat Modelling - Overview
---
Back to [[Threat Modelling - Overview]]

# Threat Modeling – CI/CD Pipelines

CI/CD is a high-value target.

It has:

- Secrets
- Cloud permissions
- Deployment rights

---

## Common Threats

- Malicious pull request injection
- Dependency confusion
- Compromised runner
- Artifact poisoning
- Secret leakage in logs
- Branch protection bypass

---

## Key Attack Surfaces

1. Source control
2. Build agents
3. Artifact registries
4. Deployment automation
5. Secret stores

---

## Mitigations

- Protected branches
- Signed commits
- Ephemeral runners
- Minimal IAM roles
- Artifact signing
- Log monitoring

---

## Advanced Considerations

- Supply chain integrity (SLSA)
- SBOM enforcement
- Runner isolation models
- Pipeline privilege separation
