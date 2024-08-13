#!/bin/bash
#usage ./buid-run <image-tag>  ex/ alpha|shams
# docker rm -f $(docker ps -aq)
# docker rmi -f $(docker images -q)
# docker system prune -af
./set-env.sh $1
. .env

# docker-build source .env and set up parameters
echo "Building docker container: " $CONTAINER_NAME $IMAGE_TAG 

ln -fs Dockerfile.$IMAGE_NAME.$ENV Dockerfile

echo "Building image:" $IMAGE_TAG:wip

docker buildx build $DEBUG -t $IMAGE_TAG:wip .

../scripts/docker-tag.sh 

echo  $CONTAINER_NAME $IMAGE_TAG-$RELEASE " Built [OK]"
if [ $TESTRUN == "YES" ]; then ./test-image.sh; else echo "skip test image."; fi
