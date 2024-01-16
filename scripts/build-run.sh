#!/bin/bash
#usage ./buid-run <image-tag>  ex/ alpha-0.1.12 or lts-3
# docker rm -f $(docker ps -aq)
# docker rmi -f $(docker images -q)
# docker system prune -af
./set-env.sh $1
. .env
export TAG=$ENV-00.07.02

# docker-build source .env and set up parameters
echo "Building docker container: " $CONTAINER_NAME $IMAGE_TAG 

ln -fs Dockerfile.$IMAGE_NAME.$ENV Dockerfile

../scripts/docker-build.sh

../scripts/docker-tag.sh $TAG 

echo  $CONTAINER_NAME $IMAGE_TAG " Built [OK]"
if [ -z ${DEBUG+x} ]; then ./test-image.sh; else echo "skip test image."; fi
