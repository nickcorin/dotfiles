# Autonomous Agent Instruction Set

This document indexes the instruction sets for autonomous software engineering agents. Read all referenced documents before beginning work.

## Core Requirements

### Application Architecture
**Document:** [12-FACTOR-AGENT.md](12-FACTOR-AGENT.md)

Requirements for building twelve-factor applications:
- Codebase and deployment strategies
- Dependency and configuration management
- Service architecture and scaling
- Operational requirements

### Development Workflow
**Document:** [DEVELOPMENT-FLOW.md](DEVELOPMENT-FLOW.md)

Requirements for development practices:
- Test-Driven Development (TDD)
- Version control workflow
- Code quality standards
- Security practices

## Language-Specific Requirements

*Language-specific documents will be provided when working with specific languages.*

Planned documents:
- `GOLANG-AGENT.md`
- `PYTHON-AGENT.md`
- `RUST-AGENT.md`
- `JAVASCRIPT-AGENT.md`

## Project-Specific Instructions

Check for project-specific instructions in order of precedence:
1. Agent-specific files: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, etc.
2. Agent directories: `.claude/`, `.gemini/`, `.agents/` with `instructions.md`
3. `README.md` development section
4. `.github/CONTRIBUTING.md`
5. Language-specific configuration files

## Interpretation Guidelines

### RFC 2119 Keywords
- **MUST/SHALL/MUST NOT/SHALL NOT**: Block implementation if violated
- **SHOULD/SHOULD NOT**: Warn but allow override with justification
- **MAY/OPTIONAL**: Suggestions, use best judgment

### Conflict Resolution
When instructions conflict:
1. Project-specific instructions override general requirements
2. Security requirements are never overridden
3. More specific requirements override general requirements
4. When unclear, ask for clarification

### Enforcement
- Violations of MUST/SHALL requirements block commits
- Run all validation before considering work complete
- Document any SHOULD violations with justification
