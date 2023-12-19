#!/bin/bash

# Set variables
IMAGE_NAME="nginx"
VERSION="alpine"

# Build Docker image
#docker build -t $IMAGE_NAME:$VERSION .
docker build --no-cache -t $IMAGE_NAME:$VERSION .

# Publish Docker image (replace 'your-registry' with your registry)
#docker tag $IMAGE_NAME:$VERSION your-registry/$IMAGE_NAME:$VERSION
#docker push your-registry/$IMAGE_NAME:$VERSION

# Output version
echo "Version: $VERSION"

