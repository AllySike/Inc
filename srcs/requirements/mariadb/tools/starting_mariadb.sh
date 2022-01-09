# # !bin/env bash
# chown -R mysql:mysql /var/lib/mysql
# if ! [ -d "var/lib/mysql/wp" ]; then
# service mysql start
# # mysql -u root -p$MARIADB_ROOT_PASSWORD
# mysql -u root -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE DEFAULT CHARACTER SET utf8;"
# mysql -u root -p$MARIADB_ROOT_PASSWORD -e "DROP USER '$MARIADB_USER'@'%'; CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
# mysql -u root -p$MARIADB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER@'%'"
# mysql -u root -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
# # mysqladmin -u root -p$MARIADB_ROOT_PASSWORD password $MARIADB_ROOT_PASSWORD
# # mysql -u root -p$MARIADB_ROOT_PASSWORD
# # mysqladmin -u root -p$MARIADB_ROOT_PASSWORD
# echo "afdsg"
# # mysql -u root -p$MARIADB_ROOT_PASSWORD #--database=$MARIADB_DATABASE
# mysqladmin -u root password $MARIADB_ROOT_PASSWORD
# echo "afgf"
# service mysql stop
# fi
# /usr/bin/mysqld_safe



#!bin/env bash
chown -R mysql:mysql /var/lib/mysql
if ! [ -d "var/lib/mysql/wp" ]; then
service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE DEFAULT CHARACTER SET utf8;"
mysql -u root -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER@'%'"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password $MARIADB_ROOT_PASSWORD
service mysql stop
fi

/usr/bin/mysqld_safe