#!/bin/bash
set -euo pipefail

# dPanel sets PORT; n8n listens on N8N_PORT.
export N8N_PORT=${PORT:-5678}

# n8n runs behind a dPanel load balancer (one proxy hop).
export N8N_PROXY_HOPS=${N8N_PROXY_HOPS:-1}

# Set N8N_HOST, N8N_PROTOCOL=https and WEBHOOK_URL=https://<your-domain>/
# in the application environment so webhook URLs use your domain.

exec node node_modules/n8n/bin/n8n start
