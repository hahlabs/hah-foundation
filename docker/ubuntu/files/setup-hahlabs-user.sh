#!/bin/bash
# creates hahlabs user & grant pemissions
addgroup --gid 5268 hahlabs 
useradd --home-dir /home/hahlabs --gid 5268 --uid 5268 -s /bin/bash hahlabs 
usermod -s /bin/bash root
echo 'hahlabs:Hahlabs!123' | chpasswd 
echo 'root:Root!123' | chpasswd 
cp /home/hahlabs/files/.bashrc /home/hahlabs
chown -R hahlabs:hahlabs /home/hahlabs