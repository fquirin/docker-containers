FROM python:3.10-bullseye

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# Run 1
RUN echo 'Installing core system...' && \
#
#   Dependencies
    apt update && \
#   Core packages
    apt install -y --no-install-recommends \
        sudo wget curl nano zip unzip git \
        python3-pip python3-dev python3-setuptools python3-wheel python3-venv && \
#   Pip packages
    pip3 install --upgrade pip && \
#   Create user
    useradd --create-home --shell /bin/bash admin && \
    adduser admin sudo && \
    echo "admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
#   Clean up
    pip3 cache purge && \
    apt clean && apt autoclean && apt autoremove -y

# USER
USER admin

# ENV
ENV ISDOCKER="true"

# COPY files
#COPY ./install /home/admin/install/

# Run 3
#RUN echo "Installing files ..." && \

# Start
WORKDIR /home/admin
#CMD bash on-docker.sh
CMD /bin/bash
