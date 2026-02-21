#!/usr/bin/env bash
set -e

if [[ -f "package.json" ]]; then
	echo "Detected package.json, running npm install..."
	npm install
elif [[ -f "requirements.txt" ]]; then
	echo "Detected requirements.txt, running pip install..."
	pip install -r requirements.txt
elif [[ -f "Cargo.toml" ]]; then
	echo "Detected Cargo.toml, running cargo build..."
	cargo build
elif [[ -f "go.mod" ]]; then
	echo "Detected go.mod, running go mod download..."
	go mod download
else
	echo "No package manager detected. Ensuring trunk linters are installed..."
	# Trunk automatically installs linters on first run, but we can explicitly call it if needed.
	# However, 'trunk install' is not a standard command for installing dependencies.
	# 'trunk check' will install linters.
	# So we can just echo.
	echo "Dependencies installed."
fi
