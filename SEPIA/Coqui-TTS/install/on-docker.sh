#!/bin/bash
sudo service nginx start
cd coqui-tts
bash run.sh
if [ $? -eq 1 ]; then
    exit 1
fi
# KEEP DOCKER ALIVE
trap : TERM INT; sleep infinity & wait
