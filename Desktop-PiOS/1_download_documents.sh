#! /usr/bin/env bash

set -e

echo ""
echo "* Download Documents *"

mkdir --parents $HOME/Logfiles
export LOGFILE=$HOME/Logfiles/1_download_documents.log
rm --force $LOGFILE

mkdir --parents "$HOME/Documents/PiDP_11"
pushd "$HOME/Documents/PiDP_11" > /dev/null
  echo "PiDP 11 Manual: \$HOME/Documents/PiDP_11" | tee --append $LOGFILE
  curl --silent --location --remote-name \
    https://obsolescence.dev/pidp11/PiDP-11_Manual.pdf
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

mkdir --parents "$HOME/Documents/FPS-100"
pushd "$HOME/Documents/FPS-100" > /dev/null
  echo "FPS-100 Manuals: \$HOME/Documents/FPS-100" | tee --append $LOGFILE
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/800-7428-001_FPS-100_Assembler_ASM100_Reference_Manual_197909.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/860-7404-000_FPS100_2.5kROM.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS100_LibraryEditor.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS100_Loader.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS100_Specifications.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS100_SupervisorRefMan.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/FPS-100/FPS100_VectorFuncChainer.pdf  
popd > /dev/null

mkdir --parents "$HOME/Documents/AP-120B"
pushd "$HOME/Documents/AP-120B" > /dev/null
  echo "AP-120B Manuals: \$HOME/Documents/AP-120B" | tee --append $LOGFILE
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/7259-02_AP-120B_procHbk.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/860-7288-004_AP_mathLibr.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/860-7292-002_AP-120B_Program_Development_Software_Manual_Sep78.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/860-7319-000_AP-120B_Programmers_Reference_Manual_Part_2_Jan78.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/fast_mem_ucode.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/FPS-7284-01_AP-120B_Diagnostic_Manual_197601.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/FPS-7319_Programmers_Reference_Manual_Part_1_197801.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/FPS-7319_Programmers_Reference_Manual_Part_2_197801.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/FPS-7352_AP-120B_Math_Library_Routines_197706.pdf
  curl --silent --location --remote-name \
    https://bitsavers.org/pdf/floatingPointSystems/AP-120B/FPS-7364-01_APDBUG_Manual_197802.pdf
popd > /dev/null

echo ""
echo "Downloading fresh copy of FPS software to \$HOME/fps100sw"
pushd $HOME > /dev/null
  rm --force --recursive fps100sw*
  wget --quiet \
    https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100sw.zip
  unzip fps100sw.zip \
    >> $LOGFILE
  rm --force fps100sw.zip
  chmod o+rx fps100sw
  chmod go+r fps100sw/*
popd > /dev/null

echo "* Finished Download Documents *"
