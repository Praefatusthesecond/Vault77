---
tags: [linux, bash, variables]
---

# Bash - Variables

## Create variable

```bash
NAME="Dennis"
```
## Use variable

```bash
echo $NAME
```

## Command substitution

```bash
DATE=$(date)
```
## Environment variables
```bash
echo $PATH
export VAR=value
```
## Default values

```bash
${VAR:-default}
```
## Positional parameters

```bash
$1
$2
$#
```
