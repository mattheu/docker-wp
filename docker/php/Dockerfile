FROM php:7-fpm-alpine

# Install some general stuff.
RUN apk add --no-cache sudo bash sed less ncurses git

# Install PHP extensions we need.
# gd, mysqli opcache.
# Taken from the WP docker image.
RUN set -ex; \
	apk add --no-cache --virtual .build-deps libjpeg-turbo-dev libpng-dev; \
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache; \
	runDeps="$( \
		scanelf --needed --nobanner --recursive \
			/usr/local/lib/php/extensions \
			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
			| sort -u \
			| xargs -r apk info --installed \
			| sort -u \
	)"; \
	apk add --virtual .wordpress-phpexts-rundeps $runDeps; \
	apk del .build-deps

# Install Memcached
RUN set -xe \
	&& apk update \
	&& apk upgrade \
	&& apk add --no-cache libmemcached-dev zlib-dev cyrus-sasl-dev \
	&& docker-php-source extract \
	&& git clone --branch php7 https://github.com/php-memcached-dev/php-memcached.git /usr/src/php/ext/memcached/ \
	&& docker-php-ext-configure memcached \
	&& docker-php-ext-install memcached \
	&& docker-php-source delete \
	&& apk del --no-cache zlib-dev cyrus-sasl-dev \
	&& rm -rf /tmp/* /var/cache/apk/*

# Install WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY docker/php/wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp
