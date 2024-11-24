#!/bin/bash
# Usage : publish-all.sh 

BUILD=${1,,}
COMMAND=./build-image
PUBLISH=""
case $BUILD in
  core)
  ;;
  alpha)
  ;;
  publish)
    COMMAND=./publish-image
    BUILD=core
    PUBLISH=publish
   ;;
  *)
  echo "Invalid build type: $BUILD Assuming [core] and [build-image] command"
  BUILD="core"
  ;;
esac
if [ ! -z $2 ] && [ ${2,,} = "publish" ] ; then
  COMMAND=./publish-image
  PUBLISH=publish
fi
echo "HAH Foundation docker builds $BUILD and $COMMAND command $PUBLISH"
echo "Building and publishing hahlabs docker containers..."
echo "HAHLABS docker builds errors $(date)" > ../scripts/logs/hahlabs-build-run.err
echo "HAHLABS docker builds starts $(date)" > ../scripts/logs/hahlabs-build-run.log
echo "Build Ubuntu base image...Please wait"
seconds0=$(date +"%s")
cd ../ubuntu && nohup $COMMAND $BUILD >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null
cd ../mysql && nohup $COMMAND $BUILD  >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../laravel && nohup $COMMAND $BUILD   >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null & 
cd ../angular && nohup $COMMAND $BUILD   >> ../scripts/logs/hahlabs-build-run.log 2>> ../scripts/logs/hahlabs-build-run.err < /dev/null &
cd ../scripts

jobs

echo "Job started $(date +'%A %B %d @ %HH:%MM:%SS') Waiting . . ."
while true;do echo -n .;sleep 1;done &
wait %1 && wait %2 && wait %3
kill $!; trap 'kill $!' SIGTERM
seconds1=$(date +"%s")
echo !$((seconds1 - seconds0))  seconds 

if [ ! -z $BUILD ] && [ $BUILD = "core" ] ; then 
 echo "PWD: " `pwd`
 ./build-all alpha $PUBLISH 

fi
docker images | grep hahlabs