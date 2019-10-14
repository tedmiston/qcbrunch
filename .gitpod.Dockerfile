FROM gitpod/workspace-full

RUN brew install jsonnet
RUN npm install -g npm
RUN npm install -g now
