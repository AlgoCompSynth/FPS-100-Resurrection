#! /usr/bin/env bash

set -e

echo ""
echo "* Bitsavers FPS Documents *"

# first parameter is URL, second is levels, third is LOGFILE
function recursive_wget () {
  wget \
    --recursive \
    --no-parent \
    --accept pdf,zip,jpg,jpeg,tif,tap,txt \
    --level=$2 \
    --convert-links \
    --backup-converted \
    --adjust-extension \
    --append-output=$3 \
    $1
}

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/4_bitsavers_fps_docs.log
rm --force $LOGFILE

pushd "$HOME/Documents" > /dev/null
  echo "Generic FPS" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems 1 $LOGFILE
  echo "AP-120B" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B/AP-120B_Schematics/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B/GE_AP-CT/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/brochures/ 1 $LOGFILE
  echo "FPS-100/3000/5000" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS-100_Schematics/ 2 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/pictures/ 2 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-3000/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-5000/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/GE_RDCP_Processor/ 1 $LOGFILE
  echo "Miscellaneous" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-164/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/T_Series/ 1 $LOGFILE

popd > /dev/null

echo "* Finished Bitsavers FPS Documents *"
