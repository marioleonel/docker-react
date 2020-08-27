FROM node:alpine as builder
WORKDIR '/app'
COPY package.json $WORKDIR
RUN npm install
COPY . $WORKDIR
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html