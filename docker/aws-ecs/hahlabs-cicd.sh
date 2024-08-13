#!/bin/bash
# this executable is designed to work on codeCatalyst project hahlabs-docker, customize settings to work in another environment
# 1. set DOCKER_DIR <- git clone directory
# 2. create & place [docker-hahlabs-access-key.txt <- dockerhub Access Key] in home directory ~

#possible settings : 
# ./hahlabs-cicd.sh [build <alpha-00.04.02>] : deployed task-def and creates a service, optionally builds and push 
if [ -z $DOCKER_DIR ]
 then
   echo "DOCKER_DIR is not set, using default"
   DOCKER_DIR=/projects/docker
fi
echo "DOCKER_DIR=$DOCKER_DIR"
# Enable job control
set -m

if [  "$1" = 'build' ]
 then 
   docker rm -f $(docker ps -aq) 
   docker image rm -f $(docker images -q) 
   docker system prune -af
  echo "Docker cache cleared..."
   cd $DOCKER_DIR/aws-ecs
   cat ~/docker-hahlabs-access-key.txt | docker login --username hahlabs --password-stdin
  # build 3 containers in multi-tasking 
  echo "building ..."
  cd ../mysql && ../mysql/build-run.sh & \
  cd ../angular && ../angular/build-run.sh & \
  cd ../laravel && ../laravel/build-run.sh && fg

  # push 3 containers in multi-tasking 
  echo "tagging and push to dockerhub ..."
  cat ~/docker-hahlabs-access-key.txt | docker login --username hahlabs --password-stdin
  cd ../mysql && ../scripts/docker-tag.sh $2 push & \
  cd ../laravel &&   ../scripts/docker-tag.sh $2 push & \
  cd ../angular && ../scripts/docker-tag.sh $2 push && fg
   
   # import 3 containers into AWS ECR
   echo "tagging and push to AWS ECR ..."
   ../aws-ecs/import-docker-image.sh
fi
cd $DOCKER_DIR/aws-ecs
mkdir output
./hahlabs-create-task-def.sh
# Check the exit status of the cp command
status=$?
if [ $status -eq 0 ]; then
  echo "hahlabs task def created successfully"
else
  echo "hahlabs task def creation failed : Exit code ($status)"
  exit 
fi
./hahlabs-create-service.sh
status=$?
if [ $status -eq 0 ]; then
  echo "service hahlabs-service created successfully"
else
  echo "service hahlabs-service creation failed : Exit code ($status)"
  exit 
fi
echo "All done."