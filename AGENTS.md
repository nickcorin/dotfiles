# Agent Instructions for Dotfiles Repository

## Build/Test/Lint Commands

**Always** apply changes immediately after editing files in this repository.

- **Apply changes**: `chezmoi apply` (retry package installation)
- **Force reinstall**: `chezmoi apply --force` (reinstall all packages)

## Code Style Guidelines

### Lua (Neovim Configuration)

- Use snake_case for variables and functions.
- Prefer explicit returns in plugin configurations.
- Use double quotes for strings.
- Structure: `return { plugin_spec }` for plugin files.

### Shell Scripts

- Use `#!/bin/bash` or `#!/bin/sh` shebang.
- Quote variables: `"$variable"` not `$variable`.
- Use `set -e` for error handling.
- Follow POSIX compliance where possible.

### Configuration Files

- YAML: 2-space indentation, no trailing spaces.
- TOML: Use kebab-case for keys.
- Maintain consistent formatting with prettier/respective formatters.

### File Organization

- Shell scripts in `resources/shell/scripts/`.
- Use chezmoi templating sparingly, prefer static configs.
