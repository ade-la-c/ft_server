# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ade-la-c <ade-la-c@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 17:52:17 by ade-la-c          #+#    #+#              #
#    Updated: 2021/03/25 18:28:18 by ade-la-c         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service mysql restart
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'ade-la-c'@'localhost';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'ade-la-c'@'localhost' IDENTIFIED BY '1234' WITH GRANT OPTION;"
mysql -u root -e "update mysql.user set plugin='mysql_native_password' where user='ade-la-c';"
mysql -u root -e "FLUSH PRIVILEGES;"

service nginx start && service php7.3-fpm start && service mysql restart
