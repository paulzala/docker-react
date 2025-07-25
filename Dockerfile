FROM node:16-alpine AS build

WORKDIR /app

COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

###
# Nginx
###

FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
