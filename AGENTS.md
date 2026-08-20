# Dotfiles Repository

This is a chezmoi source repository. Edit source files here rather than their rendered destinations in the home directory.

## Repository Layout

- `.chezmoidata/` contains template and package data.
- `.chezmoiscripts/` contains lifecycle scripts.
- `dot_agents/` manages shared agent instructions and skills.
- `dot_config/` manages application configuration.
- `dot_resources/` contains shared shell and platform resources.

Preserve chezmoi filename directives such as `dot_`, `exact_`, `executable_`, and `symlink_`.

`dot_agents/exact_skills/` owns the complete managed contents of `~/.agents/skills`. Removing an entry there may cause chezmoi to remove it from the home directory.

## Validation

There is no repository-wide build or test command.

- Validate changed files with their native parser, formatter, or linter.
- Review rendered changes with `chezmoi diff`.
- Check managed state with `chezmoi status`.
- Review changes to `exact_` directories carefully before applying them.

Never commit secrets, generated files, or machine-local state.
