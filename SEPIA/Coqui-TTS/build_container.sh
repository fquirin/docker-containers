#!/bin/bash
IMAGE_NAME="sepia/coqui-tts"
PLATFORM=""
if [ -n "$(uname -m | grep aarch64)" ]; then
	PLATFORM="aarch64"
elif [ -n "$(uname -m | grep armv7l)" ]; then
	echo "Sorry, but ARM 32bit (armv7l) builds are currently not supported."
	exit 1
else
	PLATFORM="amd64"
fi
echo "Building Coqui-TTS Docker container: $IMAGE_NAME:$PLATFORM"
sudo docker build --no-cache -t "$IMAGE_NAME:$PLATFORM" .
