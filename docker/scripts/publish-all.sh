#!/bin/bash
# Usage : publish-all.sh 
TARGET=$1
echo "Building and publishing hahlabs docker containers...[$TARGET]"
echo "HAHLABS docker builds errors $(date)" > ../scripts/logs/hahlabs-build-run.err
echo "HAHLABS docker builds starts $(date)" > ../scripts/logs/hahlabs-build-run.log
echo "Build Ubuntu base image...Please wait"
cd ../ubuntu && nohup ./publish-image $TARGET >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null
cd ../mysql && nohup ./publish-image $TARGET  >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../laravel && nohup ./publish-image $TARGET  >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../angular && nohup ./publish-image $TARGET  >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null &

jobs
echo "Waiting ..."
wait %1 && wait %2 && wait %3
echo "Done."
if [ $TARGET = "core" ]; then 
    echo "TARGET = $TARGET"
    cd ../scripts && ./publish-all.sh alpha
fi
docker images | grep hahlabs