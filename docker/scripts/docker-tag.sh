#!/bin/bash

# usage : ./docker-tag.sh <target-tag> 
# this command takes the image from wip tag (local), 
# NOTE: you need to populate $ORG_ID, $IMAGE_NAME in .env file in local directory 
# 1. replaces tag wip to <$1>
# 2. add dev tag to the image
# 3. removes the wip tag from the image
# 4. if command "push" was provided; it pushes it to the docker registry both target tag and dev (you need to login first)
# 5. use DEBUG if set (-q)

. .env
echo "Tagging container: " $CONTAINER_NAME $IMAGE_TAG $RELEASE
docker tag $ORG_ID/$IMAGE_NAME:wip $ORG_ID/$IMAGE_NAME:$ENV-$RELEASE
echo "Tagged " $ORG_ID/$IMAGE_NAME:$ENV-$RELEASE "[OK]"
docker tag $ORG_ID/$IMAGE_NAME:$ENV-$RELEASE $ORG_ID/$IMAGE_NAME:$ENV
echo "Tagged " $ORG_ID/$IMAGE_NAME:$ENV "[OK]"
docker rmi -f $ORG_ID/$IMAGE_NAME:wip
docker images | grep $ORG_ID/$IMAGE_NAME

