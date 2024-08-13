#!/bin/bash
# apt install -y autoconf zlib1g-dev php8.2-dev php-pear 
# pecl channel-update pecl.php.net
# pecl install grpc protobuf

cp files/lib/*.so /usr/lib/php/20220829/
cp files/lib/20-grpc.ini /etc/php/8.2/cli/conf.d
cp files/lib/20-grpc.ini /etc/php/8.2/fpm/conf.d
