FROM php:fpm

MAINTAINER HyanCat <hyancat@live.cn>

# Prepare Env

ADD sources.list    /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        git \
        libmemcached-dev \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        imagemagick \
        libmagickwand-dev

RUN apt-get autoremove -y && apt-get clean && rm -r /var/lib/apt/lists/*


# Install PHP extensions

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install zip \
        && docker-php-ext-install gd \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install pdo_mysql

RUN pecl install imagick-beta && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini
        

# PHP config

ADD php-fpm.conf /usr/local/etc/php-fpm.conf

# User Permission

RUN useradd -M -s /usr/sbin/nologin webuser

RUN mkdir /docker
RUN chown -R webuser.webuser /docker
WORKDIR /docker

EXPOSE 9000
VOLUME ["/docker"]
