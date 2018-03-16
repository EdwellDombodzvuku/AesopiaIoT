#!/usr/bin/env bash

# Define the installation routine for this module
echo "Installing Dropbox"
sudo rm -rf /home/pi/aesopia/modules/dropbox/binaries/dropbox.conf
sudo ./modules/dropbox/binaries/dropbox_uploader.sh -f /home/pi/aesopia/modules/dropbox/binaries/dropbox.conf
