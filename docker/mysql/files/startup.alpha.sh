#!/bin/bash
service mysql restart
service ssh start
cron -f