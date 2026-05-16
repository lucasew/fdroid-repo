#!/usr/bin/env bash

# Centralized error reporting function
report_error() {
    local exit_status=$?
    local line_no="$1"
    local script_name="$(basename "${BASH_SOURCE[1]:-${BASH_SOURCE[0]}}")"

    # Allow overriding exit_status if it's passed as a second argument
    if [[ -n "${2:-}" ]]; then
        exit_status="$2"
    fi

    # Log the error with context
    echo "[ERROR] ${script_name}:${line_no} failed with status ${exit_status}" >&2

    # If a Sentry DSN or similar telemetry endpoint is configured, it would be called here
    # e.g., curl -s -X POST -H 'Content-Type: application/json' -d "{\"error\": \"${script_name}:${line_no} failed with status ${exit_status}\"}" "$SENTRY_DSN" > /dev/null

    exit "${exit_status}"
}
