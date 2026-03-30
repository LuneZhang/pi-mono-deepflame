#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$REPO_ROOT"

if [[ ! -d "$REPO_ROOT/node_modules" ]]; then
	echo "==> Installing workspace dependencies..."
	npm install
fi

echo "==> Building required packages..."
	npm --prefix packages/tui run build
	npm --prefix packages/ai run build
	npm --prefix packages/agent run build
	npm --prefix packages/coding-agent run build

echo "==> Installing pi globally from local package..."
	npm install -g ./packages/coding-agent

echo ""
	echo "pi installed: $(command -v pi)"
	echo ""
	echo "This script installs the pi CLI only."
	echo "Copy optional plugins from extra-extensions/extensions/ into ~/.pi/agent/extensions/ to enable them."
