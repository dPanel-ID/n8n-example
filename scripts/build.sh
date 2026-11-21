#!/bin/bash
set -euo pipefail

# Install the pinned packages in a temporary folder first. The running n8n keeps
# using the current node_modules until the new one is complete, and a failed
# install leaves the current one untouched.
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STAGE="$(mktemp -d "${APP_DIR}/.build-XXXXXX")"
trap 'rm -rf "${STAGE}"' EXIT

cp "${APP_DIR}/package.json" "${APP_DIR}/package-lock.json" "${STAGE}/"
(cd "${STAGE}" && npm ci --omit=dev)

# Swap the finished node_modules into place.
if [ -d "${APP_DIR}/node_modules" ]; then
  mv "${APP_DIR}/node_modules" "${STAGE}/node_modules.old"
fi
mv "${STAGE}/node_modules" "${APP_DIR}/node_modules"
