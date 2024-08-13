#!/bin/bash
. .env
docker rm -f $CONTAINER_NAME
docker run -ditp 3306:3306 -p 8022:8022 --name $CONTAINER_NAME $IMAGE_TAG:$ENV
docker exec -it $CONTAINER_NAME /bin/bash