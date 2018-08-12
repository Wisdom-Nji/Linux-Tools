#!/bin/bash

# usage: domain_name location

echo $1 $2
syntax=$'<VirtualHost *:80>\n\tServerName '$1$'.localhost\n\tServerAdmin webmaster@localhost\n\tDocumentRoot '$2/$1$'\n\tErrorLog ${APACHE_LOG_DIR}/error.log\n\tCustomLog ${APACHE_LOG_DIR}/access.log combined\n</VirtualHost>'

mkdir $2/$1
# echo "$syntax"

echo "$syntax" > /etc/apache2/sites-available/$1.conf
a2ensite $1.conf
service apache2 restart
