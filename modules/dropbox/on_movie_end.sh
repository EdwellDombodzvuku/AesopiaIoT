#!/usr/bin/env bash

#Define on_movie_end routine for this module. Path to file is available through variable $1 and name of the camera through variable $2

echo "on_movie_end routine for Dropbox"
sudo /home/pi/aesopia/modules/dropbox/binaries/dropbox_uploader.sh -f /home/pi/aesopia/modules/dropbox/binaries/dropbox.conf upload $1 /$2/ && sudo rm -rf $1
