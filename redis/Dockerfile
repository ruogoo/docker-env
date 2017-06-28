FROM redis

MAINTAINER HyanCat <hyancat@live.cn>

# default port 6379, it should be changed to anthor port.
ENV REDIS_PORT 6379
# default password "secret", it should be modified.
ENV REDIS_PASSWORD secret

EXPOSE $REDIS_PORT

CMD redis-server \
    --port $REDIS_PORT \
    --requirepass $REDIS_PASSWORD \
    --protected-mode no \
    --appendonly yes
