#!/usr/bin/env bash
set -euo pipefail

report_error() {
	local exit_code=$?
	local line_number=$1
	echo "ERROR: Script failed at line ${line_number} with exit code ${exit_code}." >&2
}

trap 'report_error $LINENO' ERR
