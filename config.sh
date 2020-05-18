#!/bin/bash

# update the server
yum update -y

# install apache
yum install httpd -y

# install php and maria db connection
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

cd /var/www/html

# aws uses it for health checks
echo "healthy" > healthy.html

# Download and install wordpress
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 /var/www/html
chown -R apache:apache /var/www/html
service httpd start
chkconfig httpd on

