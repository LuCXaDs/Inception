#!/bin/bash

# Démarrer le service MySQL
service mysql start

# Attendre que le service démarre complètement (vous pouvez ajuster le délai si nécessaire)
sleep 10

# Changer les propriétés du fichier mysqld.sock
chown mysql:mysql /var/run/mysqld/mysqld.sock

# Garder le conteneur en cours d'exécution
tail -f /dev/null

mysql_secure_installation << EOF
OK
y
lol
lol
y
y
y
y
EOF