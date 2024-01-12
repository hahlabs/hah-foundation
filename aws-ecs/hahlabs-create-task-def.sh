#!/bin/bash
echo "create task def: task-def..."
aws ecs register-task-definition --cli-input-json file://./hahlabs-task-def.json > task-def-output.json
status="$?"
exit $status
cat task-def-output.json