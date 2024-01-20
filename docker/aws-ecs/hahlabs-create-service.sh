#!/bin/bash
echo "create service hahlabs-mysql service..."

aws ecs create-service --cluster hahlabs-cluster \
   --service-name hahlabs-service \
   --task-definition hahlabs-task-def \
   --desired-count 1 --launch-type "FARGATE" \
   --network-configuration "awsvpcConfiguration={subnets=[subnet-0289e8562c95a0480,subnet-00dad856ad1e4bb71,subnet-0234b0ed328ffe600],securityGroups=[sg-02d3bc0d395714d21],assignPublicIp=ENABLED}" \
   --enable-execute-command   > output/create-service-output.json