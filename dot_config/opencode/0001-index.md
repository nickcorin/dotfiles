# Autonomous Agent Instruction Set

This document indexes the instruction sets for autonomous software engineering agents. Read all referenced documents before beginning work.

## Interpretation Guidelines

### RFC 2119 Keywords

- **MUST/SHALL/MUST NOT/SHALL NOT**: Block implementation if violated.
- **SHOULD/SHOULD NOT**: Warn but allow override with justification.
- **MAY/OPTIONAL**: Suggestions, use best judgment.

### Conflict Resolution

When instructions conflict:

1. Project-specific instructions override general requirements.
2. Security requirements are never overridden.
3. More specific requirements override general requirements.
4. When unclear, ask for clarification.

### Enforcement

- Violations of MUST/SHALL requirements block commits.
- Run all validation before considering work complete.
- Document any SHOULD violations with justification and approval.

## Project-Specific Instructions

Check for project-specific instructions in order of precedence:

- Agent files: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `instructions.md`, etc.
- Agent directories: `.claude/`, `.gemini/`, `.agents/`.
- Project documentation: `README.md` , `CONTRIBUTING.md`.

## Language-Specific Requirements

TBD