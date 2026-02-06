FROM redis:alpine

LABEL maintainer="hyancat.cn@gmail.com"

# default port 6379, it should be changed to anthor port.
ENV REDIS_PORT 6379
# default password "secret", it should be modified.
ENV REDIS_PASSWORD secret

EXPOSE $REDIS_PORT

CMD redis-server \
    --port $REDIS_PORT \
    --requirepass $REDIS_PASSWORD \
    --protected-mode no \
    --appendonly yes \
    --auto-aof-rewrite-percentage 100 \
    --auto-aof-rewrite-min-size 128mb \
    --maxmemory 512mb \
    --maxmemory-policy allkeys-lru
