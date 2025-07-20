#! /usr/bin/bash

set -e

source ../set_envars
export LOGFILE=../Logfiles/build-and-run.log
rm --force $LOGFILE

echo "Quietly building image" | tee --append $LOGFILE
time $HOST_SERVICE build --tag $IMAGE_NAME:build . \
  >> $LOGFILE 2>&1

echo ""
echo "Images" | tee --append $LOGFILE
$HOST_SERVICE images | tee --append $LOGFILE

echo ""
echo "Running fresh container" | tee --append $LOGFILE
echo "Ignore any 'No such container' messages"
$HOST_SERVICE rm --force $CONTAINER_NAME | tee --append $LOGFILE
$HOST_SERVICE run --interactive --tty \
  --name $CONTAINER_NAME \
  $IMAGE_NAME:build

echo ""
echo "Containers" | tee --append $LOGFILE
$HOST_SERVICE ps --all | tee --append $LOGFILE

echo ""
echo "Finished"
