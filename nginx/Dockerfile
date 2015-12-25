FROM nginx

MAINTAINER HyanCat <hyancat@live.cn>

# Nginx Config
ADD nginx.conf /etc/nginx/nginx.conf

# User Permission
RUN useradd -M -s /usr/sbin/nologin docker

RUN mkdir /docker && mkdir /docker/app
RUN echo "<h1>Hello Docker !</h1>" > /docker/app/index.html
RUN chown -R docker.docker /docker

WORKDIR /docker

EXPOSE 80 443

VOLUME ["/docker"]
