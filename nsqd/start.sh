#!/bin/bash

# remove container, make sure clean start
docker rm ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} --force || true

# Start the main container, and map port ${PORT} to port in the container.
docker run \
    --network dpanel-network \
    --restart=unless-stopped \
    --user $(id -u):$(id -g) \
    --volume ./data:/data \
    --publish 4150:4150 \
    --publish 4151:4151 \
    --network-alias ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --name ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --hostname ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    nsqio/nsq:v1.3.0 \
    /nsqd --broadcast-address=${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} --lookupd-tcp-address=${NSQLOOKUPD_ADDRESS}

