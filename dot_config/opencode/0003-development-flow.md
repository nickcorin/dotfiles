# Development Workflow Requirements

## Test-Driven Development (TDD)

**TEST-DRIVEN DEVELOPMENT IS NOT OPTIONAL**. All production code MUST be written in response to a failing test,
**no exceptions**.

### Process

1. **RED**: Write failing test for new functionality.
2. **GREEN**: Write minimal code to pass test.
3. **REFACTOR**: Improve code while keeping tests green.
4. **REPEAT**: Continue cycle for each new behavior.

### Requirements

- Tests MUST be written before implementation code.
- All features MUST include comprehensive, automated tests.
- Bug fixes MUST include regression tests.
- All tests MUST pass before committing.
- Acceptance tests MUST be written for interfaces/traits.
- Tests MUST use real implementations over mocks when possible.
- Failing tests MUST NOT be skipped or removed.

### Test Structure

- Test organization MUST follow language conventions.
- Test files MUST maintain clear association with source files.
- Test names MUST describe behavior, not implementation
- Tests MUST follow Arrange-Act-Assert pattern
- Each test MUST test one behavior only

### Coverage Requirements

- New code MUST have minimum 80% coverage
- Critical paths MUST have 100% coverage
- Coverage reports MUST be generated before commit
- Uncovered code MUST have documented justification

### Test Scenarios

- Happy path MUST be tested
- Error conditions MUST be tested
- Boundary values MUST be tested
- Invalid inputs MUST be tested

### Execution

- Tests MUST run in isolation (no shared state)
- Tests MUST be deterministic (same result every run)
- Tests MUST complete in reasonable time
- Test suite MUST run before every commit

### When Tests Fail

- Failing tests MUST be fixed before new features
- Flaky tests MUST be fixed or removed
- Test failures MUST block commits
- Failing tests MUST NOT be skipped or removed.

## Code Quality

### Design

- Interfaces MUST be designed before implementation

### Formatting & Linting

- All code MUST pass formatters and linters before commit
- Formatter/linter warnings SHALL be treated as build errors
- Project-specific tools MUST be used when available
- Formatter/linter warnings MUST NOT be ignored with linter directives.
- Formatter/linter configuration MUST NOT be changed without explicit instruction.

## Version Control

### Philosophy

- Repository is the single source of truth
- Monorepo structure SHALL be used within application boundaries
- Trunk-based development MUST be followed
- Micro-commits SHALL be preferred (small, focused changes)

### Branches

**Naming convention:** `<context>/[issue-number-]<short-description>`

Contexts:

- `doc`: documentation changes
- `feat`: new features
- `fix`: bug fixes
- `ref`: refactoring without functionality changes
- `rfc`: RFC design documents

Examples:

- `feat/1234-user-authentication`
- `fix/5678-memory-leak`
- `doc/improve-readme`

Requirements:

- Main branch SHALL be `master`
- Feature branches MUST NOT be long-lived
- All changes MUST go through pull requests

## Commit Messages

### Format

```
<package>[/sub-package]: <summary>

<detailed description>

<references>
```

### Requirements

- First line MUST complete: "This change modifies the codebase to \_\_\_"
- First line MUST NOT start with capital letter
- First line MUST NOT be a complete sentence
- Package name MUST be included
- Blank line MUST follow first line
- Body MUST use complete sentences with proper punctuation
- Body MUST NOT use HTML, Markdown, or markup
- AI/agent generation MUST NOT be mentioned
- Commits MUST NOT be co-authored by the AI/agent.

### References

- `Closes: #123` for non-bug issues
- `Fixes: #123` for bug issues
- `References: owner/repo#123` for partial solutions

## Pull Requests

### Title Format

`[WIP:] <issue | package>: <short description>`

- `[WIP:]` indicates work in progress
- Remove `[WIP:]` when ready for review

### Body Requirements

- Concise summary of changes MUST be provided
- Benchmarks MUST be included if performance affected
- High signal-to-noise ratio MUST be maintained
- AI/agent generation MUST NOT be mentioned
- Issue references MUST use GitHub keywords
- Pull requests MUST NOT be co-authored by the AI/agent.

### Merging

- Commits MUST be squashed on merge
- Branches MUST be deleted after merge
- Use: `gh pr merge --squash --delete-branch`

## Development Commands

### Before Committing

- Run linting: `npm run lint`, `ruff`, etc.
- Run type checking: `npm run typecheck`, `mypy`, etc.
- Run all tests: `npm test`, `pytest`, etc.
- Commands MUST be documented in README or project instructions

### Git Operations

- Use `git` by default
- Use `gh` for inspecting ci runs
- NEVER use interactive flags (`-i`)
- NEVER update git config

## Security

- NEVER expose or log secrets
- NEVER commit secrets to repository

---

When implementing code changes, ensure compliance with all applicable requirements above. TDD cycle: Red → Green → Refactor. No exceptions.
