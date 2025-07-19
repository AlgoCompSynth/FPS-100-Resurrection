#! /usr/bin/bash

set -e

echo "Quietly building fps-100-resurrection image"
time podman build --quiet --tag fps-100-resurrection .
echo ""
podman images

echo ""
echo "Running fresh 'podman-fps-100' container"
echo "Ignore any 'No such container' messages"
podman rm --force podman-fps-100
podman run --interactive --tty --name podman-fps-100 fps-100-resurrection

echo ""
echo "Finished"
