#!/bin/bash
set -euo pipefail

# dPanel sets PORT; n8n listens on N8N_PORT.
export N8N_PORT=${PORT:-5678}

# Listen on IPv4 loopback: the dPanel load balancer on the same server proxies
# to it, and n8n's default "::" fails on servers without IPv6. Set
# N8N_LISTEN_ADDRESS=0.0.0.0 when the load balancer runs on another server.
export N8N_LISTEN_ADDRESS=${N8N_LISTEN_ADDRESS:-127.0.0.1}

# n8n runs behind a dPanel load balancer (one proxy hop).
export N8N_PROXY_HOPS=${N8N_PROXY_HOPS:-1}

# Set N8N_HOST, N8N_PROTOCOL=https and WEBHOOK_URL=https://<your-domain>/
# in the application environment so webhook URLs use your domain.

exec node node_modules/n8n/bin/n8n start
