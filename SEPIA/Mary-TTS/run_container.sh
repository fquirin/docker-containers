#!/bin/bash
if [ -n "$(uname -m | grep aarch64)" ]; then
	sudo docker run --rm --name=marytts -p 59125:80 -it sepia/marytts:aarch64
elif [ -n "$(uname -m | grep armv7l)" ]; then
	sudo docker run --rm --name=marytts -p 59125:80 -it sepia/marytts:armv7l
else
	# NOTE: x86 32bit build not supported atm
	sudo docker run --rm --name=marytts -p 59125:80 -it sepia/marytts:amd64
fi
