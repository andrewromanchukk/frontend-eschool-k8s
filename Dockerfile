FROM node:8.11.2-alpine as node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.13.12-alpine
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
COPY --from=node /usr/src/app/dist/eSchool .
ARG BUILDMODE
RUN sed -i -e "s|https://fierce-shore-32592.herokuapp.com|$BUILDMODE|g" /usr/share/nginx/html/main.js

