FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm config set strict-ssl false
RUN npm install
RUN npm config set strict-ssl true
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html