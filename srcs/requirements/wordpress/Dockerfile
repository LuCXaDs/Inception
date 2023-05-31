# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 9000

RUN apt-get update

# Installation de PHP version 7.3
RUN apt-get install -y php7.3

# Installation de PHP-MSQL : fait la laison entre PHP et les base de données MYSQL
RUN apt-get install -y php-mysql

# Installation de PHP-FPM : permet de traiter les requêtes PHP
RUN apt-get install -y php-fpm

RUN apt-get install -y curl

# Création du dossier HTML
RUN mkdir -p /var/www/html

# Configuration de wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Configuration du répertoire de travail
WORKDIR /var/www/html

# Téléchargement de WordPress avec WP-CLI : permet de gerer les installation de plugin, gestion des utilisateurs...
RUN wp core download --allow-root

# Change les propriétés d'un répertoire ou d'un fichier
RUN chown -R www-data:www-data /var/www/*
RUN chmod 755 /var/www/*

RUN mkdir -p /run/php

# Modifie la configuration de PHP-FPM pour qu'il écoute sur le port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf


# Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
RUN rm -rf /var/lib/apt/lists/*

# Exécute la commande php-fpm en version 7.3 en arrière plan
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]