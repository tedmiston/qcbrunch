FROM node:alpine

# COPY .eslintrc.js ./
# COPY js/ ./js/
# COPY package-lock.json ./
# COPY package.json ./

RUN whoami

RUN echo $HOME
RUN ls $HOME

RUN echo $GITHUB_WORKSPACE
RUN ls $GITHUB_WORKSPACE

RUN ls /github/workspace

RUN pwd
RUN ls

RUN npm ci

CMD ["npm", "run", "lint"]
