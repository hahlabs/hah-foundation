#!/bin/bash

service nginx restart 
service php8.2-fpm start

tail -f /dev/null

