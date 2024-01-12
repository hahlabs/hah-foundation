# docker
Docker &amp; Kubernetes factories

Docker Login : hahlabs

# Releases:
## Alpha-00.05.02: Latest , dev Jan 4th 2024
# Images:
 - hahlabs/ubuntu: basic ubuntu image, foundation of all images, latest 22.04 + ssh + hahlabs user
 - hahlabs/mysql: basic foundation of mysql server installed, root user local access only, hahlabs user allow remote access, no example schema, mysql user allow login port 3306
 - hahlabs/laravel: basic foundation of nginx, php, laravel with grpc for GCP access, port 8201
 - hahlabs/angular: basic foundation of nginx, angular port 8101

 
Highlights:
1. Updated to latest Ubuntu 22.04 and major enhancements and cleansing to Dockerfiles
2. hahlabs user takes uid/gid 15286 to avoid conflicts with AWS or other container operator users
3. Upgrades to Angular 17.x, nvm, npm, firebase 13.x, MySQL 8.x, php 8.x, laravel 10.x, nginx


# Build and deploy to TURNADO
- $git pull
- if scripts/docker-hahlabs-access-token.txt doesn't exist $cp ~/.ssh/docker-hahlabs-access-token.txt scripts/
- if scripts/logs folder doesn't exist $mkdir -p scripts/logs
- scripts/build-all.sh
- follow progress tail -f scripts/logs/hahlabs-build-run.log
- errors in scripts/logs/hahlabs-build-run.err

# Build and Deploy to AWS ECS
1. Configure environment variable DOCKER_DIR in aws-ecs
2. Configure connection to AWS , aws configure
3. create the file ~/docker-hahlabs-access-key.txt <- populate with DockerHub Access Key>
4. run the script ./hahlabs-cicd.sh [build <tag>] , ex. ./hahlabs-cicd.sh build alpha-00.04.06
  4.1 clear docker registry cache
  4.2 run 3 builds for mysql, laravel, and angular
  4.3 push 3 images to dockerhub registry
  4.4 import 3 images to AWS ECR registry
  4.5 create ECS task def
  4.6 create ECS service
  

# Run Docker image
- docker run -dit       --name $CONTAINER_NAME $IMAGE_TAG

- docker exec -it `docker ps | sed -n /$CONTAINER_NAME/p  | sed -e 's/\(^[[:xdigit:]]\{12\}\).*$/\1/g'` /bin/bash
- docker exec -it $CONTAINER_NAME /bin/bash

 # Bash Append:
 1. The >> operator : echo -e "bla bla \n New line here" > file1.txt
 2. tee -a file1.txt file2.txt ... : multiple files
 3. use /dev/null to eliminate input or output use /dev/null : cat file1.txt > /dev/null < /dev/null