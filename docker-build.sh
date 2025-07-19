#! /usr/bin/bash

set -e

echo "Quietly building fps-100-resurrection Docker image"
time docker build --tag fps-100-resurrection . > docker-build.log 2>&1
echo ""
docker images

echo ""
echo "Running fresh 'docker-fps-100' container"
echo "Ignore any 'No such container' messages"
docker rm --force docker-fps-100
docker run --interactive --tty --name docker-fps-100 fps-100-resurrection

echo ""
echo "Finished"
