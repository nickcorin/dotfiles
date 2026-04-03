---
name: "yeet"
description: "Use only when the user explicitly asks to stage, commit, push, and open a GitHub pull request in one flow using the GitHub CLI (`gh`)."
---

## Prerequisites

- Require GitHub CLI `gh`. Check `gh --version`. If missing, ask the user to install `gh` and stop.
- Require authenticated `gh` session. Run `gh auth status`. If not authenticated, ask the user to run `gh auth login` (and re-run `gh auth status`) before continuing.

## Naming conventions

- Branch: `{context}/[issue-number-]{short-description}` when starting from main/master/default.

- Commit: `{package}[/{sub-package}]: {description}` (terse).

- PR title: `{issue | package }: {description}` (terse) summarizing the full diff.
  
### Branch Contexts:

- `chore`: non-code tasks like dependency bumps
- `doc`: documentation changes
- `feat`: new features
- `fix`: bug fixes
- `ref`: refactoring without functionality changes
- `rfc`: RFC design documents
- `release`: preparing a release.

## Workflow

- If on main/master/default, create a branch: `git checkout -b "{context}/{description}"`
- Otherwise stay on the current branch.
- Use listed branch contexts, do not prefix with `codex`.
- Confirm status, then stage appropriate files: `git status -sb` then `git add`.
- If lots of changes have been made, split commits up by logical units of work.
- Commit tersely with descriptions: `git commit -m "{package[/{sub-package}]{description}"`
- Run checks if not already. If checks fail due to missing deps/tools, install dependencies and rerun once.
- Push with tracking: `git push -u origin $(git branch --show-current)`
- If git push fails due to workflow auth errors, pull from master and retry the push.
- Open a PR and edit title/body to reflect the description and the deltas: `GH_PROMPT_DISABLED=1 GIT_TERMINAL_PROMPT=0 gh pr create --fill --head $(git branch --show-current)`
- Write the PR description to a temp file with real newlines (e.g. pr-body.md ... EOF) and run pr-body.md to avoid \\n-escaped markdown.
- PR description (markdown) must be detailed prose covering the issue, the cause and effect on users, the root cause, the fix, and any tests or checks used to validate.

## Merging

- Never squash.
- Clean up remote and local branches after merging a PR.
- Switch back to master and pull changes after merging a PR.