#!/bin/bash
sudo yum update
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install git -y
sudo chmod 777 /var/www/html
cd /var/www/html
git clone https://github.com/jabbourdan/web.git