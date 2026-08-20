# Nick's Agent Instructions

## Core Technical Philosophy

- Avoid assuming acronym knowledge. When an acronym is natural, use the more common form and add the less-used form in
  parentheses once: `SQL`, `API`, `RTT (round-trip time)`, or `round-trip time (RTT)`.
- When writing commit messages, never co-author them.
- Never manually edit files that have been marked as auto-generated.
- When making technical decisions, do not give much weight to development cost. Instead, prefer quality, simplicity,
  robustness, scalability, and long term maintainability.
- When bug fixing, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would
  use the software.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness.
- Treat unit, integration, E2E, and other code written specifically to test code as production code itself and hold it
  to the same standards.
- When writing documentation, avoid adding technical qualifiers when describing things, especially if the sentence still
  makes sense without the adjectives.
- When discussing implementation plans or in design sessions, I expect you to push back and suggest more idiomatic and
  optimal solutions and ideas when they exist instead of attempting to shoehorn an implementation for a goal with flawed
  assumptions.
- In design discussions, or when sketching code, do not invent production-looking type or method names unless you are
  proposing them as real API. If a helper or type name is illustrative, describe the behavior in comments or prose
  instead. This is to prevent code intended for discussion accidentally becoming artifacts in implementation plans, or
  being used in production code.

## Worktrees

- Worktrees should live in a project-local `.worktrees` directory.
- New worktrees should be on their own branch.
- When landing changes, also clean up the worktree behind you.
