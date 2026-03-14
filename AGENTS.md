# Repository Conventions

## Operational Memory

Where key concerns live in this repository:
- `fdroid/repo/` -> f-droid repository data
- `fdroid/repo/symlinkify_apks` -> script to sync mirrored apks

## Error Handling

- **Centralized Error Reporting:** The project MUST route all unexpected errors through a single, centralized error reporting function. For bash scripts, this means defining a trap and not ignoring failures (`set -euo pipefail`). No script or file should fail silently or rely solely on standard output.
