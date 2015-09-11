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

RUN pecl install memcached && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini
RUN pecl install redis && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
RUN pecl install memcache && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini
RUN pecl install imagick && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/imagick.ini
RUN pecl install xdebug && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
        

# PHP config

ADD php-fpm.conf /usr/local/etc/php-fpm.conf

# Composer
ADD http://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# User Permission

RUN useradd -M -s /usr/sbin/nologin webuser
RUN usermod -u 1000 webuser

RUN mkdir /docker
RUN chown -R webuser.webuser /docker
WORKDIR /docker

EXPOSE 9000
VOLUME ["/docker"]
