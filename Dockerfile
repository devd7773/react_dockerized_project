## stage1
FROM node:latest as builder

RUN mkdir /devd

WORKDIR /devd

COPY *.json ./

RUN npm install

COPY . .

RUN npm run build

## stage 2

FROM nginx:latest

COPY --from=builder /devd/build/    /usr/share/nginx/html/
