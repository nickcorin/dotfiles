---
name: agent-onboarding
description: Use when onboarding an agent into an existing project in the orst vault.
metadata:
  short-description: Onboard agents into existing projects
title: "Agent Onboarding"
updated: 2026-02-17
project: vault
note_type: skill
status: active
tags: [vault, skills, onboarding]
---

# Agent Onboarding

Read project context before implementation.

## Scope

- In scope: onboarding for existing projects in `orst` and context assembly.
- Out of scope: creating new project scaffolds (use [[skills/project-bootstrap/SKILL]]).

## Trigger Guidance

- Trigger when user asks to onboard, orient, or get started in a project.
- Trigger when a new agent needs project context before implementation.

## Quick start

1. Confirm target project slug under `projects/<project>/`.
2. Read project entry notes.
3. Confirm onboarding is complete and wait for the next task.

## Workflow

1. Read project entry notes:
   - `projects/<project>/Project Overview.md`
   - `projects/<project>/status/Current State.md`
   - `projects/<project>/knowledge/`
   - `projects/<project>/workflows/Agent Onboarding.md`
2. Read vault guardrails:
   - `coding-guidelines.md`
3. Confirm scope boundaries.

## Tool map

- Discover and scope: `obsidian_search_notes`, `obsidian_list_notes`, `obsidian_list_folders`
- Read context: `obsidian_read_note`, `obsidian_get_note_metadata`

## Completion Contract

- Read the onboarding sources and build internal context.
- Do not propose tasks or plans unless explicitly asked.

## Guardrails

- Keep onboarding output project-scoped.
- Edit one project unless user approval is explicit for cross-project work.
