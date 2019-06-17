FROM node:alpine@sha256:fcdc1a07dca436dc90254a3afe2304a0c16e14a656c5c28b597b307e73a66a9f

RUN apk update && \
    apk upgrade && \
    apk add \
        bash \
        bash-completion \
        bash-doc

RUN pwd
RUN ls -al
RUN ls -al $HOME
RUN ls -al $GITHUB_WORKSPACE

CMD ["sh", "-c", "npm ci && npm run lint"]
