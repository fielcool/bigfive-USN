FROM node:16

#RUN apk add make nasm autoconf automake libtool dpkg pkgconfig libpng libpng-dev g++

WORKDIR /home/node/app

COPY . .

ARG MONGODB_COLLECTION
ARG MONGODB_URL
ENV MONGODB_COLLECTION=${MONGODB_COLLECTION}
ENV MONGODB_URL=${MONGODB_URL}

RUN yarn setup

RUN yarn build

EXPOSE 3000

CMD [ "yarn", "start" ]
