# Project Conventions

## Bash Scripts

- Enforce strict execution (`set -euo pipefail`) and implement a trap (`trap 'report_error $LINENO' ERR`) for centralized error reporting to avoid silent failures.
- Sourced centralized error-reporting utility is located at `src/utils/error_reporting.sh`.
- Use dynamically resolved absolute paths (e.g., `REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"`) instead of hardcoded relative paths.
- Always use `--` before globbing expansions (e.g., `ln -sf -- *.apk .`) to prevent flag/argument injection vulnerabilities.
- Use `find` combined with a `while IFS= read -r` loop instead of a `for` loop to safely handle file paths with spaces.
- In bash trap error handlers, capture the exit status (`$?`) immediately as the very first command.
- When using the `run_in_bash_session` tool, scripts containing explicit `exit` commands can block the session or cause execution errors. Use the `write_file` tool to safely create or modify such scripts instead.

## Tooling & Environments

- The project uses `mise` for task management and `trunk` for linting and formatting.
- Always pin tools in `mise` configurations to exact versions; never use 'latest' or 'lts' aliases.
- When executing `mise` tasks, if an error occurs stating the config file is not trusted, run `mise trust <path-to-mise.toml>`.
- Running `trunk init` generates a `trunk` launcher script and a `.trunk/` directory; these are considered forbidden tooling/bootstrap artifacts and must not be committed to the repository.
- Project dependencies are installed via `scripts/install.sh`, which detects the appropriate package manager or defaults to `trunk`.
- To install `mise` without blocking the bash session, download the install script first instead of piping directly to sh: `curl https://mise.run -o install-mise.sh && bash install-mise.sh`.

## Markdown & Documentation

- Wrap bare URLs in angle brackets (e.g., `<https://example.com>`) to avoid markdownlint/MD034 warnings.
- Documentation updates must strictly adhere to allowed paths (like Markdown, TXT, and TS/JS/Svelte source files) and must never directly modify executable logic (e.g., bash scripts) or configuration files.
- When using markdownlint for documentation files (like AGENTS.md), rules MD013 (line length) and MD025 (multiple top-level headings) are considered acceptable exceptions and can be suppressed.

## CI/CD & Structure

- CI/CD is handled by a single workflow `.github/workflows/autorelease.yml` which executes install, codegen, git diff checks, CI, and releases.
- The repository acts as an F-Droid repo with artifacts stored in the `fdroid/repo/` directory.

## Operational Memory

- `src/utils/error_reporting.sh` -> Centralized error-reporting utility for bash scripts
- `scripts/install.sh` -> Project dependencies installation script
- `.github/workflows/autorelease.yml` -> CI/CD workflow handling install, codegen, checks, CI, and releases
- `fdroid/repo/` -> F-Droid repo artifacts
