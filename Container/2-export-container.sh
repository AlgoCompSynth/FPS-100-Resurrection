#! /usr/bin/bash

set -e

source ../set_envars
export LOGFILE=../Logfiles/export-container.log
rm --force $LOGFILE

echo "Exporting container $CONTAINER_NAME to image tarball $TARBALL_NAME" | tee --append $LOGFILE
time $HOST_SERVICE export $CONTAINER_NAME \
  | gzip -c > $TARBALL_NAME

echo ""
echo "Exports:" | tee --append $LOGFILE
echo ""
du -h *.tgz | tee --append $LOGFILE

echo ""
echo "Finished"
