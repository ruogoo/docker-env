# Docker-Production
Docker for Production Environment.

- Nginx
- PHP
- MySQL
- Memcached
- Redis

## Usage
----

	docker-compose up -d


## Configure
----

#### Nginx

1. You can add any nginx config file named with `.conf` suffix to `nginx/conf.d` folder

2. And you should add shared volumes in `docker-compose.yml`

3. Then restart the container.

Enjoy it!

## Data
----

#### MySQL

The shared MySQL data files will be located in `data/mysql` folder.

## Todo
----

#### Log

To add log folder and files.

