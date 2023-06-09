#!/bin/bash

# Attendre que le service démarre complètement
sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then

	mkdir -p /var/www/html

	# Configuration de wordpress
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/html;

	# Téléchargement de WordPress avec WP-CLI : permet de gerer les installation de plugin, gestion des utilisateurs...
	wp core download --allow-root;

	# Création de wp-config.php plus changement de la config
	cp wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/${DB_DATABASE}/" wp-config.php;
	sed -i "s/username_here/${DB_USER}/" wp-config.php;
	sed -i "s/password_here/${DB_ROOT_PASSWORD}/" wp-config.php;
	sed -i "s/localhost/${HOSTNAME}/" wp-config.php;

	# Création de l'admin
	wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title="LUCAS QUI FAIT UN SITE" \
		--admin_user=${ADMIN_NAME} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL}
	
	# Création d'un user
	wp user create --allow-root ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASSWORD} --role="subscriber";
	
fi

exec "$@"