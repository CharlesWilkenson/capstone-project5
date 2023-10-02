#!/bin/bash

# Step 1:
# Build image and add a descriptive tag
echo "BUILD DOCKER IMAGE"
docker build -t udapeoplecapstone -f ../../ .

# Step 2:
# List docker images
echo "SHOW IMAGES"
docker images