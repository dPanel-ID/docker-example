#!/bin/bash

# exit container if it is running
docker rm ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} || true

# Start the container, and map port ${PORT} to port 80 in the container.

docker run \
    --network dpanel-network \
    --volume filebrowser_data:/srv \
    --volume filebrowser_database:/database \
    --volume filebrowser_config:/config \
    --publish ${PORT}:80 \
    --network-alias ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --name ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --hostname ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    filebrowser/filebrowser
