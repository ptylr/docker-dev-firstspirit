#!/bin/bash
set -e

# Load from .env if available
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

echo "🔐 Logging into FirstSpirit Docker Registry securely..."
echo "$DOCKER_PASSWORD" | docker login docker.artifactory.e-spirit.hosting -u "$DOCKER_USER" --password-stdin

echo "🚀 Starting FirstSpirit with Docker Compose..."
docker-compose up -d --build