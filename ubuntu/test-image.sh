#!/bin/bash
. .env
docker rm -f $CONTAINER_NAME
docker run -dit --name $CONTAINER_NAME $IMAGE_TAG:$ENV
docker exec -it $CONTAINER_NAME /bin/bash