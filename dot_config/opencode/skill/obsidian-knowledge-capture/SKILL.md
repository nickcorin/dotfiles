---
name: obsidian-knowledge-capture
description: Capture conversations and decisions into structured Obsidian notes; use when turning chats or ad hoc notes into durable wiki/how-to/decision artifacts.
metadata:
  short-description: Capture conversations into structured Obsidian notes
title: "Obsidian Knowledge Capture"
updated: 2026-02-15
project: vault
note_type: skill
status: active
tags: [vault, skills, obsidian, capture]
---

# Obsidian Knowledge Capture

Convert raw conversations, decisions, and scattered notes into reusable, linkable Obsidian knowledge.

## Quick start
1) Define capture type: decision, how-to, FAQ, wiki concept, or learning note.
2) Search for an existing canonical note with `obsidian_search_notes`.
3) Create/update the destination note with `obsidian_create_note` or `obsidian_update_note`.
4) Add or update structured frontmatter (tags, status, updated date) via `obsidian_upsert_frontmatter`.
5) Link related notes and open follow-ups with explicit checklist items.

## Workflow

### 1) Define the capture target
- Determine audience and desired outcome.
- Choose destination path based on the vault's structure.
- Prefer existing folders and index notes over creating new top-level buckets.

### 2) Locate existing context
- Search candidate notes by title/topic with `obsidian_search_notes`.
- Pull source content with `obsidian_read_note`.
- If multiple candidates exist, merge into one canonical note and link from the others.

### 3) Structure and write
- Prefer this note skeleton:
  - Summary
  - Context
  - Key points / decisions
  - Actions or follow-ups
  - Related notes
- Apply body edits with `obsidian_update_note` (or create fresh with `obsidian_create_note`).
- Set frontmatter with `obsidian_upsert_frontmatter`, preserving existing keys:
  - `tags`
  - `status` (`draft` or `stable`)
  - `updated` (ISO date)

### 4) Link and surface
- Add wiki links (`[[Note Name]]`) to related docs.
- Use `obsidian_get_backlinks` on high-value notes to ensure discoverability.
- If old notes are superseded, add a top-note redirect line pointing to the canonical page.

### 5) Verify
- Re-read final notes and confirm links/frontmatter are valid.
- Report final note path(s), what changed, and any remaining open questions.

## Tool map
- Discovery: `obsidian_search_notes`, `obsidian_list_notes`
- Read: `obsidian_read_note`, `obsidian_get_note_metadata`
- Write: `obsidian_create_note`, `obsidian_update_note`, `obsidian_upsert_frontmatter`
- Link quality: `obsidian_get_backlinks`, `obsidian_get_unresolved_links`
