FROM mysql:5.7

MAINTAINER HyanCat <hyancat@live.cn>

# Write Permission
RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

ENV MYSQL_PORT 3306
EXPOSE $MYSQL_PORT
