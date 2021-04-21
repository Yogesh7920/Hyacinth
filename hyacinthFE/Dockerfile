FROM node:14.16

RUN mkdir -p /workspace/angular
WORKDIR /workspace/angular
COPY package*.json ./
RUN npm install -g @angular/cli
RUN npm install

EXPOSE 4200

CMD ng serve --host 0.0.0.0 --disableHostCheck --poll 500