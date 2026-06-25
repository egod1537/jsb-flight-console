#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONSOLE_BINARY="$ROOT_DIR/build/debug/jsb-flight-console"

if [[ ! -x "$CONSOLE_BINARY" ]]; then
  echo "Console binary not found: $CONSOLE_BINARY" >&2
  echo "Build it first with: cmake --build --preset debug" >&2
  exit 1
fi

cd "$ROOT_DIR"
exec "$CONSOLE_BINARY"
