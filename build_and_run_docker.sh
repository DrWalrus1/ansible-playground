#!/bin/sh

echo "Building Docker image"
docker build . -t drwalrus/ansible
echo "Deploying test container (will destory on exit)"
docker run --rm -it drwalrus/ansible
