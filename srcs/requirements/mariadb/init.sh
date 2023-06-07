#!/bin/bash

# Démarrer le service MySQL
service mysql start

# Attendre que le service démarre complètement (vous pouvez ajuster le délai si nécessaire)
sleep 10

# # Changer les propriétés du fichier mysqld.sock
# chown mysql:mysql /var/run/mysqld/mysqld.sock

mysql_secure_installation << EOF
Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
Y
Y
Y
EOF

mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS $DB_DATABASE;
GRANT ALL ON $DB_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

service mysql stop

exec "$@"
