Docker WordPress
================

A really basic WP docker environment. Basically it is just Nginx, PHP, MySQL with a few WP things such as WP-CLI.

## Getting started.

- The `www` directory is shared with the PHP docker container. This is your public directory. You can clone your project here.
- run `docker-compose up -d`

DB settings. Use these in your wp-config.php to connect to the DB.

```
define('DB_NAME', 'wordpress');
define('DB_USER', 'root');
define('DB_PASSWORD', 'root');
define('DB_HOST', 'db');
```

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

## WP-CLI

You can run WP-CLI commands on the PHP container like so.

`docker exec CONTAINER wp core version`

## TODO

- PHPUnit.
- xdebug
- ImageMagick/Gmagick.
- map domains
