Create an RFC for $ARGUMENTS. Use the example guide and template below to structure the RFC.

Example Guide:

```markdown
---
rfc: 1
title: RFC Purpose and Guidelines
status: Draft
author: <Project maintainer> <email@domain.com>
created: <yyyy-mm-dd>
---

## What is an RFC?

RFC stands for Request for Comments. An RFC is a design document providing information to the project community, or describing a new feature for the project or its processes. The RFC should provide a concise technical specification and rationale for the feature. The RFC author is responsible for building consensus within the community.

## RFC Purpose

RFCs are the primary mechanism for proposing new features, collecting community input, and documenting design decisions. Because RFCs are maintained as text files in a versioned repository, their revision history is the historical record of the feature proposal.

## RFC Process

Draft → Review → [Accepted → Implemented] OR [Rejected]
↓
Withdrawn (any time)

**Draft** - The RFC is merged when properly formatted and contains a clear, complete specification. Authors assign the next sequential RFC number. The proposal should be technically sound and ready for community review.

**Review** - The RFC Author marks the RFC as ready for decision. The specification should be stable and feature-complete.

**Accepted** - The RFC has been accepted by maintainers. Implementation work can begin.

**Rejected** - The RFC has been rejected by maintainers with documented reasons.

**Implemented** - The RFC has been implemented and deployed.

**Withdrawn** - The RFC Author has voluntarily withdrawn the proposal.

### Status Transitions

- **Draft** → **Review**: Author believes specification is ready for decision
- **Review** → **Accepted**: Maintainers approve the RFC for implementation
- **Review** → **Rejected**: Maintainers decline the RFC with documented reasons
- **Accepted** → **Implemented**: RFC has been implemented and deployed
- **Any status** → **Withdrawn**: Author voluntarily withdraws

## What belongs in an RFC?

Each RFC should have the following parts:

- **Preamble** - Headers containing metadata about the RFC
- **Abstract** - A short technical summary of the specification
- **Motivation** - Why this RFC is needed and what problem it solves
- **Specification** - The technical specification describing syntax and semantics
- **Rationale** - Design decisions, alternatives considered, and objections addressed
- **Backwards Compatibility** - Any backwards incompatibilities and how to handle them
- **Reference Implementation** - Optional reference/example implementation
- **Security Considerations** - Security implications and considerations

## RFC Header Preamble

Each RFC must begin with headers in this order:

- `rfc`: Next sequential RFC number (assigned by author)
- `title`: The RFC title (maximum 44 characters)
- `description`: One sentence description (maximum 140 characters)
- `author`: Author name(s), username(s), and/or email(s)
- `discussions-to`: URL to the official discussion thread
- `status`: Draft, Review, Accepted, Rejected, Implemented, or Withdrawn
- `created`: Date created (yyyy-mm-dd format)
- `requires`: RFC number(s) this depends on (optional)
- `withdrawal-reason`: Reason for withdrawal (optional, only when withdrawn)

## Style Guide

- The title should not include "standard" or the RFC number
- Use RFC 2119 keywords (MUST, SHOULD, MAY, etc.) in the specification
- Reference other RFCs as "RFC-N" with relative markdown links
- Include images in `assets/rfc-N/` subdirectories
- Use relative links for all references
```

Template:

```markdown
## <!-- Filename should be: rfc-XXXX-short-title.md -->

---

rfc: <next sequential number>
title: <RFC title (maximum 44 characters)>
description: <Description (maximum 140 characters)>
author: <Author name(s) and/or email(s)>
discussions-to: <URL pointing to the official discussion thread>
status: Draft
created: <Date created on, in ISO 8601 (yyyy-mm-dd) format>
requires: <RFC number(s)> (Optional field)
withdrawal-reason: <Reason for withdrawal> (Optional field, only when status is Withdrawn)

---

## Abstract

A short technical summary of what this RFC does. Someone should be able to read only the abstract to understand what this specification does.

## Motivation

What problem does this solve? Why should someone implement this? What benefit does it provide? What use cases does this RFC address?

## Specification

> The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 and RFC 8174.

The technical specification should describe the syntax and semantics of any new feature. The specification should be detailed enough to allow competing, interoperable implementations.

## Rationale

Why was this design chosen? What alternatives were considered? What objections or concerns were raised during discussion?

## Backwards Compatibility

Describe any backwards incompatibilities and how to handle them. This section may be omitted if there are no backwards incompatibilities.

## Reference Implementation

An optional section that contains a reference/example implementation that people can use to assist in understanding or implementing this specification.

## Security Considerations

Discuss security implications and considerations relevant to the proposed change. Include security-relevant design decisions, risks, and how they are addressed.
```

```

```
