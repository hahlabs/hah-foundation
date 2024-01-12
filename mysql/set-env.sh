#!/bin/bash
if [ -z $1 ]; then ENV=alpha; else ENV=$1; fi
cat <<EOF > .env
export DOCKER_ID="hahlabs"
export IMAGE_NAME="mysql"
export CONTAINER_NAME="hahlabs-db"
export IMAGE_TAG=\$DOCKER_ID/\$IMAGE_NAME
export PUSH=skip
export ENV=$ENV
# export DEBUG=-q
echo \$DOCKER_ID/\$IMAGE_NAME \$CONTAINER_NAME
EOF

cat .env
