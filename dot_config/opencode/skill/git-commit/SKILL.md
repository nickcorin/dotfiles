---
name: git-commit
description: Create consistent git commits.
license: MIT
compatibility: opencode
metadata:
  audience: maintainers
  workflow: github
---

## What I do

- Create consistency formatted git commits.

## When to use me

Use this when you are preparing to commit changes to your git branch.

### Format

```
<package>[/sub-package]: <summary>

<detailed description>

<references>
```

### Requirements

- First line is NOT optional.
- First line MUST NOT start with capital letter
- First line MUST NOT be a complete sentence
- Package name MUST be included
- Description and references are OPTIONAL.

### Description

- Blank line MUST follow first line
- Body MUST use complete sentences with proper punctuation
- Body MUST NOT use HTML, Markdown, or markup
- AI/agent generation MUST NOT be mentioned
- Commits MUST NOT be co-authored by the AI/agent.

### References

- `Closes: #123` for non-bug issues
- `Fixes: #123` for bug issues
- `References: owner/repo#123` for partial solutions
