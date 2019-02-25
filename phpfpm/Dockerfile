FROM php:7.2.8-fpm-alpine

LABEL maintainer="hyancat.cn@gmail.com"

# Prepare Env

ADD repositories /etc/apk/repositories

RUN set -xe; \
        \
        apk add --no-cache \
        git \
        memcached-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        jpeg-dev \
        zlib-dev \
        libzip libzip-dev \
        libxml2 \
        imagemagick imagemagick-dev \
        curl \
        openssl openssl-dev

# PHP config

ADD php-fpm.conf /usr/local/etc/php-fpm.conf

ADD php.ini /usr/local/etc/php/php.ini

# Install PHP extensions

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install opcache \
        && docker-php-ext-install bcmath

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS linux-headers

RUN pecl install imagick-3.4.3 && docker-php-ext-enable imagick
RUN pecl install redis-3.1.6 && docker-php-ext-enable redis

RUN apk del .phpize-deps

# User Permission

RUN adduser -D -h /docker docker

WORKDIR /docker

EXPOSE 9000
VOLUME ["/docker"]
