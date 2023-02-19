# Coqui-TTS

This is the Coqui-TTS version used for SEPIA open assistant with Mary-TTS API support as a stand-alone Docker container.  
  
The build uses a reverse proxy (Nginx) internally (port 80) to avoid CORS problems with Coqui-TTS server.
Images are available for **aarch64** and **amd64**.  
  
To start the container you can use the run script (`bash run_container.sh -h`) or for example:  
  
`sudo docker run --rm --name=coqui_tts -p 59125:80 -it sepia/coqui-tts:aarch64` (or: `coqui-tts:amd64`)  
  
- To download and use a specific model add the environment variable `MODEL_NAME`, e.g.: `--env MODEL_NAME="tts_models/en/ljspeech/glow-tts"`
- You can set number of threads used via: `--env NUM_THREADS=2`
- To save downloaded models create a 'data' folder and add it via: `-v "./data":"/home/admin/.local/share/tts"`
  
The Coqui-TTS test page can then be reached via: `http://[host-IP]:59125`  
  
Check this link for images: https://hub.docker.com/r/sepia/coqui-tts
