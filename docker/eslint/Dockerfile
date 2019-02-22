FROM node:alpine

COPY .eslintrc.js ./
COPY js/ ./js/
COPY package-lock.json ./
COPY package.json ./

RUN npm ci

CMD ["npm", "run", "lint"]
