---
name: obsidian-spec-to-implementation
description: Turn Obsidian specs into implementation plans and execution tasks; use when converting PRDs or feature notes into linked plans, task notes, and status tracking.
metadata:
  short-description: Convert spec notes into implementation plans and tasks
title: "Obsidian Spec To Implementation"
updated: 2026-02-15
project: vault
note_type: skill
status: active
tags: [vault, skills, obsidian, implementation]
---

# Obsidian Spec to Implementation

Convert a spec note into an actionable implementation plan with linked execution notes and progress updates.

## Quick start
1) Locate and read the source spec note.
2) Extract requirements, constraints, acceptance criteria, and open questions.
3) Create a plan note (quick or full depth).
4) Create task notes linked to the plan/spec.
5) Track progress by updating status fields and milestone summaries.

## Workflow

### 1) Read and parse the spec
- Find the source note via `obsidian_search_notes`.
- Read with `obsidian_read_note`.
- Capture:
  - required behavior
  - non-goals
  - technical constraints
  - acceptance criteria
  - unresolved decisions

### 2) Choose plan depth
- Quick plan for small, low-risk changes.
- Full multi-phase plan for larger features/migrations.

Plan note should include:
- scope summary
- phases/milestones
- dependencies and risks
- rollout/validation strategy
- success criteria

### 3) Create tasks
- Split work into 1-2 day units where possible.
- Create task notes in a project task path, for example:
  - `projects/<project>/archive/`
  - `projects/<project>/status/`
- Each task note includes:
  - objective
  - implementation details
  - acceptance criteria
  - dependencies
  - definition of done

### 4) Link artifacts
- Ensure spec links to plan.
- Ensure each task links to both spec and plan.
- Add frontmatter via `obsidian_upsert_frontmatter`:
  - `status`
  - `priority`
  - `owners` (if known)
  - `due` (if known)
  - `spec`
  - `plan`

### 5) Track progress
- Update task and milestone statuses regularly with `obsidian_update_note`.
- Publish short progress updates in the plan note:
  - done
  - in progress
  - blocked
  - next

## Tool map
- Locate/read: `obsidian_search_notes`, `obsidian_read_note`, `obsidian_get_note_metadata`
- Create/update: `obsidian_create_note`, `obsidian_update_note`, `obsidian_upsert_frontmatter`
- Linking checks: `obsidian_get_backlinks`, `obsidian_get_unresolved_links`
