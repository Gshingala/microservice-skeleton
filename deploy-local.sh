#!/bin/bash


if [ $? -ne 0 ]; then
    echo "Deployment failed! Need at least a service name!"
    exit
fi

docker-compose stop $1
./compile.sh $1
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build $1