#!/bin/bash

# wp core download

# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz
# mv wordpress/* .
# rm -rf latest.tar.gz
# rm -rf wordpress

# # Configuration du wp-config.php
# wp config create --allow-root \
# --dbname=${DB_DATABASE} \
# --dbuser=${DB_USER} \
# --dbpass=${DB_ROOT_PASSWORD} \
# --dbhost=${HOSTNAME} 

# # Configuration du admin USER
# wp core install \
# --url{$DOMAIN_NAME} \
# --title={$HOSTNAME} \
# --admin_user={$ADMIN_USER} \
# --admin_password={$ADMIN_PASSWORD} \
# --admin_email={$ADMIN_EMAIL} \
# --local="fr_FR"

# # Configuration du USER
# wp user create $USER_NAME $USER_EMAIL \
# --send-email={$USER_EMAIL} \
# --role="subscriber" \
# --user_pass={$USER_PASSWORD}

cd /var/www/html/

wp core download --allow-root

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_DATABASE}/" wp-config.php;
sed -i "s/username_here/${DB_USER}/" wp-config.php;
sed -i "s/password_here/${DB_ROOT_PASSWORD}/" wp-config.php;
sed -i "s/localhost/${HOSTNAME}/" wp-config.php;

# Configuration du admin USER
wp core install --allow-root \
--url=${DOMAIN_NAME} \
--title="LUCAS QUI" \
--admin_user=${ADMIN_USER} \
--admin_password=${ADMIN_PASSWORD} \
--admin_email=${ADMIN_EMAIL} 

# Configuration du USER
wp user create --allow-root $USER_NAME $USER_EMAIL \
--send-email=${USER_EMAIL} \
--role="subscriber" \
--user_pass=${USER_PASSWORD}
