# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 3306

RUN apt-get update

# Installation de MARIADB
RUN apt-get install -y mariadb-server mariadb-client

# COPY my.cnf /etc/mysql/my.cnf


# Supprime les fichier après l'installation des paquets pour réduire la taille de l'image du conteneur
RUN rm -rf /var/lib/apt/lists/*

# Exécute la commande mysql en arrière plan
CMD ["/usr/sbin/mysql","--nodaemonize"]