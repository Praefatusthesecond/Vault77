---
tags: [linux, bash, regex]
parent: "Bash - Overview"
---
Back to [[Bash - Overview]]

# Bash - Regex

## Conditional Matching

```bash
if [[ "$VAR" =~ ^[0-9]+$ ]]; then
    echo "Number detected"
fi
```

## Extract pattern

```bash
if [[ "$EMAIL" =~ ^(.+)@(.+)$ ]]; then
    USER="${BASH_REMATCH[1]}"
    DOMAIN="${BASH_REMATCH[2]}"
fi
```

# Bash – Process Control & Signals

```bash
ps aux top htop kill -9 PID kill -15 PID
```

### Signals

- SIGTERM (15) → Graceful shutdown
    
- SIGKILL (9) → Forced kill
    
- SIGINT → Ctrl+C
    

### Background Jobs

```bash
command & jobs fg %1 bg %1
```
---

# Bash – Systemd Integration

## Check service

`systemctl status zabbix-agent`

## Restart service

`systemctl restart nginx`

## Create custom service

`/etc/systemd/system/myscript.service`

Example:

```bash
[Unit] Description=My Script  [Service] ExecStart=/usr/local/bin/myscript.sh Restart=always  [Install] WantedBy=multi-user.target
```

Then:

`systemctl daemon-reload systemctl enable myscript systemctl start myscript`

---

#  Bash – Cron and Scheduling

`crontab -e`

Format:

`* * * * * command`

Example:

`0 3 * * * /usr/local/bin/backup.sh`

Check logs:

`grep CRON /var/log/syslog`

---

#  Bash – Secure Bash Practices

This is where engineers become professionals.

##  Never trust input

Bad:

`rm -rf $DIR`

Good:

`rm -rf -- "$DIR"`

## Quote variables

Always:

"$VAR"

##  Use full paths in cron/systemd

Never rely on PATH.

##  Use mktemp

`TMP=$(mktemp)`

##  Avoid eval

Almost always dangerous.

---

#  Bash – Debugging & Troubleshooting

## Debug Mode

`set -x`

## Trace script

`bash -x script.sh`

## Check exit code

`echo $?`

## Common pitfalls

- Unquoted variables
    
- Word splitting
    
- Globbing
    
- Subshell scope
    

---

#  Bash – Performance and Optimization

## Avoid useless cat

Bad:

`cat file | grep text`

Good:

`grep text file`

## Use builtins over external tools

Prefer:

- [[ ]]
    
- case
    
- read
    

Over spawning processes.

## Measure execution time

`time ./script.sh`

---

# 📄 Bash – DevOps Automation Patterns

Now we go senior-level.

## Idempotency Pattern

```bash
if ! systemctl is-active --quiet nginx; then     systemctl start nginx fi
```
## Retry Pattern

```bash
for i in {1..5}; do     curl -f http://localhost && break     sleep 2 done
```
## Lockfile Pattern

```bash
LOCKFILE="/tmp/script.lock"  if [ -f "$LOCKFILE" ]; then     echo "Already running"     exit 1 fi  touch "$LOCKFILE" trap "rm -f $LOCKFILE" EXIT
```

## Structured Logging

```bash
log() {     echo "$(date '+%F %T') [$1] $2" }  log INFO "Deployment started"
```