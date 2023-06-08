# Création de l'environnement
FROM debian:buster

# Ouverture d'un port unique
EXPOSE 3306

RUN apt-get update

# Installation de MARIADB
RUN apt-get install -y mariadb-server 

# # COPY my.cnf /etc/mysql/my.cnf

# Création du répertoire mysqld
RUN mkdir -p /run/script

COPY init.sh /run/script/init.sh

# Donnez les droits d'exécution au script
RUN chmod +x /run/script/init.sh

# Définir le point d'entrée pour exécuter le script d'initialisation
ENTRYPOINT ["/run/script/init.sh"]

# Le container peux se lancer dans toutes les adresses IPV4
CMD ["mysqld", "--bind-address=0.0.0.0"]