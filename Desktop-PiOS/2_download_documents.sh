#! /usr/bin/env bash

set -e

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

echo ""
echo "* Download Documents *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/1_download_documents.log
rm --force $LOGFILE

mkdir --parents "$HOME/Documents/PiDP_11"
pushd "$HOME/Documents/PiDP_11" > /dev/null
  echo "PiDP 11 Manual: \$HOME/Documents/PiDP_11" | tee --append $LOGFILE
  wget \
    --no-clobber \
    --append-output=$LOGFILE \
    https://pidp.net/pidp11/PiDP-11_Manual.odt
  lowriter --convert-to pdf PiDP-11_Manual.odt 2> /dev/null
popd > /dev/null

pushd "$HOME/Documents" > /dev/null
  echo "Bitsavers FPS software" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/bits/FloatingPointSystems/FPS100 1 $LOGFILE
  pushd $HOME/Documents/bitsavers.org/bits/FloatingPointSystems/FPS100/ > /dev/null
    unzip -qqo fps100sw.zip
    wget \
      --no-clobber \
      --append-output=$LOGFILE \
      https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100flxDamaged.tap
  popd > /dev/null

  echo "Bitsavers FPS documents" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems 1 $LOGFILE
  echo "..Bitsavers FPS AP-120B" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B/AP-120B_Schematics/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/AP-120B/GE_AP-CT/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/brochures/ 1 $LOGFILE
  echo "..Bitsavers FPS FPS-100/3000/5000" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS-100_Schematics/ 2 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-100/pictures/ 2 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-3000/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-5000/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/GE_RDCP_Processor/ 1 $LOGFILE
  echo "..Bitsavers FPS miscellaneous" | tee --append $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/FPS-164/ 1 $LOGFILE
  recursive_wget https://bitsavers.org/pdf/floatingPointSystems/T_Series/ 1 $LOGFILE
popd > /dev/null

mkdir --parents "$HOME/Documents/DEC"
pushd "$HOME/Documents/DEC" > /dev/null
  echo "DEC Manuals: \$HOME/Documents/DEC" | tee --append $LOGFILE
  curl --silent --location --remote-name \
    https://bitsavers.trailing-edge.com/pdf/dec/pdp11/1170/PDP-11_70_Handbook_1977-78.pdf
  curl --silent --location --remote-name \
    http://bitsavers.informatik.uni-stuttgart.de/pdf/dec/pdp11/rsx11m_s/RSX11M_V3.1_Dec77/1A_System_Reference_Information/DEC-11-OMBGA-A_D_RSX-11M_Beginners_Guide_Jun77.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s/Pieper_RSX_A_Guide_For_Users_1987.pdf 
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s/RSX11M_V4.2_Jul85/AA-M476A-TK_EDT_Editor_Manual_198309.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s/RSX11M_V4.2_Jul85/AA-L763B-TC_Introduction_to_RSX-11M_198507.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s/RSX11M_V4.1_Apr83/4_ProgramDevelopment/AA-L676A-TC_gdPgmDevel_198111.pdf
  curl --silent --location --remote-name \
    https://www.dmv.net/dec/pdf/pdp11fortranivlrm.pdf
popd > /dev/null

echo "* Finished Download Documents *"
