FROM debian:buster

EXPOSE 9000

RUN apt-get update

RUN apt-get install -y php7.3 php-mysql php-fpm curl

RUN mkdir -p /var/www/html

# Configuration de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Configuration du répertoire de travail
WORKDIR /var/www/html

# Téléchargement de WordPress avec WP-CLI
RUN wp core download --allow-root

RUN chown -R www-data:www-data /var/www/*

RUN chmod 755 /var/www/*

RUN mkdir -p /run/php

RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]