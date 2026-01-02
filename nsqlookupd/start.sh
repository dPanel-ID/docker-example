#!/bin/bash

# remove container, make sure clean start
docker rm ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} || true

# Start container nsqlookupd
docker run \
    --network dpanel-network \
    --restart=unless-stopped \
    --user $(id -u):$(id -g) \
    --network-alias ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --name ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    --hostname ${DPANEL_SYSTEM_APP_NAME}-${DPANEL_SYSTEM_LINUX_USER} \
    nsqio/nsq:v1.3.0 \
    /nsqlookupd
