#!/bin/bash
IMAGE_NAME="bytemind/python3"
VERSION="3.10"
PLATFORM=""
if [ -n "$(uname -m | grep aarch64)" ]; then
	PLATFORM="aarch64"
elif [ -n "$(uname -m | grep armv7l)" ]; then
	echo "Sorry, but ARM 32bit (armv7l) builds are currently not supported."
	exit 1
else
	PLATFORM="amd64"
fi
echo "Building Docker container: $IMAGE_NAME:${VERSION}_$PLATFORM"
sudo docker build --no-cache -t "$IMAGE_NAME:${VERSION}_$PLATFORM" .
