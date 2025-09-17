# Twelve-Factor App Requirements for Autonomous Agents

## I. Codebase
**One codebase tracked in revision control, many deploys**

- Code MUST be tracked in a single repository
- The same codebase MUST be deployed to multiple environments
- Shared code MUST use dependency management, not copying
- Distributed systems: each service SHALL have its own codebase

## II. Dependencies
**Explicitly declare and isolate dependencies**

- Dependencies MUST be managed via package managers
- Exact versions MUST be pinned in production
- Applications MUST NOT assume system tools are present
- Applications MUST NOT rely on globally installed packages

## III. Config
**Store config in the environment**

- Config MUST be stored in environment variables
- Config MUST NOT be stored as constants in code
- Config files with secrets MUST NOT be committed
- Config MUST NOT be grouped into named environment groups

Config = anything varying between deploys (credentials, resource handles, hostnames)

## IV. Backing Services
**Treat backing services as attached resources**

- Services MUST be accessed via URLs/locators stored in config
- Local and third-party services MUST be treated identically
- Services MUST be swappable without code changes

Backing services include: databases, queues, caches, SMTP, APIs, LLMs

## V. Build, Release, Run
**Strictly separate build and run stages**

- Build: code → executable bundle
- Release: build + config (immutable, unique ID)
- Run: execute release in environment

- Releases MUST be immutable and tagged
- Code MUST NOT be changed at runtime
- Rollback capabilities MUST be provided

## VI. Processes
**Execute as stateless processes**

- Persistent data MUST use backing services
- Session state MUST use external stores
- Processes MUST NOT rely on local filesystem/memory for persistence
- Processes MUST be disposable

## VII. Port Binding
**Export services via port binding**

- Apps MUST be self-contained with embedded servers
- Apps MUST bind to PORT environment variable
- Apps MUST NOT rely on runtime webserver injection
- Port numbers MUST NOT be hard-coded

## VIII. Concurrency
**Scale out via the process model**

- Horizontal scaling MUST be supported
- Process management SHALL be handled by the OS
- Processes MUST NOT daemonize or write PID files

Process types: web (HTTP), worker (jobs), clock (scheduled)

## IX. Disposability
**Fast startup and graceful shutdown**

- Startup time SHOULD be minimal (seconds)
- Applications MUST handle SIGTERM gracefully
- Jobs MUST be reentrant and idempotent
- Applications MUST NOT assume graceful shutdown

## X. Dev/Prod Parity
**Minimize environment differences**

- Same backing services MUST be used in all environments
- Same dependency versions MUST be used
- Different backing services MUST NOT be used (e.g., SQLite dev/PostgreSQL prod)
- Deploy gap SHOULD be hours/minutes, not days/weeks

## XI. Logs
**Treat logs as event streams**

- Logs MUST write to stdout/stderr
- Logs MUST NOT write to files
- Log routing/storage SHALL be handled by environment
- Applications MUST NOT manage log rotation

## XII. Admin Processes
**Run admin tasks as one-off processes**

- Admin processes MUST run in identical environments
- Admin code MUST ship with application code
- Database migrations MUST run as admin processes
- REPL access SHOULD be available

Examples: database migrations, console access, one-time scripts

---

When implementing code changes, ensure compliance with all applicable factors above. Violations of MUST/SHALL requirements should block implementation.