#!/bin/bash

export CURRENT_DIR=$(pwd)
export LINUX_USER=$(whoami)
export APP_NAME=$(basename "$CURRENT_DIR")

# create network if it is not exist
docker network create dpanel-network || true

# exit container if it is running
docker rm ${APP_NAME}-${LINUX_USER} || true

# Start the container, and map port ${PORT} to port 80 in the container.
docker run --add-host host.docker.internal:host-gateway \
    --network dpanel-network \
    --network-alias ${APP_NAME}-${LINUX_USER} \
    --name ${APP_NAME}-${LINUX_USER} \
    --publish ${PORT}:80 \
    --hostname ${APP_NAME}-${LINUX_USER} \
    nginx:latest
