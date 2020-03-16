#!/bin/bash

#DEFAULT_IMAGE="chromeos_image.bin"

while getopts i: option
do 
case "${option}"
in
i) DEFAULT_IMAGE=${OPTARG};;
esac
done

echo "------mount chromeOS image------"
~/trunk/src/scripts/mount_gpt_image.sh -f /tmp/ -i ${DEFAULT_IMAGE} 

echo "------copy updater to /tmp/new/------"
cd /tmp/m/usr/sbin
sudo chmod 777 chromeos-firmwareupdate
sudo rm -rf /tmp/new
mkdir /tmp/new
sudo cp chromeos-firmwareupdate /tmp/new
cd /tmp/new
echo "------unpack updater------"
./chromeos-firmwareupdate --unpack /tmp/new/

cd images

echo "------unmount Chromeos image------"
~/trunk/src/scripts/mount_gpt_image.sh -u


echo "------The coreboots are in /tmp/new/images ------"
