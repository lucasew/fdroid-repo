# Repository Guidelines

## Tooling

This repository uses [mise](https://mise.jdx.dev/) for task management and [trunk](https://trunk.io/) for linting and formatting.

### Setup

1. Install `mise`.
2. Run `mise install` to install dependencies.

### Tasks

- `mise run lint`: Run linters.
- `mise run fmt`: Format code.
- `mise run ci`: Run CI checks (lint + test).
- `mise run codegen`: Update generated code.
