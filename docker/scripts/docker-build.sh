# usage docker-build.sh <tag> <- default "wip"
# source file, to source .env in local environment that set $DOCKER_ID, $IMAGE_NAME
# build typical tag $DOCKER_ID/$IMAGE_NAME:wip

. .env

echo "Building image:" $IMAGE_TAG:wip

docker buildx build $DEBUG -t $IMAGE_TAG:wip .
