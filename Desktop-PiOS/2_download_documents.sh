#! /usr/bin/env bash

set -e

echo ""
echo "* Download Documents *"

# first parameter is URL, second is file, third is LOGFILE
function single_wget () {
  wget \
    --no-clobber \
    --append-output=$3 \
    $1/$2
}

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/2_download_documents.log
rm --force $LOGFILE

mkdir --parents "$HOME/Documents/PiDP_11"
pushd "$HOME/Documents/PiDP_11" > /dev/null
  echo "PiDP 11 / SIMH / RSX-11M Manuals: \$HOME/Documents/PiDP_11" | tee --append $LOGFILE
  single_wget \
    https://pidp.net/pidp11 \
    PiDP-11_Manual.odt \
    $LOGFILE
  lowriter --convert-to pdf PiDP-11_Manual.odt 2> /dev/null

  single_wget \
    https://github.com/simh/simh/raw/refs/heads/master/doc \
    simh_doc.doc \
    $LOGFILE
  lowriter --convert-to pdf simh_doc.doc 2> /dev/null

  single_wget \
    https://github.com/simh/simh/raw/refs/heads/master/doc \
    pdp11_doc.doc \
    $LOGFILE
  lowriter --convert-to pdf pdp11_doc.doc 2> /dev/null

  single_wget \
    https://bitsavers.org/pdf/dec/pdp11/1170 \
    PDP-11_70_Handbook_1977-78.pdf \
    $LOGFILE

  single_wget \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s \
    Pieper_RSX_A_Guide_For_Users_1987.pdf \
    $LOGFILE

  single_wget \
    https://bitsavers.org/pdf/dec/pdp11/rsx11m_s/RSX11M_V4.2_Jul85 \
    AA-L763B-TC_Introduction_to_RSX-11M_198507.pdf \
    $LOGFILE

popd > /dev/null

pushd "$HOME/Documents" > /dev/null
  echo "Cloning Usagi Electric Repository"
  git clone https://github.com/Nakazoto/FloatingPointSystems.git

popd > /dev/null

echo "* Finished Download Documents *"
