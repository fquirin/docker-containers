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
        sudo wget nano unzip && \
#   Create user
    useradd --create-home --shell /bin/bash admin && \
    adduser admin sudo && \
    echo "admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# USER
USER admin

# Run 2
RUN echo 'Installing app...' && \
#
#   App packages
    sudo apt install -y --no-install-recommends \
		python3-pip python3-dev python3-setuptools python3-wheel python3-venv \
		espeak-ng libsndfile1 \
		gcc g++ \
		nginx && \
# export PATH=$HOME/.local/bin:$PATH && \
#   Pip packages
    pip3 install --upgrade pip && \
    mkdir -p /home/admin/coqui-tts && \
    cd /home/admin/coqui-tts && \
    git clone https://github.com/fquirin/TTS && \
    cd TTS && \
#   NOTE: for x86 we can use torch+cpu and torchaudio+cpu from https://download.pytorch.org/whl/torch_stable.html, e.g.:
#   pip3 install https://download.pytorch.org/whl/cpu/torch-1.13.1%2Bcpu-cp310-cp310-linux_x86_64.whl && \
#   pip3 install https://download.pytorch.org/whl/cpu/torchaudio-0.13.1%2Bcpu-cp310-cp310-linux_x86_64.whl && \
    pip3 install -e . && \
#
#   Clean up
    pip3 cache purge && \
    sudo apt remove -y gcc g++ && \
    sudo apt clean && sudo apt autoclean && sudo apt autoremove -y
#
# ENV
ENV ISDOCKER="true"

# COPY files
COPY ./install /home/admin/install/

# Run 3
RUN echo "Installing files ..." && \
    cd /home/admin/coqui-tts && \
    sudo rm /etc/nginx/sites-enabled/default && \
    sudo cp /home/admin/install/proxy /etc/nginx/sites-enabled/ && \
    cp /home/admin/install/run.sh /home/admin/coqui-tts/ && \
    cp /home/admin/install/on-docker.sh /home/admin/ && \
    mkdir -p /home/admin/.local/share/tts

# Start
WORKDIR /home/admin
CMD bash on-docker.sh
#CMD /bin/bash
