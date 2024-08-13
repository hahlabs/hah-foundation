#!/bin/bash
# port 8101
mkdir -p /var/www/hahlabs-view
cp files/nginx-hahlabs-view-virtual-host /etc/nginx/sites-available/hahlabs-view
ln -s /etc/nginx/sites-available/hahlabs-view /etc/nginx/sites-enabled/hahlabs-view
cp files/nginx.index.html /var/www/hahlabs-view