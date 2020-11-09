FROM ubuntu:latest

LABEL maintainer="Adrian Luna adrian.luna@satcen.europa.eu"

# Install basic CLI tools etc.
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        curl \
        software-properties-common \
        unzip \
        wget \
        python3 python3-pip

# Upgrade pip
#RUN pip3 install --upgrade pip3

# Install tensorflowjs for py
RUN pip3 install tensorflowjs

# Install NodeJS
RUN curl --silent --location https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install --yes nodejs

# Install tfjs-node
RUN npm install --save @tensorflow/tfjs
RUN npm install --save @tensorflow/tfjs-node
RUN npm install -g @angular/cli 

# Clean up commands
RUN apt-get autoremove -y && apt-get clean && \
    rm -rf /usr/local/src/*

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR "/root/project"
CMD ["/bin/bash"]