#!/bin/bash

# Start n8n script for GitHub Codespaces
echo "🚀 Starting n8n..."

# Check if n8n container is already running
if docker ps | grep -q n8n; then
    echo "✅ n8n is already running!"
    exit 0
fi

# Check if n8n container exists but is stopped
if docker ps -a | grep -q n8n; then
    echo "🔄 Starting existing n8n container..."
    docker start n8n
    echo "✅ n8n started!"
    exit 0
fi

# Create n8n data directory if it doesn't exist
mkdir -p ~/.n8n

# Start n8n using docker-compose if available, otherwise use docker run
if command -v docker-compose &> /dev/null && [ -f docker-compose.yml ]; then
    echo "📦 Starting n8n with docker-compose..."
    docker-compose up -d
else
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

