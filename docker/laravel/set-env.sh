#!/bin/bash
if [ -z $1 ]; then ENV=alpha; else ENV=$1; fi
cat <<EOF > .env
export ORG_ID="hahlabs"
export IMAGE_NAME="laravel"
export CONTAINER_NAME="hahlabs-app"
export RELEASE=00.08.00
export IMAGE_TAG=\$ORG_ID/\$IMAGE_NAME
# push | skip
export PUSH=push
export ENV=$ENV
#export DEBUG=-q
export DEBUG=
# valid value "YES"
export TESTRUN=NO
echo \$ORG_ID/\$IMAGE_NAME-\$RELEASE \$CONTAINER_NAME
EOF

cat .env
