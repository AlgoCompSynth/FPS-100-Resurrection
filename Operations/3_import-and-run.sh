#! /usr/bin/bash

set -e

source ../set_envars
export LOGFILE=../Logfiles/import-and-run.log
rm --force $LOGFILE

echo "Importing image" | tee --append $LOGFILE
$HOST_SERVICE import $IMAGE_NAME.tgz $IMAGE_NAME:latest

echo ""
echo "Images" | tee --append $LOGFILE
$HOST_SERVICE images | tee --append $LOGFILE

echo ""
echo "Running fresh container" | tee --append $LOGFILE
echo "Ignore any 'No such container' messages"
$HOST_SERVICE rm --force $CONTAINER_NAME | tee --append $LOGFILE
$HOST_SERVICE run --interactive --tty \
  --user array \
  --workdir /home/array \
  --name $CONTAINER_NAME \
  $IMAGE_NAME:latest \
  /usr/bin/bash

echo ""
echo "Containers" | tee --append $LOGFILE
$HOST_SERVICE ps --all | tee --append $LOGFILE

echo ""
echo "Finished"
