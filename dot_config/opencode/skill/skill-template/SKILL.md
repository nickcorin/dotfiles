---
name: skill-template
description: Use when creating a new vault skill package. Provides the canonical SKILL.md structure, package layout, and minimum quality bar for skills in the orst vault.
metadata:
  short-description: Canonical template for new skills
title: "Skill Template"
updated: 2026-02-15
project: vault
note_type: skill
status: active
tags: [vault, skills, template]
---

# Skill Template

Use this package as the baseline when creating a new skill in `skills`.

## Standard Layout

```text
skills/<skill-name>/
  SKILL.md
  references/   (optional)
  scripts/      (optional)
  assets/       (optional)
```

## Naming Rules

- Folder name must be lowercase and hyphenated.
- `name` in frontmatter must match folder name.
- `description` must clearly say when the skill should trigger.
- Include canonical metadata keys required by vault schema.

## Best-Practice Rules

- Keep one primary responsibility per skill.
- If a skill needs multiple top-level modes, split it into focused skills.
- Keep `SKILL.md` concise (target well under 500 lines).
- Keep core execution self-contained in `SKILL.md`.
- Move long or variant-specific detail to `references/`.
- Keep references one level deep from `SKILL.md`.
- Avoid extra docs that do not directly improve execution.

## SKILL.md Starter

```markdown
---
name: your-skill-name
description: Use when <trigger condition>. Helps with <outcome>.
metadata:
  short-description: <very short summary>
title: "Your Skill Name"
updated: YYYY-MM-DD
project: vault
note_type: skill
status: active
tags: [vault, skills, <domain>]
---

# Your Skill Name

## Purpose
State the user outcomes this skill supports.

## Scope
- In scope:
- Out of scope:

## Trigger Guidance
- Trigger when:
- Do not trigger when:

## Workflow
1. Gather required context.
2. Run the core steps in order.
3. Validate outputs before returning.

## Tools and Resources
- Required tools:
- Optional references:
- Optional scripts:

## Output Contract
- What the final output must contain.
- File paths or note locations to update.

## Safety and Boundaries
- Scope limits.
- Failure and escalation behavior.
```

## Quality Checklist

- Skill is specific, not generic.
- Skill has one primary job.
- Steps are executable and ordered.
- Edge cases and failure handling are explicit.
- Extra docs are kept out of `SKILL.md` unless essential.
- Long details live in `references/`, not duplicated in `SKILL.md`.
- Core workflow is executable without requiring external notes.
- Frontmatter satisfies root policy notes.
