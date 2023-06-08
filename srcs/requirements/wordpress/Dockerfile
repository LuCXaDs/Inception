# # Création de l'environnement
# FROM debian:buster

# # Ouverture d'un port unique
# EXPOSE 9000

# RUN apt-get update

# RUN apt-get install -y vim

# # Installation de PHP version 7.3
# RUN apt-get install -y php7.3

# # Installation de PHP-MSQL : fait la laison entre PHP et les base de données MYSQL
# RUN apt-get install -y php-mysql

# # Installation de PHP-FPM : permet de traiter les requêtes PHP
# RUN apt-get install -y php-fpm

# RUN apt-get install -y 	curl \
# 	bash \
# 	php \
# 	php-cgi \
# 	php-mysql \
# 	php-fpm \
#     mariadb-client \
# 	php-pdo \
# 	php-gd php-cli \
# 	php-mbstring 

# # Création du dossier HTML
# RUN mkdir -p /var/www/html

# # Configuration de wordpress
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp

# # Configuration du répertoire de travail
# # WORKDIR /var/www/html

# # Téléchargement de WordPress avec WP-CLI : permet de gerer les installation de plugin, gestion des utilisateurs...
# # RUN wp core download --allow-root

# # Change les propriétés d'un répertoire ou d'un fichier
# RUN chmod 755 /var/www/*

# RUN mkdir -p /run/php && mkdir -p /run/script

# # Modifie la configuration de PHP-FPM pour qu'il écoute sur le port 9000
# RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

# # Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
# RUN rm -rf /var/lib/apt/lists/*

# COPY wordpress.sh /run/script/wordpress.sh

# # Donnez les droits d'exécution au script
# RUN chmod +x /run/script/wordpress.sh

# # CMD ["sleep", "infinity"]

# # Définir le point d'entrée pour exécuter le script d'initialisation
# ENTRYPOINT ["/run/script/wordpress.sh"]

# # Exécute la commande php-fpm en version 7.3 en arrière plan
# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


FROM debian:buster

EXPOSE 9000

RUN apt-get update
 
RUN apt-get install -y  php7.3 php-mysql php-fpm curl mariadb-client

COPY wordpress.sh /var/www/wordpress.sh

RUN chmod +x /var/www/wordpress.sh

RUN chown -R www-data:www-data /var/www/*

RUN chmod 775 /var/www/*

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf;

# RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/var/www/wordpress.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


# FROM debian:buster

# RUN apt-get update && apt-get install -y  php7.3 php-mysql php-fpm curl mariadb-client

# # # I need to install wp_cli command and put it in the right directory /usr/local/bin
# # RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# #   && chmod +x wp-cli.phar \
# #   && mv wp-cli.phar /usr/local/bin/wp

# #Create the folder to enable php start
# RUN mkdir /run/php

# #we copy the script, give the right to launch it in local on our computer
# COPY wordpress.sh /usr/local/bin/wordpress.sh
# RUN chmod +x /usr/local/bin/wordpress.sh
# ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

# #We go the html directory
# WORKDIR /var/www/html/

# #We expose the 9000 port
# EXPOSE 9000

# #Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
