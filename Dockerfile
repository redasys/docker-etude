FROM node:alpine
LABEL authors="bob.egan"

WORKDIR '/app'

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run start