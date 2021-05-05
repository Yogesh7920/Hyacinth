FROM node:14.16

RUN mkdir -p /cache
WORKDIR /cache
COPY package*.json ./
RUN npm install
RUN npm run compile


RUN mkdir -p /code
WORKDIR /code/

EXPOSE 4200
