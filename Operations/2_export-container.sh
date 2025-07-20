#! /usr/bin/bash

set -e

source ../set_envars
export LOGFILE=../Logfiles/export-container.log
rm --force $LOGFILE

echo "Exporting container to image tarball" | tee --append $LOGFILE
time $HOST_SERVICE export $CONTAINER_NAME \
  | gzip -c > $IMAGE_NAME.tgz

echo ""
echo "Exports" | tee --append $LOGFILE
du -h *.tgz | tee --append $LOGFILE

echo ""
echo "Finished"
