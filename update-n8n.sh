#!/bin/bash
# Script to update n8n to the latest version
# This script pulls the latest image and restarts the container.

set -e

echo "🔄 Checking for n8n updates..."

# Detect docker compose command (new and legacy)
if docker compose version >/dev/null 2>&1; then
  COMPOSE_CMD="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
  COMPOSE_CMD="docker-compose"
else
  echo "❌ Neither 'docker compose' nor 'docker-compose' is available."
  exit 1
fi

echo "Using compose command: $COMPOSE_CMD"

# Pull latest image
echo "📥 Pulling latest n8n image..."
$COMPOSE_CMD pull n8n

# Get current and new version
CURRENT_VERSION=$(docker inspect n8n --format '{{ index .Config.Labels "org.opencontainers.image.version" }}' 2>/dev/null || echo "unknown")
echo "Current version: $CURRENT_VERSION"

# Restart container to use new image
echo "🔄 Restarting n8n container..."
$COMPOSE_CMD up -d --force-recreate n8n

# Wait a moment for container to start
sleep 3

# Get new version
NEW_VERSION=$(docker inspect n8n --format '{{ index .Config.Labels "org.opencontainers.image.version" }}' 2>/dev/null || echo "unknown")
echo "New version: $NEW_VERSION"

if [ "$CURRENT_VERSION" != "$NEW_VERSION" ]; then
  echo "✅ Successfully updated from $CURRENT_VERSION to $NEW_VERSION"
else
  echo "ℹ️  Already running latest version: $NEW_VERSION"
fi

echo ""
echo "🌐 n8n is running at http://localhost:13000"
echo "📊 Check logs with: $COMPOSE_CMD logs -f n8n"

