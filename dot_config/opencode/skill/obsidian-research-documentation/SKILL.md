---
name: obsidian-research-documentation
description: Research across Obsidian notes and synthesize structured documentation; use when producing briefs, comparisons, and reports with note-level citations.
metadata:
  short-description: Research vault content and produce documented briefs
title: "Obsidian Research Documentation"
updated: 2026-02-15
project: vault
note_type: skill
status: active
tags: [vault, skills, obsidian, research]
---

# Obsidian Research Documentation

Search the vault, synthesize findings, and publish well-structured notes with explicit source links.

## Quick start
1) Define scope and output format (brief, summary, comparison, deep report).
2) Search candidate notes with `obsidian_search_notes`.
3) Read and extract facts from selected sources with `obsidian_read_note`.
4) Draft output note with clear sections and source links.
5) Re-check claims against sources and finalize with metadata and links.

## Workflow

### 1) Gather sources
- Start with targeted queries in `obsidian_search_notes`.
- Expand with metadata filters (tags/paths) by inspecting `obsidian_get_note_metadata`.
- Use `obsidian_get_backlinks` to find adjacent notes not captured by search.
- Prefer canonical project indexes/hubs first when they exist.

### 2) Pick output format
- Quick brief: concise summary + key actions.
- Research summary: topic-focused synthesis.
- Comparison: options, tradeoffs, recommendation.
- Deep report: full analysis, risks, open questions.

### 3) Synthesize
- Outline before writing.
- Separate facts from interpretation.
- For each key claim, include at least one source link in a "Sources" section.

### 4) Create/update report note
- Create with `obsidian_create_note` or update with `obsidian_update_note`.
- Suggested section order:
  - Executive summary
  - Findings
  - Evidence
  - Risks and gaps
  - Recommendation / next steps
  - Sources
- Add or update frontmatter tags/status/updated date with `obsidian_upsert_frontmatter`.

### 5) Validate and publish
- Re-open cited source notes and verify dates/facts.
- Check unresolved links in report context.
- Report final path and list of source note paths used.

## Tool map
- Search and context: `obsidian_search_notes`, `obsidian_list_notes`, `obsidian_get_backlinks`
- Read and metadata: `obsidian_read_note`, `obsidian_get_note_metadata`, `obsidian_get_tag_index`
- Write and annotate: `obsidian_create_note`, `obsidian_update_note`, `obsidian_upsert_frontmatter`
