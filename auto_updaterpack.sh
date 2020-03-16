#!/bin/bash

#-o origin version
#-n new version

while getopts o:n: option
do
case "${option}"
in
o) ORIGIN=${OPTARG};;
n) NEW=${OPTARG};;
p) BOARD=${OPTARG};;
b) board=${OPTARG};;
esac
done

echo "------modify srcuris------"
cd ~/trunk/src/private-overlays/overlay-${board}-private/chromeos-base/chromeos-firmware-${board}/files

sed -i 's/${BOARD}.12200.${ORIGIN}.0.tbz/${BOARD}.12200.${NEW}.0.tbz2/' srcuris

sed -i 's/${BOARD}_signed.12200.${ORIGIN}.0.tbz2/${BOARD}_signed.12200.${NEW}.0.tbz2/' srcuris

cat srcuris | grep ${BOARD}

echo "------modify model.yaml------"
cd ~/trunk/src/private-overlays/overlay-${board}-private/chromeos-base/chromeos-config-bsp-${board}-private/files

sed -i 's/${BOARD}.12200.${ORIGIN}.0.tbz/${BOARD}.12200.${NEW}.0.tbz2/' model.yaml

sed -i 's/${BOARD}_signed.12200.${ORIGIN}.0.tbz2/${BOARD}_signed.12200.${NEW}.0.tbz2/' model.yaml

cat model.yaml | grep ${BOARD}


echo "------making new updater------"
ACCEPT_LICENSE="Google-TOS" ~/trunk/src/platform/dev/contrib/cros_update_firmware --board=${board}

echo "------unpack updater------"
sudo rm -rg /tmp/new
mkdir /tmp/new/
cd /build/sarien/usr/sbin
./chromeos-firmwareupdate --unpack /tmp/new
echo "------updater is in /tmp/new------"
echo "------coreboot images are in /tmp/new/images------"

