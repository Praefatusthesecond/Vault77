---
tags: [linux, bash, advanced, scripting]
parent: "Bash - Overview"
---
Back to [[Bash - Overview]]

# Bash - Advanced Scripting

## Strict Mode (Always Use)

```bash
set -euo pipefail
```
- -e → Exit on error
- -u → Error on undefined variable
- -o pipefail → Catch pipe failures

## Trap Handling (Production-Grade)

```bash
cleanup() {
    echo "Cleaning up..."
    rm -f /tmp/tempfile
}

trap cleanup EXIT
trap "echo Interrupted; exit 1" SIGINT SIGTERM
```

## Functions
```bash
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log "Script started"
```
## Parallel Execution
```bash
wait

for i in {1..5}; do
    sleep 5 &
done

wait
```

# Bash – awk and sed

This is where Linux stops being “basic”.

## sed (Stream Editor)

```bash
# Replace text in file 
sed -i 's/old/new/g' file.txt

# Delete lines matching pattern 
sed '/ERROR/d' logfile.log`
```

## awk (Field Processing Powerhouse)

```bash
# Print second column 
awk '{print $2}' file.txt  

# Sum column 
awk '{sum+=$1} END {print sum}' numbers.txt 
 
# Filter lines 
awk '$3 > 100' file.txt`
```

### DevOps Use Case (Logs)

```bash
awk '/ERROR/ {print $0}' app.log
```

