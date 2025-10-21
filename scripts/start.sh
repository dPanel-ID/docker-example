#!/bin/bash

# create network if it is not exist
docker network create dpanel-network || true

# exit container if it is running
docker rm ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} || true

# Start the container, and map port ${PORT} to port 80 in the container.
docker run --add-host host.docker.internal:host-gateway \
    --network dpanel-network \
    --network-alias ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --name ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --publish ${PORT}:80 \
    --hostname ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    nginx:latest
