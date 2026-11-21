#!/bin/bash
set -euo pipefail

# Install exactly the versions pinned in package-lock.json.
npm ci --omit=dev
