FROM node:alpine as builder

WORKDIR /home/docker-react/

COPY package.json .
RUN npm i

COPY . .

RUN npm run build


FROM nginx

COPY --from=builder /home/docker-react/build /usr/share/nginx/html