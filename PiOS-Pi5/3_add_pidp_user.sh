#! /usr/bin/env bash

set -e

echo ""
echo "*** Add PiDP User ***"

mkdir --parents $PWD/Logs
export LOGFILE=$PWD/Logs/add_pidp_user.log
rm --force $LOGFILE

sudo useradd \
  --comment "PiDP 11 User" \
  --create-home \
  --groups sudo \
  --shell /usr/bin/bash \
  --user-group \
  pi

echo "Enter a password for the 'pi' user"
sudo passwd pi

echo "*** Finished Add PiDP User ***"
