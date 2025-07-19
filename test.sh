#! /usr/bin/bash

set -e

docker build --tag fps-100-resurrection .
docker run --interactive --tty --rm fps-100-resurrection
