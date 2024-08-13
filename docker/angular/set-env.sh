#!/bin/bash
if [ -z $1 ]; then ENV=alpha; else ENV=$1; fi
cat <<EOF > .env
export DOCKER_ID="hahlabs"
export IMAGE_NAME="angular"
export CONTAINER_NAME="hahlabs-view"
export IMAGE_TAG=\$DOCKER_ID/\$IMAGE_NAME
export PUSH=push
export ENV=$ENV
export DEBUG=-q
echo \$DOCKER_ID/\$IMAGE_NAME \$CONTAINER_NAME
export TAG=$ENV-00.07.03
EOF

cat .env
