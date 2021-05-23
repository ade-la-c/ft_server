CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'ade-la-c'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'ade-la-c'@'localhost' IDENTIFIED BY '1234';
/*update mysql.user set plugin='mysql_native_password' where user='ade-la-c';
*/
FLUSH PRIVILEGES;