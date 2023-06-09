# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 9000

RUN apt-get update
 
# Installation de PHP version 7.3
# Installation de PHP-MSQL : fait la laison entre PHP et les base de données MYSQL
# Installation de PHP-FPM : permet de traiter les requêtes PHP
RUN apt-get install -y  php7.3 php-mysql php-fpm curl mariadb-client

COPY wordpress.sh /var/www/wordpress.sh

# # Donnez les droits d'exécution au script
RUN chmod +x /var/www/wordpress.sh

RUN chown -R www-data:www-data /var/www/*

# # Change les propriétés d'un répertoire ou d'un fichier
RUN chmod 775 /var/www/*

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

# Modifie la configuration de PHP-FPM pour qu'il écoute sur le port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf;

# Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
RUN rm -rf /var/lib/apt/lists/*

# Définir le point d'entrée pour exécuter le script d'initialisation
ENTRYPOINT ["/var/www/wordpress.sh"]

# Exécute la commande php-fpm en version 7.3 en arrière plan
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]