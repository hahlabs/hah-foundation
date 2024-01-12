#!/bin/bash

# usage : ./docker-tag.sh <target-tag> 
# this command takes the image from wip tag (local), 
# NOTE: you need to populate $DOCKER_ID, $IMAGE_NAME in .env file in local directory 
# 1. replaces tag wip to <$1>
# 2. add dev tag to the image
# 3. removes the wip tag from the image
# 4. if command "push" was provided; it pushes it to the docker registry both target tag and dev (you need to login first)
# 5. use DEBUG if set (-q)

. .env
echo "Tagging container: " $CONTAINER_NAME $IMAGE_TAG $TAG
docker tag $DOCKER_ID/$IMAGE_NAME:wip $DOCKER_ID/$IMAGE_NAME:$1
docker tag $DOCKER_ID/$IMAGE_NAME:wip $DOCKER_ID/$IMAGE_NAME:$ENV
echo "tagged " $DOCKER_ID/$IMAGE_NAME:$1 " and " $DOCKER_ID/$IMAGE_NAME:$ENV "[OK]"
docker rmi -f $DOCKER_ID/$IMAGE_NAME:wip
docker images | grep $DOCKER_ID/$IMAGE_NAME
if [ $PUSH == "push" ]; then
 cat ../scripts/docker-hahlabs-access-token.txt | docker login --username hahlabs --password-stdin
 echo "Pushing image: "  $IMAGE_TAG:$ENV
 docker push $DEBUG $DOCKER_ID/$IMAGE_NAME:$ENV
 docker push $DEBUG $DOCKER_ID/$IMAGE_NAME:$1
 echo "image:  $CONTAINER_NAME $IMAGE_TAG:$ENV  pushed into repository OK!"
 else
 echo "skip push."
fi
