#!/bin/bash
# run as root
apt install -y openssh-server

sed -Ei 's/#Port 22/Port $1/' /etc/ssh/sshd_config

service ssh start