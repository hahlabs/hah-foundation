#!/bin/bash
apt install -y sudo
usermod -aG sudo hahlabs
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
