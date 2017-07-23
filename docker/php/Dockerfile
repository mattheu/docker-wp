FROM php:7.0-fpm-alpine

RUN apk --update libmemcached-dev libjpeg libpng openssh-client libtool make grep autoconf gcc libc-dev zlib-dev
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqlnd mysqli gd \
