## stage1
FROM node:latest as builder

RUN mkdir /devd

WORKDIR /devd

COPY *.json ./

RUN npm install

COPY . .

RUN yarn build

## stage 2

FROM nginx:latest

COPY --from=builder /devsa/build/    /usr/share/nginx/html/
