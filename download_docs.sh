#! /usr/bin/env bash

set -e

echo ""
echo "* Download Docs *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/download_docs.log
rm --force $LOGFILE

mkdir --parents $HOME/Documents
pushd $HOME/Docs > /dev/null
  echo "PiDP 11 Manual"
  curl --silent --location --remote-name \
    https://obsolescence.dev/pidp11/PiDP-11_Manual.pdf
  echo "pdp11/70 Processor Manual"
  curl --silent --location --remote-name \
    https://bitsavers.trailing-edge.com/pdf/dec/pdp11/1170/PDP-11_70_Handbook_1977-78.pdf
  echo "RSX-11M"
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
  echo "PDP-11 Fortran IV"
  curl --silent --location --remote-name \
    https://www.dmv.net/dec/pdf/pdp11fortranivlrm.pdf
popd > /dev/null

echo "* Finished Download Docs *"
