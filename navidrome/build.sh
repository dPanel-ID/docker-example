#!/bin/bash

echo "Building docker-example...."
echo "You can use build command to clean up unused docker image related with your project."
echo "You can use build script to preparing any environment for your project. Such as create directory, install dependency, etc."

mkdir -p data musics

docker pull deluan/navidrome:latest