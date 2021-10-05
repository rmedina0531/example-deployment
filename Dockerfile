#defined as the builder phase
FROM node:alpine as builder
WORKDIR /home/node/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#define host phase
FROM nginx
EXPOSE 80
COPY --from=builder /home/node/app/build /usr/share/nginx/html
