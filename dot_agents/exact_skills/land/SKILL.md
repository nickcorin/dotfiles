---
name: land
description: Use when the user asks to land, merge, or finalize a completed change. Handles merge flow, required project note updates, and RFC completion checks before closing the work.
metadata:
  short-description: Land completed work and close the loop
title: "Land"
updated: 2026-03-09
project: vault
note_type: skill
status: active
tags: [vault, skills, git, release]
---

# Land

## Trigger Guidance
- Trigger when the user asks to land, merge, finalize, or close out completed work.
- Trigger when the user asks to merge a PR and make sure project docs are updated.

## Workflow
1. Onboard yourself using the current project onboarding workflow and source-of-truth notes.
2. Verify the work is ready to land:
   - identify the branch, PR state, and merge path
   - confirm required checks or validation status
   - identify linked issue and RFC context if any
3. Update project notes in the correct order:
   - if the landed work changed real project state, write the sequenced status note first
   - then update `status/current.md` so it reflects the previous current state plus the newly applied changes
   - update `project-spec.md` if the authoritative technical specification changed
   - update `project-overview.md` if durable project direction changed
4. If the work is tied to an RFC:
   - make sure the RFC still matches the implemented result
   - update the RFC if implementation details or outcomes differ in meaningful ways
   - mark the RFC as `Implemented` when the RFC-backed work is complete
5. Land the work using the repository merge workflow and current project policy.
6. After merge:
   - clean up the remote feature branch if project policy allows it
   - clean up the local feature branch when it is no longer needed
   - sync local `master` with the merged remote state
   - if working from a git worktree, update the original source checkout `master` first, then update the worktree checkout `master` from that merged state as well
7. Report the merge result, cleanup result, sync result, project note updates, and RFC status updates.

## Tools and Resources
- Required tools:
  - `git`
  - `gh` when GitHub PR workflow is involved
  - `obsidian` for project note and RFC updates
- Optional references:
  - current project notes under `projects/<project>/`
  - repo-local contribution or release guidance if present and current

## Guardrails
- Do not merge work that has not met the required validation or review bar for the project.
- Do not create post-hoc RFCs for work that already landed.
- Do not add sequenced status notes for vault-only housekeeping.
- If the implementation and the RFC materially disagree, resolve the documentation mismatch before treating the work as complete.