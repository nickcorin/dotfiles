# OpenCode Agent Instructions

This directory contains agent instruction files for OpenCode.

## Structure

- `0001-index.md` - Main index and interpretation guidelines
- `0002-twelve-factor-agent.md` - Twelve-factor app requirements
- `0003-development-flow.md` - Development workflow requirements
- `AGENTS.md` - Compiled instructions (auto-generated)

## Updating Instructions

When you modify any of the numbered instruction files:

1. Run the compilation script:
   ```bash
   ./compile-agents.sh
   ```

2. Commit the updated `AGENTS.md` file:
   ```bash
   git add AGENTS.md
   git commit -m "Update compiled agent instructions"
   ```

## Important Note

The `compile-agents.sh` script should be run manually, not automatically through chezmoi,
to avoid recursive lock issues during `chezmoi apply`.