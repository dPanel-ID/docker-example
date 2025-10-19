#!/bin/bash

export CURRENT_DIR=$(pwd)
export LINUX_USER=$(whoami)
export APP_NAME=$(basename "$CURRENT_DIR")

docker stop ${APP_NAME}-${LINUX_USER}

