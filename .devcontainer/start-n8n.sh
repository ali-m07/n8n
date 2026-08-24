#!/bin/bash

# Start n8n script for GitHub Codespaces
echo "🚀 Starting n8n..."

# Detect docker compose command (new and legacy)
if docker compose version >/dev/null 2>&1; then
    COMPOSE_CMD="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
    COMPOSE_CMD="docker-compose"
else
    COMPOSE_CMD=""
fi

echo "🔄 Ensuring latest n8n image is used..."

# Create n8n data directory if it doesn't exist
mkdir -p ~/.n8n

# Start n8n using docker-compose if available, otherwise use docker run
if [ -n "$COMPOSE_CMD" ] && [ -f docker-compose.yml ]; then
    echo "📥 Pulling latest image with compose..."
    $COMPOSE_CMD pull n8n
    echo "📦 Recreating n8n container with latest image..."
    $COMPOSE_CMD up -d --force-recreate n8n
else
    if docker ps -a --format '{{.Names}}' | grep -qx n8n; then
        echo "🧹 Removing existing n8n container..."
        docker rm -f n8n >/dev/null 2>&1 || true
    fi
    echo "📥 Pulling latest n8n image..."
    docker pull docker.n8n.io/n8nio/n8n:latest
    echo "📦 Starting n8n container..."
    docker run -d \
      --name n8n \
      -p 5678:5678 \
      -v ~/.n8n:/home/node/.n8n \
      -e N8N_BASIC_AUTH_ACTIVE=false \
      -e N8N_HOST=0.0.0.0 \
      -e N8N_PORT=5678 \
      -e N8N_PROTOCOL=http \
      --restart unless-stopped \
      docker.n8n.io/n8nio/n8n:latest
fi

echo "✅ n8n is starting..."
echo "🌐 Access n8n at: http://localhost:5678"
echo "⏳ Please wait a few seconds for n8n to fully start..."
echo ""
echo "💡 Tip: The port will be automatically forwarded. Check the 'Ports' tab in VS Code."

