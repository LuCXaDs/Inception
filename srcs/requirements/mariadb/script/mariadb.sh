#!/bin/bash

# Démarrer le service MySQL
service mysql start

# Attendre que le service démarre complètement
sleep 10

# Installation minimal de sécurité pour mysql
mysql_secure_installation << EOF
Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
Y
Y
Y
EOF

# Installation de la database
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_DATABASE;
GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

service mysql stop

exec "$@"
