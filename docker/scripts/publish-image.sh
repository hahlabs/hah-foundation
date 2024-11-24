#!/bin/bash
# used to publish the current ALPHA image to docker hub as beta or shams (default is beta)

 if [ -z $1 ]; then  PUBLISH_ENV=alpha; else  PUBLISH_ENV=$1; fi
./set-env.sh $1
. .env
 cat ../secrets/docker-hahlabsdevops-access-token.txt | docker login --username hahlabsdevops --password-stdin
 echo "Pushing image: "  $IMAGE_TAG:$PUBLISH_ENV-$RELEASE
 docker tag $ORG_ID/$IMAGE_NAME:$ENV $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV-$RELEASE
 docker tag $ORG_ID/$IMAGE_NAME:$ENV $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV
 docker push $DEBUG $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV-$RELEASE
 docker push $DEBUG $ORG_ID/$IMAGE_NAME:$PUBLISH_ENV
 echo "image:  $CONTAINER_NAME $IMAGE_TAG:$PUBLISH_ENV-$RELEASE  pushed into repository OK! $?"
