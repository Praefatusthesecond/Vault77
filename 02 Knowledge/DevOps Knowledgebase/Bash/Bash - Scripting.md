---
tags: [linux, bash, scripting]
parent: "Bash - Overview"
---
Back to [[Bash - Overview]]

# Bash - Scripting

## Script structure

```bash
#!/bin/bash

set -e
set -u
set -o pipefail

echo "Starting script"
```
## Conditions

```bash
if [ "$VAR" == "value" ]; then
    echo "Match"
fi
```
## Loops
```bash
for file in *.log; do
    echo $file
done

while read line; do
    echo $line
done < file.txt
```
## Make executable
```bash
chmod +x script.sh
./script.sh
```
