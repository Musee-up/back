FROM node:16-alpine

WORKDIR /home/back

COPY package*.json ./

ENV NODE_ENV=dev

RUN apk add --upgrade --no-cache vips-dev build-base --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/
RUN yarn add --platform=linuxmusl --arch=x64 sharp
RUN yarn install

COPY . .

EXPOSE 1337

CMD ["yarn", "develop"]
