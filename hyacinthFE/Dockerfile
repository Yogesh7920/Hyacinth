FROM node:14.16

RUN mkdir -p /cache
WORKDIR /cache
COPY package*.json ./
RUN npm install
RUN ngcc

RUN mkdir -p /code
WORKDIR /code/

EXPOSE 4200
