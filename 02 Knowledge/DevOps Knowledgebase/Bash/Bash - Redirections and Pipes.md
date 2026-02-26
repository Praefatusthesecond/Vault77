---
tags: [linux, bash, pipes, devops]
parent: "Bash - Overview"
---
Back to [[Bash - Overview]]

# Bash - Pipes & Redirection

## Redirection

```text
>      overwrite file
>>     append to file
2>     redirect errors
&>     redirect all output
```

Example:
```bash
ls -la > output.txt
```

## Pipes

`|`

Example:
```bash
cat file.log | grep ERROR | wc -l
```

Meaning:
- Read file
- Filter for ERROR
- Count lines

## DevOps Example

Check running docker containers:

```bash
docker ps | grep nginx
```

## Exit Codes

```bash
echo $?
```

`0` = success  
`non-zero` = failure
