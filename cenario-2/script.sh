#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
PRIVATE_IP=`hostname -I | awk '{print $1}'`
echo "<center><h1>My private ip is: $PRIVATE_IP </h1></center>" > /var/www/html/index.html