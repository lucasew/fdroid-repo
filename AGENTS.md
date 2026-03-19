# Repository Conventions

## Operational Memory

Where key concerns live in this repository:

- `fdroid/repo/` -> f-droid repository data
- `src/utils/` -> shared utilities

## Error Handling

- **Centralized Error Reporting:** The project MUST route all unexpected errors through a single, centralized error reporting function. For bash scripts, this means defining a trap and not ignoring failures (`set -euo pipefail`). This logic is centralized in `src/utils/error_reporting.sh` which should be sourced by other scripts. No script or file should fail silently or rely solely on standard output.
