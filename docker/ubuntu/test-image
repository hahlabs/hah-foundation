#!/bin/bash
. .env
echo "Test run [" $CONTAINER_NAME "]"
docker rm -f $CONTAINER_NAME
docker run -dit --name $CONTAINER_NAME $IMAGE_TAG:$ENV-$RELEASE
docker exec -it $CONTAINER_NAME /bin/bash