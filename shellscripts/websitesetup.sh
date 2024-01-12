#!/bin/bash

echo "Installing Dependency for the websites"
echo
sudo yum install wget httpd unzip -y
echo "Done brilliant!"

echo "Lets start and enable services"
systemctl start httpd > /dev/null
systemctl enable httpd > /dev/null
echo 

echo "lets check service status"
systemctl status httpd

echo "lets create space for our website"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

echo "Pull our website from template"
wget https://www.tooplate.com/zip-templates/2098_health.zip
unzip 2098_health.zip
cp -r 2098_health/* /var/www/html/
echo

echo "Time to restart service"
systemctl restart httpd

echo "Please check output on browser"
ip addr show
