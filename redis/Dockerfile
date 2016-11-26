FROM redis

MAINTAINER HyanCat <hyancat@live.cn>

# default port 6379, it should be changed to anthor port.
ENV REDIS_PORT 6379

EXPOSE $REDIS_PORT

CMD redis-server --port $REDIS_PORT --protected-mode no
