FROM debian:buster-slim

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Run 1
RUN echo 'Installing dependencies...' && \
#
#   Dependencies
    apt-get update && \
#   Fix for Debian9/10 slim to be able to install Java
    mkdir -p /usr/share/man/man1 && \
#   Core packages
    apt-get install -y --no-install-recommends \
	sudo wget nano unzip \
	openjdk-11-jre-headless \
	nginx && \
#
#   Clean up
    apt-get clean && apt-get autoclean && apt-get autoremove -y && \
#
#   Create user
    useradd --create-home --shell /bin/bash admin && \
    adduser admin sudo && \
    echo "admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#
# ENV
#SOME_ENV_VAR=/...my-stuff

# USER
USER admin

# COPY files
COPY ./install /home/admin/install/

# Run
RUN echo "Installing Mary-TTS ..." && \
    mkdir -p /home/admin/marytts && cd /home/admin/marytts && \
    wget https://github.com/fquirin/marytts/releases/latest/download/marytts.zip && \
    unzip marytts.zip && \
    rm marytts.zip && \
    sudo rm /etc/nginx/sites-enabled/default && \
    sudo cp /home/admin/install/proxy /etc/nginx/sites-enabled/ && \
    cp /home/admin/install/run.sh /home/admin/marytts/ && \
    cp /home/admin/install/on-docker.sh /home/admin/
	
# Start
WORKDIR /home/admin
CMD bash on-docker.sh
#CMD /bin/bash
