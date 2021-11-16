FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#Don't need a start up command for NGINX because the image already has it
#/app/build <--- All the stuff we care about
