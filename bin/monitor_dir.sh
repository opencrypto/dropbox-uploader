#!/bin/bash

# Requirements
#
# sudo apt install inotify-tools

# Directory to monitor
DIR_TO_MONITOR="/var/share/dropbox"
UPLOAD_CMD=/root/bin/dropbox_uploader.sh

# Check if the directory exists
if [ ! -d "$DIR_TO_MONITOR" ]; then
	mkdir -p "$DIR_TO_MONITOR"
	mkdir -p "$DIR_TO_MONITOR/processed"
fi

# Get into the monitored directory
cd "$DIR_TO_MONITOR"
if [ ! -d "$DIR_TO_MONITOR" ] ; then
	echo
	echo "ERROR: Directory does not exists ($DIR_TO_MONITOR)"
	echo
	exit 1
fi

# Infinite loop to continuously monitor the directory
while true; do
  sleep 5
  # Use inotifywait to monitor for file creation and modification
  # inotifywait -m -e create -e modify --format "%f" "$DIR_TO_MONITOR" | while read FILENAME
  for FILENAME in * ; do
    if [ -d "$FILENAME" ] ; then
      continue
    fi
    echo -n "Uploading File: $FILENAME"
    echo $PWD
    ls -la $FILENAME
    $UPLOAD_CMD upload "$FILENAME" "./"
    if [ $? -gt 0 ] ; then
	echo
	echo "ERORR: cannot upload $FILENAME."
	echo
    else
	mv "$FILENAME" "./processed/"
    fi
    echo "Ok."
  done
done
