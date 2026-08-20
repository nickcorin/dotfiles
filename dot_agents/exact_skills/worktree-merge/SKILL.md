---
name: worktree-merge
description: Use when you need to merge worktree branch changes into master cleanly from the context of a worktree checkout.
metadata:
  short-description: Clean merge flow for git worktree branches
title: "Worktree Merge"
updated: 2026-02-20
project: vault
note_type: skill
status: active
tags: [vault, skills, git, worktree]
---

# Worktree Merge

## Purpose
Provide a deterministic, low-risk process to merge changes developed in a git worktree branch into `master`.

## Scope
- In scope:
  - Verifying branch/detached state in a worktree.
  - Rebasing onto latest `origin/master`.
  - Fast-forward merging into `master`.
  - Pushing and cleanup.
- Out of scope:
  - Conflict resolution strategy beyond standard rebase/merge conflict handling.
  - Rebasing shared/public branches without explicit user approval.

## Trigger Guidance
- Trigger when:
  - The user asks how to merge worktree changes into `master`.
  - The user asks whether the current worktree is detached and how to proceed.
  - The user wants exact merge/push/cleanup steps for worktree branches.
- Do not trigger when:
  - The task is a normal single-checkout merge with no worktree context.
  - The user asks for PR review content only.

## Workflow
1. Verify current repo/worktree state from the worktree directory.
2. Ensure the worktree has a branch (or create one if detached).
3. Rebase worktree branch on `origin/master`.
4. Run requested validation/tests.
5. In the primary checkout, fast-forward merge into local `master`.
6. Push `master`.
7. Clean up worktree and branch.

## Commands

### A) Verify state (run in worktree)
```bash
git worktree list --porcelain
git rev-parse --abbrev-ref HEAD
git symbolic-ref -q HEAD || echo DETACHED
```

### B) If detached, attach branch (run in worktree)
```bash
git switch -c <feature-branch-name>
```

### C) Rebase feature branch on latest master (run in worktree)
```bash
git fetch origin
git rebase origin/master
```

### D) Validate (run in worktree)
```bash
# Project-specific test command(s)
```

### E) Merge into master from primary checkout
```bash
cd <primary-checkout-path>
git switch master
git pull --ff-only origin master
git merge --ff-only <feature-branch-name>
git push origin master
```

### F) Cleanup
```bash
git branch -d <feature-branch-name>
git worktree remove <worktree-path>
git worktree prune
```

## Output Contract
- Report whether the worktree was detached or branch-attached.
- Provide the exact branch name merged.
- Provide test/validation status before merge.
- Confirm push result and cleanup status.

## Safety and Boundaries
- Prefer `--ff-only` merge to avoid accidental merge commits.
- Do not use destructive commands (`reset --hard`, forced branch moves) unless explicitly requested.
- If branch protection blocks direct push to `master`, stop and switch to PR flow.
