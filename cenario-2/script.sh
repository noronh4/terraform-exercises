#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
PRIVATE_IP=`hostname -I | awk '{print $1}'`
sudo su
echo "<center><h1>My private ip is: $PRIVATE_IP </h1></center>" > /var/www/html/index.html