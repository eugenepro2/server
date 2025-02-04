FROM node:20.18.2

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN npm install && npm audit fix --force   

COPY . /app

ENV NODE_ENV production
ENTRYPOINT ["node", "-r", "esm", "./bin/server"]
