FROM nginx:1.15-alpine

LABEL maintainer="hyancat.cn@gmail.com"

# Nginx Config
ADD nginx.conf /etc/nginx/nginx.conf

# User Permission
RUN adduser -s /usr/sbin/nologin -D -H docker

RUN mkdir /docker && mkdir /docker/app
RUN echo "<h1>Hello Docker !</h1>" > /docker/app/index.html
RUN chown -R docker.docker /docker

WORKDIR /docker

EXPOSE 80 443

VOLUME ["/docker"]
