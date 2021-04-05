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

RUN		apt-get update -y \
		&& apt-get upgrade -y

## Install & set-up phpMyAdmin ##

RUN		mkdir -p /downloads

RUN		mkdir -p /var/www/html/phpmyadmin

ADD		https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz /downloads/

RUN		tar xvf /downloads/phpMyAdmin-5.1.0-english.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin

RUN		apt-get install php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql -y \
		&& apt-get install mariadb-server mariadb-client -y

COPY	srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php

## Install nginx ##

RUN		apt-get install nginx -y

## Install Wordpress ##

RUN		apt-get install wordpress -y

## Expose http & https ports ##

EXPOSE	80 443

## Execute dockerfile ##

COPY	srcs/script.sh /script.sh

CMD		/bin/sh /script.sh
