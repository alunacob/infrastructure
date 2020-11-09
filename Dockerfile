FROM ubuntu:latest

LABEL maintainer="Adrian Luna adrian.luna@satcen.europa.eu"

# Install basic CLI tools etc.
RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        git-core \
        iputils-ping \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        wget \
        python3.6

# Upgrade pip
RUN pip install --upgrade pip

# Install tensorflowjs for py
RUN pip install tensorflowjs

# Install NodeJS
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install --yes nodejs

# Install tfjs-node
RUN npm install --save @tensorflow/tfjs
RUN npm install --save @tensorflow/tfjs-node

# Clean up commands
RUN apt-get autoremove -y && apt-get clean && \
    rm -rf /usr/local/src/*

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR "/root/project"
CMD ["/bin/bash"]