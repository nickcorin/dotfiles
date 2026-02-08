---
name: git-branch
description: Create consistently named git branches.
license: MIT
compatibility: opencode
metadata:
  audience: maintainers
  workflow: github
---

## What I do

- Create git branches.

## When to use me

Use this when you are preparing to create a new branch in a git repository.

## Branching rules

**Naming convention:** `<context>/[issue-number-]<short-description>`

Contexts:

- `chore`: non-code tasks like dependency bumps
- `doc`: documentation changes
- `feat`: new features
- `fix`: bug fixes
- `ref`: refactoring without functionality changes
- `rfc`: RFC design documents
- `release`: preparing a release.

Examples:

- `feat/1234-user-authentication`
- `fix/5678-memory-leak`
- `doc/improve-readme`

Requirements:

- Main branch SHALL be `master`
- Feature branches MUST NOT be long-lived
- All changes MUST go through pull requests
