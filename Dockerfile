## stage1
FROM node:latest as builder

RUN mkdir /devsa

WORKDIR /devsa

COPY *.json ./

RUN npm install

COPY . .

RUN yarn build

## stage 2

FROM nginx:latest

COPY --from=builder /devsa/build/    /usr/share/nginx/html/
