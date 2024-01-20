#!/bin/bash
# docker rm -f $(docker ps -aq)
# docker rmi -f $(docker images -q)
# docker system prune -af
echo "Building hahlabs docker containers...$1"
echo "HAHLABS docker builds errors $(date)" > ../scripts/logs/hahlabs-build-run.err
echo "HAHLABS docker builds starts $(date)" > ../scripts/logs/hahlabs-build-run.log
echo "Build Ubuntu base image...Please wait"
cd ../ubuntu && nohup ./build-run $1 >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null
cd ../mysql && nohup ./build-run $1 >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../laravel && nohup ./build-run $1 >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../angular && nohup ./build-run $1 >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null &

jobs

if [ ! -z $1 ]; then 
    wait %1 && wait %2 && wait %3
    cd ../scripts && ./build-all.sh
fi
