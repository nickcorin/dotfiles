## Code Quality

### Design Principles

- Always follow the [12-Factor App](https://12factor.net/) principles.

### Testing

- Follow test driven development (TDD) principles.
- All code must be thoroughly tested.
- New features must include unit tests that cover all edge cases.
- Bug fixes must include regression tests that verify the bug is fixed and prevent it from reoccurring.
- All tests must pass before committing or merging any changes.
- Look for project-specific testing tools and frameworks, and use them if available.
- Write acceptance tests for `interface` and `trait` definitions which tests the behavior, not the implementation,
  ensuring that the implementation adheres to the contract.
- Avoid using mocks and stubs in tests unless absolutely necessary. Prefer using real implementations or test doubles
  that closely resemble the real implementation.
- Never skip or remove failing tests. Instead, fix the underlying issue causing the test to fail.

### Formatting and Linting

- All code must be properly formatted according to the project's style guide.
- We consider formatter and linter warnings as build errors.
- All code must pass all formatters and linters before committing or merging any changes.
- Look for project-specific tools for formatting and linting, and use them if available.

## Version Control

We use Git for version control, and all changes are made through pull requests.
Use the `gh` CLI tool to interact with GitHub locally and `git` as a fallback.

### Philosophy

The repository is our **single source of truth**. It is a **monorepo** that contains all the code for the project, including libraries and tools, and documentation.

We use a **trunk-based development** model. We do not use long-lived feature branches or release branches. Instead, we use pull requests to propose changes, which are reviewed and merged directly into the `master` branch.

Prefer micro-commits that are small, focused, and easy to review. Each commit should represent a single logical change
to the codebase.

### Branches

The main branch is `master`. All changes are made through pull requests that are merged into `master`.
Branches should be named according to the following convention:
`<context>/[issue-number-]<short-description>`, where:

- `<context>` is one of the following:

  - `doc`: for documentation changes.
  - `feat`: for new features.
  - `fix`: for bug fixes.
  - `ref`: for refactoring or code improvements without changing functionality.
  - `rfc`: for specific RFC design documents and proposals.

- `<issue-number>` is the issue number if applicable, without the `#` prefix.
- `<short-description>` is a short description of the change, using hyphens to separate words.

Examples:

```
doc/1234-improve-readme: improve README documentation
feat/5678-add-new-feature: add new feature to the project
fix/91011-fix-bug: fix bug in the project
```

### Commit Messages

```
math: improve Sin, Cos and Tan precision for very large arguments

The existing implementation has poor numerical properties for
large arguments, so use the McGillicutty algorithm to improve
accuracy above 1e10.

The algorithm is described at https://wikipedia.org/wiki/McGillicutty_Algorithm

Fixes #159
```

#### First line

The first line of the change description is conventionally a short one-line summary of the change, prefixed by the primary affected package.

A rule of thumb is that it should be written so to complete the sentence "This change modifies Go to **\_**." That means it does not start with a capital letter, is not a complete sentence, and actually summarizes the result of the change.

Use the following format: `<package>[/sub-package]: <short description of the change>`, where:

- `<package>` is the primary affected package.
- `[/sub-package]` is optional and can be used to provide more specificity or remove ambiguity.

In the case of multiple affected packages:

- If the change primarily affects one package, use that package as `<package>`.
- If the change affects multiple packages, use a parent package or a common package that relates to all affected
  packages as `<package>`.

Examples:

- `math: improve Sin, Cos and Tan precision for very large arguments`
- `net/http: add support for HTTP/3`

Follow the first line by a blank line.

#### Main content

The rest of the description elaborates and should provide context for the change and explain what it does. Write in complete sentences with correct punctuation. Don't use HTML, Markdown, or any other markup language.

Add any relevant information, such as benchmark data if the change affects performance.

Do not include any information about `claude`, or that the change was generated.

Examples:

```
math: improve Sin, Cos and Tan precision for very large arguments

The existing implementation has poor numerical properties for
large arguments, so use the McGillicutty algorithm to improve
accuracy above 1e10.

The algorithm is described at https://wikipedia.org/wiki/McGillicutty_Algorithm
```

### Pull Requests

### Title

Use the following format for the title:

```
[WIP:] <issue | package>: <short description of the change>
```

`[WIP:]` is optional and can be used to indicate that the pull request is a work in progress. It must be removed when the pull request should be considered complete for a more thorough review.
`<issue>` is the issue number if applicable.
`<package>` is the primary affected package.

### Body

The body of the pull request should contain concise summary of the changes made and any relevant context. It should also include any relevant benchmarks or performance data if applicable.

- Be informative, but concise.
- Maintain a high signal-to-noise ratio.
- Avoid unnecessary details or explanations.
- Do not include any information about `claude`, or that the change was generated.

#### Referencing issues

Use GitHub's special notation to reference issues in the pull request body when applicable:
`KEYWORD: #ISSUE-NUMBER.` or `KEYWORD: OWNER/REPOSITORY#ISSUE-NUMBER.` for issues in the same or different
repositories, respectively.

Keywords:

- `Closes` (issues not relating to bugs).
- `Fixes` (issues relating to bugs).
- `References` (partial steps towards the resolution of an issue).

Examples:

```
Closes: #12345.
Fixes: #12345.
References: golang/go#12345.
```

The special notation associates the change with the referenced issue 12345 in the issue tracker. When this change is eventually applied, the issue tracker will automatically mark the issue as fixed.

#### Merging

When merging pull requests, squash the commits and clean up branches afterwards. You can achieve this with the following
flags with `gh pr merge`:

```bash
- `--delete-branch`
- `--squash`
```

## Golang

### Comments

- Comments should be full sentences, starting with a capital letter and ending with a period.
- Avoid comments that state the obvious or repeat what the code already expresses.

### Testing

- Use the `testing`, and `testify` packages for writing tests.
- Use `_test` packages for all tests, except for acceptance tests.
- Acceptance tests should be placed in a special test package which can be imported by implementation packages. E.g. An
  acceptance test for an interface in the `foo` package should be placed in `foo/footest` with the package name `footest`.

### Types and Type Constraints

- Use `any` instead of the empty interface: `interface{}`.
- If a generic field's possible types are known, use a type constraint instead of `any`.
- If a generic field's possible types are not known, or if it can accept any type, then use `any` as the type
  constraint.
