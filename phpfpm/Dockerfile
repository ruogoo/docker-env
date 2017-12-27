FROM php:fpm

MAINTAINER HyanCat <hyancat@live.cn>

# Prepare Env
RUN apt-get update
RUN apt-get install -y apt-transport-https

ADD sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        imagemagick \
        libmagickwand-dev \
        libssl-dev

RUN apt-get autoremove -y && apt-get clean && rm -r /var/lib/apt/lists/*

# PHP config

ADD php-fpm.conf /usr/local/etc/php-fpm.conf

ADD php.ini /usr/local/etc/php/php.ini

# Install PHP extensions

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install opcache

RUN pecl install imagick && docker-php-ext-enable imagick
RUN pecl install mongodb && docker-php-ext-enable mongodb

# User Permission

RUN useradd -M -s /usr/sbin/nologin docker

RUN mkdir /docker
RUN chown -R docker.docker /docker
WORKDIR /docker

EXPOSE 9000
VOLUME ["/docker"]
