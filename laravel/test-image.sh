#!/bin/bash
. .env
docker rm -f $CONTAINER_NAME
docker run -ditp 8201:8201 -p 8210:8210 -p 8222:8222 --name $CONTAINER_NAME $IMAGE_TAG:$ENV
docker exec -it $CONTAINER_NAME /bin/bash