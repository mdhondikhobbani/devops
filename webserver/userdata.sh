#!/bin/bash -v
yum install -y httpd
mkdir -p /var/www
mkdir -p /var/www/html
curl https://raw.githubusercontent.com/veeru01/terraform/master/webserver/index.html > /var/www/html/index.html
curl https://raw.githubusercontent.com/veeru01/terraform/master/webserver/httpd.conf > /etc/httpd/conf/httpd.conf
service httpd restart
