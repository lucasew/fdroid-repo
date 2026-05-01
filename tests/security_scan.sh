#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail=0

# Use find with while read loop to handle paths with spaces safely
while IFS= read -r script; do
    # Check if the script contains "set -e", which is the minimum strict execution mode requirement
    if ! grep -qE "set.*-e" "$script"; then
        echo "SECURITY-NOTE: $script is missing 'set -e' for strict execution."
        fail=1
    fi
done < <(find "$REPO_ROOT/src" "$REPO_ROOT/tests" -name "*.sh" -type f 2>/dev/null || true)

if [ $fail -eq 1 ]; then
    exit 1
fi

echo "Security scan passed."
