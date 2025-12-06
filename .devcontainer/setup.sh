#!/bin/bash

# Setup script for GitHub Codespaces
echo "🚀 Setting up n8n in GitHub Codespaces..."

# Create n8n data directory
mkdir -p ~/.n8n

# Install Docker Compose if not available
if ! command -v docker-compose &> /dev/null; then
    echo "📦 Installing docker-compose..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not available. Please wait for Docker to be ready."
    exit 1
fi

# Wait for Docker daemon to be ready
echo "⏳ Waiting for Docker daemon..."
timeout=30
while ! docker info > /dev/null 2>&1; do
    if [ $timeout -eq 0 ]; then
        echo "❌ Docker daemon is not ready. Please try again."
        exit 1
    fi
    sleep 1
    timeout=$((timeout - 1))
done

echo "✅ Docker is ready!"
echo "✅ Setup complete! n8n will start automatically."

