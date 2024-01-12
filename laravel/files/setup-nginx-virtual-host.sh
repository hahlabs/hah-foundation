#!/bin/bash
# configure nginx - edudate-app virtual host, 

composer create-project laravel/laravel hahlabs-app
mkdir -p /var/storage/hahlabs-app/framework/sessions
mkdir -p /var/storage/hahlabs-app/framework/views
chown -R www-data:www-data /var/storage
chmod -R g+rwx /var/storage
chown -R hahlabs:hahlabs hahlabs-app
rm -rf /home/hahlabs/hahlabs-app/storage
ln -sf /var/storage/hahlabs-app /home/hahlabs/hahlabs-app/storage

cp files/nginx-hahlabs-app-virtual-host /etc/nginx/sites-available/hahlabs-app 
ln -s /etc/nginx/sites-available/hahlabs-app /etc/nginx/sites-enabled/hahlabs-app 
ln -s /home/hahlabs/hahlabs-app /var/www/hahlabs-app
cp files/nginx.index.html /var/www/hahlabs-app/public/hahlabs-info.html 
cp files/phpinfo.php /var/www/hahlabs-app/public/phpinfo.php 
rm /etc/nginx/sites-enabled/default