#!/bin/bash
. .env
docker rm -f $CONTAINER_NAME
docker run -ditp 8101:8101 -p 8122:8122 --name $CONTAINER_NAME $IMAGE_TAG:$ENV
docker exec -it $CONTAINER_NAME /bin/bash