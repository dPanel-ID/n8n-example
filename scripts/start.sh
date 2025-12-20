#!/bin/bash

# export PORT variable if not set, this variables exist in dPanel
export N8N_PORT=${PORT:-5678}

node node_modules/.bin/n8n