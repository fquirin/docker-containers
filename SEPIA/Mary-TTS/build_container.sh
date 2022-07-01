#!/bin/bash
if [ -n "$(uname -m | grep aarch64)" ]; then
	echo "Building Mary-TTS Docker container: sepia/marytts:aarch64"
	sudo docker build --no-cache -t "sepia/marytts:aarch64" .
elif [ -n "$(uname -m | grep armv7l)" ]; then
	echo "Building Mary-TTS Docker container: sepia/marytts:armv7l"
	sudo docker build --no-cache -t "sepia/marytts:armv7l" .
else
	# NOTE: x86 32bit build not supported atm
	echo "Building Mary-TTS Docker container: sepia/marytts:amd64"
	sudo docker build --no-cache -t "sepia/marytts:amd64" .
fi
