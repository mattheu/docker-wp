Docker WordPress
================

A really basic WP docker environment. Basically it is just Nginx, PHP, MySQL with a few WP things such as WP-CLI.

## Getting started.

- The `www` directory is shared with the PHP docker container. This is your public directory. You can clone your project here.
- run `docker-compose up -d`
- Visit `http://localhost:8080` in your browser.

## Database.

DB settings. Use these in your wp-config.php to connect to the DB.

```
define('DB_NAME', 'wordpress');
define('DB_USER', 'root');
define('DB_PASSWORD', 'root');
define('DB_HOST', 'db');
```

The database directory is mounted to `/database`, which ensures you don't lose your data when you stop or destroy your containers.

There are also some scripts that you can run to backup and restore from and to the file `./db-backup.sql`.

* To save a backup to `./db-backup.sql`, run `sh ./docker/scripts/db-dump.sh $DB_CONTAINER` where `$DB_CONTAINER` is the name or ID of the database container.
* To restore the database from the file `./db-backup.sql`, run `sh ./docker/scripts/db-restore.sh $DB_CONTAINER` where `$DB_CONTAINER` is the name or ID of the database container.

You can access the database using an app like [Sequel Pro](https://www.sequelpro.com/). Use the following settings:

Type: `TC/IP` Host: `127.0.0.1` Username: `root`, Password: `root` port: `3306`.

## Memcached

Memcached is installed. To use it, you should note that it is a separate container. If you are using the [Human Made memcached drop-in (as included in hm-platform)](https://github.com/humanmade/wordpress-pecl-memcached-object-cache), then you will need to set the value of `$memcached_servers` to the following in your wp-config.php.

```
global $memcached_servers;
$memcached_servers = [
    [
        'memcached', // Memcached server IP address
        11211        // Memcached server port
    ]
];
```

## PHPUnit

[There is some more info on running PHP unit tests on the wiki.](https://github.com/mattheu/docker-wp/wiki/PHPUnit)

## WP-CLI

You can run WP-CLI commands on the PHP container like so.

`docker exec CONTAINER wp core version`

## TODO

- xdebug
- ImageMagick/Gmagick.
- map domains
