#!/bin/bash

# remove container, make sure clean start
docker rm ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} --force || true

# Start the main container, and map port ${PORT} to port in the container.
docker run \
    --network dpanel-network \
    --restart=unless-stopped \
    --user $(id -u):$(id -g) \
    --publish 4171:4171 \
    --network-alias ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --name ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --hostname ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    nsqio/nsq:v1.3.0 \
    /nsqadmin --lookupd-http-address=${NSQLOOKUPD_ADDRESS}
