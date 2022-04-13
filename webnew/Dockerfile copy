
FROM ubuntu:latest
USER root

# RUN addgroup app && adduser -S -G app app
# RUN mkdir /app && chown app:app /app
# USER app

# FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install sudo

ENV user root

# RUN useradd -m -d /home/${user} ${user} && \
#     chown -R ${user} /home/${user} && \
#     adduser ${user} sudo && \
#     echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# USER ${user}

WORKDIR /app



# WORKDIR /app
# WORKDIR /home/app
# COPY ./package.json /home/app/package.json
# Install node and npm:
# ENV NODE_VERSION 16

COPY package.json ./
# COPY package-lock.json ./
COPY ./ ./
# RUN apt-get update
# RUN apt-get -y install curl gnupg

RUN sudo apt-get update && sudo apt-get install -y curl sudo

# Node
# Uncomment your target version
# RUN curl -fsSL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN sudo curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN echo "NODE Version:" && node --version
RUN echo "NPM Version:" && npm --version






# SO installation
#So now you have two Pythons, the one from the Docker image (where you're pip installing) and the one you run on the command-line, which is different.
# RUN apt-get update && apt-get install -y \
#         software-properties-common
# RUN add-apt-repository ppa:deadsnakes/ppa \
#     && apt-get update \
#     && apt-get install -y \
#         python3.8 \
#         python3-pip \
#         python3-setuptools \
#         python3.8-dev
# RUN apt-get install -y libmysqlclient-dev
# RUN rm -rf /var/lib/apt/lists/*

# project root files ----------not sure
# RUN mkdir /code

#To avoid errors, you should ensure that the Python packages pip, wheel and setuptools are up to date before proceeding with the installation.
# RUN python3.8 -m pip install --upgrade pip setuptools wheel 

# RUN sudo apt install npm
# RUN npm install
RUN sudo mkdir -p /app/node_modules
RUN sudo mkdir -p  /app/node_modules/.cache
RUN sudo mkdir -p /app/node_modules/.cache/.eslintcache
# RUN sudo chmod 777 app/node_modules/.cache -R
RUN sudo npm config set unsafe-perm true
RUN sudo npm config set legacy-peer-deps true
# RUN sudo npm audit fix --force
# RUN sudo npm uninstall node-sass
# RUN sudo npm install sass
RUN sudo npm install --save --legacy-peer-deps -f
RUN sudo chown -R ${user} /app/*
RUN sudo chown -R ${user} /app/node_modules/*
RUN sudo mkdir -p node_modules/.cache && sudo chmod -R 777 node_modules/.cache
RUN sudo mkdir -p node_modules/.cache && sudo chattr -R -ia  node_modules/.cache
# RUN sudo npm i --save-dev @types/node


CMD ["sudo","npm", "run", "start"]



# # pull official base image
# FROM node:13.12.0-alpine

# # set working directory
# WORKDIR /app

# # add `/app/node_modules/.bin` to $PATH
# ENV PATH /app/node_modules/.bin:$PATH

# # install app dependencies
# COPY package.json ./
# COPY package-lock.json ./

# RUN npm install

# # add app
# COPY . ./

# # start app
# CMD ["npm", "start"]
