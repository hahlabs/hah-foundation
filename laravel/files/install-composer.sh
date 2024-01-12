#!/bin/bash
cd /home/hahlabs/files
apt install -y curl
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
cd /home/hahlabs