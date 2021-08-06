# docker-containers

Various Docker build scripts for different projects and related stuff.

## Install Docker

The easiest way is to use the 'get-docker' script from: https://github.com/docker/docker-install  

```
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

## Docker Container Lifecycle

The lifecycle of a Docker image/container: `pull -> run -> stop -> remove -> delete`  
  
Good to know: 
- A stopped container keeps its state and can be started again (internal programs are closed though).
- To fully reset a container it needs to be stopped and removed.
- The state of a running or stopped container can be made permanent via a commit.
- Commits create additional layers that can increase the container size significantly.
- Commits will ignore external data from volumes
- If you create a volume using an empty folder (host) and connect it to a container folder that is not empty (-v flag) it will be filled with the container data at first run. This ONLY works for named volumes.

## Useful commands / Cheat Sheet

Some variables used in cheat sheet:
- `[image-tag]`: The tag or "name" of an image, e.g. `myrepo/myimage:latest`
- `[container-name]`: If you run an image you give it a name (with the --name flag), e.g. `my_container`. If you don't define a name Docker will create a random one.

### Basics

- get image: `sudo docker pull [image-tag]`
- show images: `sudo docker images`
- show active (running or stopped) containers: `sudo docker container ls`
- remove stopped container: `sudo docker rm [container-name]`
- remove all stopped containers: `sudo docker images prune`
- delete image: `sudo docker rmi [image-tag]`
- get config info about image: `sudo docker inspect [image-tag]`

### Build and Update

- build Dockerfile: `sudo docker build -t [new-image-tag] .`
- build Dockerfile without cache: `sudo docker build --no-cache -t [new-image-tag] .`
- commit changes: `sudo docker commit [container-name] [new-image-tag]`
- rename image: `sudo docker image tag [old-image-tag] [new-image-tag]`

### Run, Enter and Stop

- run with bash: `sudo docker run -it --name [container-name] -p [port-outside]:[port-inside] [image-tag]`
- run with bash (overwrite entrypoint): `sudo docker run -it --name [container-name] --entrypoint=/bin/bash [image-tag]`
- run with volume and auto-remove: `sudo docker run --rm -it -v [volume-name/folder-outside]:[folder-inside] [image-tag]`
- run with ENV variable (e.g for internal settings): `sudo docker run --env VAR1=value1 [image-tag]`
- run container in background: `sudo docker run --rm -d [image-tag]`
- enter running container via bash: `sudo docker exec -it [container-name] /bin/bash`
- stop background container: `sudo docker stop [container-name]`
- restart a stopped container: `sudo docker start [container-name]`

### Volumes

- list all volumes: `sudo docker volume ls`
- create a volume: `sudo docker volume create --opt type=none --opt device=[host-folder] --opt o=bind [volume-name]`
- remove a volume: `sudo docker volume rm [volume-name]`

### Upload

- login to default registry (e.g. Docker-HUB): `sudo docker login --username=[my-user]`
- push image: `sudo docker image push [image-tag]`
- logout of registry: `sudo docker logout`
