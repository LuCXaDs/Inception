#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then

	mkdir -p /var/www/html

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/html;

	wp core download --allow-root;

	mv wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/${DB_DATABASE}/" wp-config.php;
	sed -i "s/username_here/${DB_USER}/" wp-config.php;
	sed -i "s/password_here/${DB_ROOT_PASSWORD}/" wp-config.php;
	sed -i "s/localhost/${HOSTNAME}/" wp-config.php;

	wp core install --allow-root \
		--url=${WP_URL} \
		--title=${WP_TITLE} \
		--admin_user=${ADMIN_NAME} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL}

	wp user create --allow-root ${USER_NAME} ${USER_EMAIL} --user_pass=${USER_PASSWORD};
	
fi

exec "$@"


# #check if wp-config.php exist
# if [ -f ./wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else

# ####### MANDATORY PART ##########

# 	#Download wordpress and all config file
# 	wget http://wordpress.org/latest.tar.gz
# 	tar xfz latest.tar.gz
# 	mv wordpress/* .
# 	rm -rf latest.tar.gz
# 	rm -rf wordpress

# 	#Inport env variables in the config file
# 	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# 	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# 	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# 	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
# 	cp wp-config-sample.php wp-config.php

# fi

# exec "$@"