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

## WP-CLI

You can run WP-CLI commands on the PHP container like so.

`docker exec CONTAINER wp core version`

## TODO

- memcache
- PHPUnit.
- xdebug
- ImageMagick/Gmagick.
- map domains
