---
name: project-bootstrap
description: Use when creating a new project scaffold under projects/<project> in the orst vault.
metadata:
  short-description: Bootstrap new projects in orst
title: "Project Bootstrap"
updated: 2026-02-17
project: vault
note_type: skill
status: active
tags: [vault, skills, bootstrap]
---

# Project Bootstrap

Create a new project in `orst`.

## Scope

- In scope: create a new project skeleton under `projects/<project>/`, seed standard notes, and register it in vault navigation.
- Out of scope: onboarding an existing project (use [[skills/agent-onboarding/SKILL]]).

## Trigger Guidance

- Trigger when user asks to create/bootstrap/new project setup in `orst`.

## Quick start

1. Confirm project slug and display name.
2. Create the project structure under `projects/<project>/`.
3. Seed required notes from root templates.
4. Register the project in `Vault Home.md`.
5. Validate links and required files.

## Workflow

1. Collect project inputs:
   - slug (`projects/<project>`)
   - display name (`Project Overview.md`)
   - stack/owners/initial focus
2. Read vault bootstrap constraints:
   - `coding-guidelines.md`
3. Create:
   - `projects/<project>/archive/`
   - `projects/<project>/knowledge/`
   - `projects/<project>/rfcs/`
   - `projects/<project>/workflows/`
   - `projects/<project>/status/`
4. Create:
   - `projects/<project>/Project Overview.md`
   - `projects/<project>/status/Current State.md`
   - `projects/<project>/knowledge/<topic>.md`
   - `projects/<project>/rfcs/RFC-0001-<topic>.md`
5. Seed notes from root templates:
   - `templates/*`
   - `templates/RFC Template.md`
6. Register project in:
   - `Vault Home.md`
7. Validate:
   - required contract files present
   - no unresolved links introduced
   - overview reachable from `Vault Home` within two hops

## Tool map

- Create structure: `obsidian_create_folder`, `obsidian_create_note`
- Update hub links: `obsidian_update_note`, `obsidian_generate_markdown_link`
- Metadata consistency: `obsidian_upsert_frontmatter`
- Validation: `obsidian_get_unresolved_links`, `obsidian_search_notes`

## Output Contract

- New project scaffold under `projects/<project>/`.
- Core overview, knowledge, RFC, and status docs created.
- Project registered in `Vault Home.md`.

## Guardrails

- Modify only the new project paths and `Vault Home.md` entry needed for registration.
- Keep folder names lowercase and note names human-readable.
