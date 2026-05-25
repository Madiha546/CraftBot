#!/bin/bash
# Control Script — Spin up a CraftBot container and return endpoint URL

INSTANCE_ID=$(date +%s)
CONTAINER_NAME="craftbot-$INSTANCE_ID"
PORT=$((8000 + RANDOM % 1000))

echo "Creating container: $CONTAINER_NAME on port $PORT..."

docker run -d \
  --name $CONTAINER_NAME \
  --env-file .env \
  --memory="2g" \
  --cpus="1.0" \
  -p $PORT:8000 \
  --restart unless-stopped \
  craftbot:latest

echo "Container created successfully!"
echo "Endpoint URL: http://localhost:$PORT"
echo "Container Name: $CONTAINER_NAME"