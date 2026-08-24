#!/bin/bash

# Script for GitHub Codespaces setup
echo "🚀 Setting up n8n in GitHub Codespaces..."

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not available. Please use the devcontainer setup."
    exit 1
fi

# Create n8n data directory
mkdir -p ~/.n8n

# Always refresh to latest image before starting
if docker ps -a --format '{{.Names}}' | grep -qx n8n; then
  echo "🧹 Removing existing n8n container..."
  docker rm -f n8n >/dev/null 2>&1 || true
fi

echo "📥 Pulling latest n8n image..."
docker pull docker.n8n.io/n8nio/n8n:latest

# Run n8n with latest image
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

echo "✅ n8n is starting..."
echo "🌐 Access n8n at: http://localhost:5678"
echo "⏳ Please wait a few seconds for n8n to fully start..."

