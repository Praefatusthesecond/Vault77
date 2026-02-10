---
type: concept
topic: git
tags: [git, fundamentals]
---
↑[[Git (Root)]]

# Git Mental Model

Git is not “files” — it’s **snapshots** + pointers.

## The 4 big objects
- **Blob**: file content
- **Tree**: directory listing (names → blobs/trees)
- **Commit**: snapshot pointer + metadata + parent commit(s)
- **Tag**: a named pointer (optionally signed)

## The 3 states you actually touch
- **Working tree**: your files right now
- **Index / staging area**: what will go into the next commit
- **HEAD**: where you are (usually the tip of a branch)

## Branches are just pointers
A branch is a **movable label** pointing at a commit. That’s it.
- Moving branch forward: new commits
- “Deleting a branch” doesn’t delete commits immediately (if reachable elsewhere)

## Merge vs rebase in one sentence
- **Merge**: keep history as it happened; add a merge commit
- **Rebase**: rewrite your commits onto a new base; cleaner line

## Golden rule
If commits are already public and other people based work on them, **avoid rewriting** them.

## Visual sanity check
- `git log -- oneline -- graph -- decorate -- all`
