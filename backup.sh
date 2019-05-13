#!/bin/sh

DIR=`dirname $0`
DATA_DIR=$DIR/data/backup
DOCKER_COMPOSE=/usr/local/bin/docker-compose

function log() {
    echo "[`date +"%Y-%m-%d %H:%m:%S"`] ==== $1"
}

## Clean mysql dump
function clean_mysql_dump() {
    log "开始清理旧备份"
    local FILES=`find $DATA_DIR -mtime +7 -type f | grep dump`
    rm -f $FILES
    for file in $FILES; do
        echo $file
    done
    log "清理旧备份成功"
}

## Backup mysql database
function mysql_dump() {
    local CONTAINER_ID=`cd $DIR && $DOCKER_COMPOSE ps -q mysql`
    local MYSQL_USER=root
    local MYSQL_PASSWORD=`cat $DIR/docker-compose.yml | grep MYSQL_ROOT_PASSWORD | awk '{print $2}'`
    local MYSQL_PORT=`cat $DIR/docker-compose.yml | grep MYSQL_PORT | awk '{print $2}'`
    local TIME=`date +"%Y%m%d_%H_%M_%S"`

    log "开始新备份"

    # Must not with '-it' for cron.
    docker exec $CONTAINER_ID \
        /usr/bin/mysqldump \
        -u$MYSQL_USER \
        -p$MYSQL_PASSWORD \
        -P$MYSQL_PORT \
        --all-databases \
        > $DATA_DIR/mysql_dump_$TIME.sql

    log "完成新备份 $DATA_DIR/mysql_dump_$TIME.sql"
}

clean_mysql_dump
mysql_dump

## end
