#!/bin/bash
# used to publish [core|alpha] image to docker hub 
BUILD=${1,,}
if [ -z $BUILD ]; then BUILD=alpha; fi
 if [ -z $BUILD ]; then  PUBLISH_ENV=alpha; else  PUBLISH_ENV=$BUILD; fi
./set-env.sh $BUILD
. .env
 cat secrets/docker-hahlabsdevops-access-token.txt | docker login --username hahlabsdevops --password-stdin
 echo "Pushing image: "  $IMAGE_TAG:$PUBLISH_ENV-$RELEASE
 docker tag $ORG_ID/$IMAGE_NAME:$ENV $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV-$RELEASE
 docker tag $ORG_ID/$IMAGE_NAME:$ENV $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV
 docker push $DEBUG $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV-$RELEASE
 docker push $DEBUG $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV
 echo "image:  $CONTAINER_NAME $IMAGE_TAG:$PUBLISH_ENV-$RELEASE  pushed into repository OK! $?"
