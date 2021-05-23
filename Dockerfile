# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ade-la-c <ade-la-c@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/22 18:35:49 by ade-la-c          #+#    #+#              #
#    Updated: 2021/03/30 15:47:41 by ade-la-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

LABEL	ade-la-c <ade-la-c@student.s19.be>
RUN		apt-get update -y && apt-get upgrade -y && apt-get clean -y

## Install & set-up php & phpMyAdmin/mariadb ##

RUN		apt-get install php php-mysql -y
RUN		apt-get install php7.3 php7.3-fpm php7.3-mysql php-mbstring php-xml -y
RUN		apt-get install mariadb-server mariadb-client -y

RUN		mkdir -p /var/www/html/phpmyadmin
ADD		https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz ./
RUN		tar -xzvf phpMyAdmin-5.1.0-english.tar.gz
RUN		mv phpMyAdmin-5.1.0-english var/www/html/phpMyAdmin
RUN		rm phpMyAdmin-5.1.0-english.tar.gz
#RUN		chmod 777 /var/www/html/phpMyAdmin/tmp

COPY	srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php
ADD		./srcs/db.sql .
RUN		service mysql start && cat < db.sql | mariadb -u root

## Install & config nginx ##

RUN		apt-get install nginx -y
RUN		apt-get install openssl -y
ADD		/srcs/nginx.conf /etc/nginx/sites-available/
ADD		/srcs/nginx.conf /etc/nginx/sites-enabled/

## Install Wordpress ##

ADD		https://wordpress.org/latest.tar.gz /tmp
RUN 	cd /tmp && tar xzvf latest.tar.gz
RUN		cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
RUN		mkdir /var/www/html/wordpress
RUN		cp -a /tmp/wordpress/. /var/www/html/wordpress
RUN		chown -R www-data:www-data /var/www/html/wordpress
RUN		rm tmp/latest.tar.gz
ADD		srcs/wp-config.php /var/www/html/wordpress

## Install & setup SSL ##

ADD		https://github.com/FiloSottile/mkcert/releases/download/v1.4.2/mkcert-v1.4.2-linux-amd64 ./
RUN		mv mkcert-v1.4.2-linux-amd64 mkcert && chmod +x /mkcert && /mkcert -install && /mkcert localhost.com

## Config index & mariadb ##

RUN		rm var/www/html/index.html && rm var/www/html/index.nginx-debian.html
ADD		/srcs/index.html /var/www/html/
#ADD		/srcs/script.sh ./
ADD		./srcs/config.inc.php ./tmp/config.inc.php

## Start service ##

RUN		service nginx start
RUN		service php7.3-fpm start && service mysql start

## Expose http & https ports ##

EXPOSE	80 443

## Execute dockerfile ##

#COPY	srcs/script.sh /script.sh

#CMD		/bin/sh /script.sh
CMD		service php7.3-fpm start && service mysql start && nginx -g "daemon off;"
