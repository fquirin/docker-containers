#!/bin/bash
IMAGE_NAME="sepia/coqui-tts"
CONTAINER_NAME="coqui_tts"
VOLUME=$(realpath "./data")
PLATFORM=""
if [ -n "$(uname -m | grep aarch64)" ]; then
	PLATFORM="aarch64"
elif [ -n "$(uname -m | grep armv7l)" ]; then
	# NOTE: ARM 32bit build not supported atm
	echo "Sorry, but ARM 32bit (armv7l) is not supported right now."
	echo exit 1
else
	PLATFORM="amd64"
fi
echo "Platform: $PLATFORM"
#
model_name="tts_models/en/ljspeech/glow-tts"
threads=""
while getopts m:t:h? opt; do
	case $opt in
		m) model_name="$OPTARG";;
		t) threads="$OPTARG";;
		?|h) printf "Usage: %s [-m model_name] [-t threads]\n" $0; exit 2;;
	esac
done
echo "NOTE: Use -h to see options."
#
echo "Coqui-TTS model set to: $model_name"
echo "Shared folder: $VOLUME"
mkdir -p "$VOLUME"
#
sudo docker run --rm --name="$CONTAINER_NAME" \
 -p 59125:80 -it \
 -v "$VOLUME":"/home/admin/.local/share/tts" \
 --env MODEL_NAME="$model_name" --env NUM_THREADS="$threads" \
 "$IMAGE_NAME:$PLATFORM"
