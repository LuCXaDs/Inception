# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 3306

RUN apt-get update

# Installation de MARIADB
RUN apt-get install -y mariadb-server mariadb-client

# # COPY my.cnf /etc/mysql/my.cnf

# Création du répertoire mysqld
RUN mkdir -p /run/script

# # Change les propriétés du répertoire en "mysql:mysql"
# RUN chown mysql:mysql /var/run/mysqld/mysqld.sock

# # Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
# RUN rm -rf /var/lib/apt/lists/*

# # Exécute la commande mysql en arrière plan
# CMD ["mysql"]

COPY init.sh /run/script/init.sh

# Donnez les droits d'exécution au script
RUN chmod +x /run/script/init.sh

# Définir le point d'entrée pour exécuter le script d'initialisation
ENTRYPOINT ["/run/script/init.sh"]

# COPY ./tools/mariadb.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/
# RUN chmod +x /usr/local/bin/mariadb.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

# Le container peux se lancer dans toutes les adresses IPV4
CMD ["mysqld", "--bind-address=0.0.0.0"]