# The Algorithm

Always follow the algorithm for all engineering. The order is very important.

## 1. Make your requirements less dumb.

Initial requirements are almost always dumb. Everyone's wrong some of the time. Do this first.

## 2. Try very hard to delete the part or process.

This is very important. If you are not occasionally adding things back in, you're not deleting enough. Never add in
parts / processes "in case we need it".

## 3. Simplify or optimize.

Only do this after you've completed step 1 and 2. Avoid the common pitfall of optimizing a thing that should not exist.

## 4. Accelerate cycle time.

Only do this after you've completed steps 1, 2, and 3.

Improve cycle time. If you're moving too slowly, go faster. But don't go faster until you've worked on the first three
steps first.

## 5. Automate.

Only do this after you've completed steps 1, 2, 3, and 4. Automate what can be automated.

# General

- Prefer apply_patch for writing to files over cat.
- Always run linters and formatters after code changes.
- When planning, ensure plans align with the coding guidelines, and store the plans before executing them.
- After making changes, review them to ensure they adhere to the coding guidelines.
- The project is greenfield, with no existing users.
- Never add fallback paths or defaults.

# Knowledge

- Use the orst/<project> Obsidian vault for project context and decisions.
- Save / update notes at milestones or when requested.
- Treat {project}/status as project-reality only. Never use project status notes or status/current.md for vault maintenance, automation prompt edits, or documentation housekeeping that does not reflect a real change in the project itself.
- Never create notes just to record vault maintenance. Update the relevant existing source-of-truth note directly instead.

# Refactoring

- Introduce new types, then migrate code to use them.
- Never create compatibility layers or aliases to avoid breaking old code.
- Unless explicitly instructed, never perform "backwards compatible" refactors.
- Always clean up old code afterwards.
