# docker-env

**Docker deployment for development and production.**

All the services include:

- Nginx
- PHP
- MySQL
- Memcached
- Redis
- MongoDB

## Usage

1. Configure

        ./configure.sh

2. Change the configure files if you want.

3. Run

        docker-compose up -d


## Configure

#### General

Generally by executing the `configure.sh` shell, all the basic configure will be ok.

#### Nginx

1. You can add any nginx config file named with `.conf` suffix to `nginx/conf.d` folder

2. And you should add shared volumes in `docker-compose.yml`

3. Then restart the container.

> Enjoy it!

#### MySQL

1. Put a new `my.cnf` file in the `mysql/conf.d` folder if needed.

2. Then restart the container.

> Well, It's OK!

#### PHP

After executing the `configure.sh` shell, The `php.ini` and `php-fpm.conf` files can be changed if necessary.

## Data Storage

- The shared `MySQL` data files will be located in `data/mysql` folder.
- The shared `MongoDB` data files will be located in `data/mongodb` folder.

## License

`ruogoo/docker-env` has worked well on **ruogoo.com** for a long time.

*Everyone can bring it to other product, but do not guarantee it works.*

This Source code is under [MIT license](https://github.com/ruogoo/docker-env/blob/master/LICENSE).


