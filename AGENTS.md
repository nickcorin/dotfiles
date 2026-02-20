# AGENTS.md

Guidance for autonomous coding agents working in this chezmoi-managed dotfiles repository.

## Scope

- This repo manages user environment configuration, not a single deployable app.
- Main areas:
  - `.chezmoidata/` (template data, package config)
  - `.chezmoiscripts/` (chezmoi lifecycle scripts)
  - `dot_config/` (maps to `~/.config/...`)
  - `dot_resources/` (shell/resources and platform files)
- Most files are config; only some files are executable scripts.

## Source-of-truth files

- `README.md` for installation/apply workflow.
- `dot_config/chezmoi/chezmoi.toml` for chezmoi behavior.
- `.chezmoidata/packages.yaml` for package install definitions.
- `dot_config/opencode/AGENTS.md` for OpenCode-specific local agent behavior.

## Cursor/Copilot rules status

- `.cursorrules`: not found.
- `.cursor/rules/`: not found.
- `.github/copilot-instructions.md`: not found.
- If these files appear later, treat them as high-priority and update this file.

## Build, lint, and test commands

## Reality check

- There is no single repo-wide `build`, `lint`, or `test` command.
- Validate changes with targeted file-level checks plus chezmoi diff/apply checks.

## Core repo commands

- Apply dotfiles: `chezmoi apply`
- Force apply: `chezmoi apply --force`
- Preview rendered changes: `chezmoi diff`
- Check environment health: `chezmoi doctor`
- Check source state: `chezmoi status`

## Shell checks

- Syntax (single file): `bash -n path/to/script.sh`
- Lint (single file, if installed): `shellcheck path/to/script.sh`
- Format (single file, if installed): `shfmt -w path/to/script.sh`

## Lua checks

- Syntax (single file): `luac -p path/to/file.lua`
- Format check (single file, if installed): `stylua --check path/to/file.lua`

## Python checks

- Syntax (single file): `python3 -m py_compile path/to/file.py`
- Lint (single file, if installed): `ruff check path/to/file.py`
- Format check (single file, if installed): `black --check path/to/file.py`

## JavaScript checks

- Syntax (single file): `node --check path/to/file.js`

## Config checks

- TOML parse (Python 3.11+):
  - `python3 -c "import sys,tomllib; tomllib.load(open(sys.argv[1],'rb')); print('ok')" path/to/file.toml`
- YAML parse (if `PyYAML` installed):
  - `python3 -c "import sys,yaml; yaml.safe_load(open(sys.argv[1])); print('ok')" path/to/file.yaml`

## Running a single test in this repo

- There is no unified test runner with named cases.
- "Single test" means "single-file validation for the file you changed".
- Examples:
  - `bash -n dot_resources/shell/scripts/utils.sh`
  - `luac -p dot_config/nvim/lua/prompt/agent.lua`
  - `python3 -m py_compile dot_config/opencode/skill/jupyter-notebook/scripts/new_notebook.py`
  - `node --check dot_config/opencode/skill/expo-cicd-workflows/scripts/validate.js`

## Recommended validation sequence

1. Make minimal, localized edits.
2. Run syntax/lint checks only for touched files.
3. Run `chezmoi diff` and review rendered output.
4. If needed, run `chezmoi apply` in a safe/local environment.

## Code style guidelines

## Global principles

- Keep changes small and purposeful.
- Preserve behavior unless explicitly asked to change behavior.
- Prefer readability over clever shortcuts.
- Follow existing file-local style over global rewrites.
- Do not add compatibility aliases/layers unless explicitly requested.
- Remove superseded code paths when replacing behavior.

## Imports and module layout

- JavaScript:
  - Order imports as: `node:` built-ins, third-party, then local files.
  - Keep ESM style in ESM files.
- Lua:
  - Put `local X = require("...")` at the top.
  - Keep `require` groups stable and easy to scan.
  - Return the module table at end of file.
- Python:
  - Standard library first, then third-party, then local imports.
  - Keep `from __future__ import annotations` where already used.

## Formatting and whitespace

- Preserve indentation style used by each file.
- Do not mass-reformat files unrelated to the requested change.
- Keep line lengths readable; wrap long calls and pipelines cleanly.
- End files with a single trailing newline.

## Types and annotations

- Python:
  - Add/keep type hints on changed function signatures.
  - Prefer concrete, readable types (`Path`, `dict[str, Any]`, etc.).
- Lua:
  - Preserve EmmyLua annotations already used (`---@class`, `---@param`, `---@return`).
- JavaScript:
  - Add runtime validation at boundaries (CLI args, parsed data, network responses).

## Naming conventions

- Use descriptive names; avoid opaque abbreviations.
- Follow established repo patterns:
  - `dot_` prefixed paths for chezmoi mapping behavior.
  - `executable_` prefix where that convention already exists.
  - Explicit platform/variant names in filenames when relevant.
- Avoid introducing a new naming style inside existing directories.

## Error handling

- Shell:
  - Prefer strict mode in bash scripts (`set -euo pipefail`) unless existing conventions differ.
  - Quote expansions and command arguments.
  - Check preconditions before side effects (`command -v`, file exists, etc.).
- Python/JS/Lua:
  - Fail fast with clear, actionable error messages.
  - Preserve existing error semantics when extending behavior.
  - Handle file parse/network boundaries explicitly.

## Safety and secrets

- Never commit secrets, tokens, or machine-local state/history.
- Treat ignored/sensitive paths with care (see `.gitignore`).
- Avoid destructive system changes in install scripts unless explicitly required.

## Agent behavior expectations

- Prefer `apply_patch` for targeted edits.
- Less code is better than more code.
- Code readability is a core requirement.
- Priority order: explicit user request > repo-local instructions > generic defaults.

## Maintenance of this file

- If you add canonical build/lint/test tooling, update this file immediately.
- Include both full-run and single-target commands for any new toolchain.
