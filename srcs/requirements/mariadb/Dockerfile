# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 3306

RUN apt-get update

# Installation de MARIADB
RUN apt-get install -y mariadb-server 

# Création du répertoire mysqld
RUN mkdir -p /run/script

COPY ./script/mariadb.sh /run/script/mariadb.sh

# Donnez les droits d'exécution au script
RUN chmod +x /run/script/mariadb.sh

# Définir le point d'entrée pour exécuter le script d'initialisation
ENTRYPOINT ["/run/script/mariadb.sh"]

# Le container peux se lancer dans toutes les adresses IPV4
CMD ["mysqld", "--bind-address=0.0.0.0"]