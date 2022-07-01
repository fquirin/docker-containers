# Mary-TTS

This is the Mary-TTS version used for SEPIA open assistant as a stand-alone Docker container.  
  
The build contains carefully selected voices for German and English and uses a reverse proxy (Nginx) internally to avoid CORS problems with Mary-TTS server.
Images are available for **aarch64** and **amd64**.  
  
The proxy runs on port 80. To start the container you can use for example:  
  
`sudo docker run --rm --name=marytts -p 59125:80 -it sepia/marytts:aarch64` (or: `marytts:amd64`)  
  
The Mary-TTS test page can then be reached via: http://[host-IP]:59125  
  
Check this link for images: https://hub.docker.com/r/sepia/marytts
