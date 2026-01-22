#! /usr/bin/env bash

set -e

echo "* Re-create Container *"
echo ""
echo "Setting environment variables"
source ./set_envars

echo ""
echo "Removing any existing distrobox container $DBX_CONTAINER_NAME"
distrobox rm --force $DBX_CONTAINER_NAME

echo "Removing any existing distrobox home directory $DBX_CONTAINER_DIRECTORY"
rm -rf $DBX_CONTAINER_DIRECTORY

echo "Pulling $DBX_CONTAINER_IMAGE"
podman pull $DBX_CONTAINER_IMAGE

echo "Creating distrobox $DBX_CONTAINER_NAME"
distrobox create \
  --image $DBX_CONTAINER_IMAGE \
  --name $DBX_CONTAINER_NAME \
  --hostname $DBX_CONTAINER_HOSTNAME \
  --pull \
  --home $DBX_CONTAINER_DIRECTORY \
  --additional-packages "systemd libpam-systemd apt-file build-essential gfortran git libreoffice-writer info plocate python3-full time vim zstd" \
  --nvidia \
  --init
  
echo "Copying 'set_envars' and $HOME/.ssh into $DBX_CONTAINER_DIRECTORY"
cp -rp set_envars $HOME/.ssh $DBX_CONTAINER_DIRECTORY/
echo "Entering $DBX_CONTAINER_NAME"
echo "This will take some time."
echo "It is downloading and installing basic packages."
echo ""
echo ""
distrobox enter "$DBX_CONTAINER_NAME" -- ./2_terminal_setup.sh

echo "* Finished Re-create Container *"
