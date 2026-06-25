#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLIGHTGEAR_APPIMAGE="$ROOT_DIR/.deps/flightgear/flightgear.AppImage"

if [[ ! -x "$FLIGHTGEAR_APPIMAGE" ]]; then
  echo "FlightGear AppImage not found: $FLIGHTGEAR_APPIMAGE" >&2
  exit 1
fi

exec "$FLIGHTGEAR_APPIMAGE" \
  --fdm=null \
  --native-fdm=socket,in,120,,5500,udp
