FROM gitpod/workspace-full

RUN echo bust cache
RUN npm install -g npm
RUN npm install -g serve
