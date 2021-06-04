# docker-containers

Various Docker build scripts for different projects and related stuff.

## Useful commands

- build Dockerfile: `sudo docker build -t [new-image-tag] .`
- run with bash: `sudo docker run -it --name [container-name] -p [port-outside]:[port-inside] [image-tag]`
- commit changes: `sudo docker commit [container-name] [new-image-tag]`
