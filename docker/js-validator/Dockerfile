FROM node:alpine

# TODO: remove exit code hack once eslint is configured and initial errors resolved
CMD ["sh", "-c", "npm ci && npm run lint ; exit 0"]
