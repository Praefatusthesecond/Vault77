---
tags: [linux, bash, devops, advanced]
parent: "Bash - Overview"
---
Back to [[Bash - Overview]]

# Bash - DevOps Patterns

## Strict Mode

```bash
set -euo pipefail
```

## Check command success
```bash
if ! command -v docker &> /dev/null; then
    echo "Docker not installed"
    exit 1
fi
```
## Idempotency Pattern
```bash
if [ ! -f /etc/myconfig ]; then
    touch /etc/myconfig
fi
```
## Logging Pattern
```bash
LOGFILE="/var/log/script.log"

exec > >(tee -a $LOGFILE) 2>&1
```