Docker WordPress
================

A really basic WP docker environment. Basically it is just Nginx, PHP, MySQL with a few WP things such as WP-CLI.

It mounts the `www` directory so just clone your project or install WP in this directory.

DB settings. Use these in your wp-config.php to connect to the DB.

```
define('DB_NAME', 'wordpress');
define('DB_USER', 'root');
define('DB_PASSWORD', 'root');
define('DB_HOST', 'db');
```

## TODO

- memcache
- PHPUnit.
- xdebug
- map domains
