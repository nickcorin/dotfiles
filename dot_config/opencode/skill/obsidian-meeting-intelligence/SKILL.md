---
name: obsidian-meeting-intelligence
description: Prepare and run meetings with Obsidian context; use when building agendas, pre-reads, and post-meeting notes linked to existing vault knowledge.
metadata:
  short-description: Prepare agendas and meeting notes with vault context
title: "Obsidian Meeting Intelligence"
updated: 2026-02-17
project: vault
note_type: skill
status: active
tags: [vault, skills, obsidian, meetings]
---

# Obsidian Meeting Intelligence

Prepare high-signal meeting materials from vault context and keep outcomes linked back to plans, specs, and decisions.

## Quick start
1) Confirm objective, attendees, date, and required decisions.
2) Search related notes (`obsidian_search_notes`) and fetch key context (`obsidian_read_note`).
3) Create/update the meeting note with agenda, pre-read links, and timeboxes.
4) During/after meeting, capture decisions and action items with owners and dates.
5) Link outcomes to source notes and update project status notes as needed.

## Workflow

### 1) Gather context
- Find prior meeting notes, specs, and status docs with `obsidian_search_notes`.
- Read only the most relevant sources.
- Capture open risks/questions before drafting the agenda.

### 2) Choose format
- Status update
- Decision review
- Planning or execution sync
- 1:1
- Retrospective

Each format should include:
- objective
- agenda with owner/timebox per item
- expected decisions/outcomes
- links to pre-read notes

### 3) Draft the meeting note
- Create note path by stable topic, for example:
  - `Meetings/project-phoenix-weekly.md`
- Use section order:
  - Goal
  - Context links
  - Agenda
  - Discussion notes
  - Decisions
  - Action items
- Write/update with `obsidian_create_note` or `obsidian_update_note`.

### 4) Capture outcomes
- Track decisions with explicit rationale and owner.
- Record action items as checkboxes plus due dates.
- Add frontmatter fields with `obsidian_upsert_frontmatter`:
  - `meeting_date`
  - `attendees`
  - `status`
  - `tags` (`meeting`, optional project tags)

### 5) Link outcomes
- Link to project plan/spec/decision notes.
- Update related status notes only when a milestone or direction change occurs.
- Re-read final note and confirm links are not unresolved.

## Tool map
- Source discovery: `obsidian_search_notes`, `obsidian_list_notes`
- Context read: `obsidian_read_note`, `obsidian_get_note_metadata`
- Authoring: `obsidian_create_note`, `obsidian_update_note`, `obsidian_upsert_frontmatter`
- Link validation: `obsidian_get_unresolved_links`, `obsidian_get_backlinks`
