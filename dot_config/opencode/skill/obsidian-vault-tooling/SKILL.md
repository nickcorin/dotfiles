---
name: obsidian-vault-tooling
description: Generic Obsidian vault operations through this repo's MCP tooling; use when you need to access, read, update, and navigate vault content safely.
metadata:
  short-description: Generic vault access and safe Obsidian MCP workflows
title: "Obsidian Vault Tooling"
updated: 2026-02-15
project: vault
note_type: skill
status: active
tags: [vault, skills, obsidian, mcp]
---

# Obsidian Vault Tooling

Use this skill for general-purpose vault work when a task does not require a specialized workflow.

Examples:
- inspect vault structure and find notes
- read/update notes safely through MCP tools
- move/rename notes while preserving links
- edit frontmatter, tags, and metadata
- run vault UI/workspace actions when explicitly requested

## Quick start
1) Run `obsidian_list_vaults` and pick a target vault.
2) Confirm access with `obsidian_vault_info`.
3) Gather context with `obsidian_list_notes`, `obsidian_search_notes`, and `obsidian_read_note`.
4) Apply requested changes with the narrowest mutation tool.
5) Re-read modified paths and report exactly what changed.

## Workflow

### 1) Discover and scope
- Always vault-scope calls (every tool except `obsidian_list_vaults` needs `vault`).
- Use `obsidian_list_folders` / `obsidian_list_notes` to understand allowed paths.
- If `PATH_FORBIDDEN` appears, switch to an allowed prefix and continue there.

### 2) Read first
- Read note content: `obsidian_read_note`
- Inspect metadata/frontmatter/links: `obsidian_get_note_metadata`
- Search by topic/path: `obsidian_search_notes`
- Use graph context when needed: `obsidian_get_backlinks`, `obsidian_get_tag_index`, `obsidian_get_unresolved_links`
- Prefer updating existing notes and indexes rather than creating duplicate notes.

### 3) Mutate safely (only if requested)
- Create/update notes: `obsidian_create_note`, `obsidian_update_note`
- Frontmatter-only edits: `obsidian_upsert_frontmatter`
- Move/rename: `obsidian_move_note` (preferred) or `obsidian_move_path`
- Delete: `obsidian_delete_note` / `obsidian_delete_path`
- Use `expectedMtime` when available to avoid clobbering concurrent edits.

### 4) Verify and report
- Re-read every changed note.
- Re-check metadata if frontmatter/links/tags changed.
- Report path-level diffs in plain language.

### 5) UI and workspace tools (optional)
Use workspace/command tools only when explicitly requested:
- `obsidian_open_note`, `obsidian_open_search`
- `obsidian_list_commands`, `obsidian_run_command`
- respect command/workspace policy gates; do not bypass blocked actions.

## Error handling
- `WRITE_DISABLED`: switch to read-only output and explain limitation.
- `PATH_FORBIDDEN`: request allowed path or use an allowed folder.
- `CONFLICT_MTIME`: re-read and retry once with fresh mtime.
- `NOT_FOUND`: search/list to re-resolve the path before retrying.
