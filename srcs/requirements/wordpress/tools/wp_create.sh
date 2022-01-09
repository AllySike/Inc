#!/usr/bin/env bash

if ! [ -f "/var/www/html/wp-config.php" ]; then
	apt-get install curl -y
	apt-get install mariadb-client -y
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
 	wp core download --locale=ru_RU --path=wp --allow-root 
	cd wp	
	wp core config --dbhost=mariadb --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --allow-root
	wp core install --url=${URL} --title=${TITLE} --admin_user=${MARIADB_USER} --admin_password=${MARIADB_PASSWORD} --admin_email=${EMAIL_ADMIN} --skip-email --allow-root
	wp user create --allow-root ${USER_NAME} ${USER_EMAIL} --role=subscriber --user_pass=${USER_PASSWORD}
	mv * /var/www/html/
	echo "Create site in Wordpress..."
	cd /var/www/html/
	wp post delete 1 --allow-root
fi

exec "$@"
