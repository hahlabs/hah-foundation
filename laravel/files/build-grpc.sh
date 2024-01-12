#!/bin/bash
# apt install -y autoconf zlib1g-dev php8.2-dev php-pear 
# pecl channel-update pecl.php.net
# pecl install grpc protobuf

cp files/*.so /usr/lib/php/20220829/
sed -Ei 's/;extension=zip/extension=grpc/' /etc/php/8.2/cli/php.ini
sed -Ei 's/;extension=xsl/extension=protobuf/' /etc/php/8.2/cli/php.ini