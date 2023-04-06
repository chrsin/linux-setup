#!/bin/bash
#Enrolls luks into tpm so you don't have to type password everytime you boot
#Script is inspired by the excellent instructions at https://gist.github.com/jdoss/777e8b52c8d88eb87467935769c98a95

set -e
DEVID=$(sudo blkid -t TYPE=crypto_LUKS | awk '{print $1;}' | sed 's/://')

if [ $DEVID ]
then
  	echo Device id is: $DEVID
else 
	echo No encrypted devices found
  	exit 1
fi 

for DEVICE in $DEVID
do
	echo "Enrolling $DEVICE for tpm"
	sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+4+7 $DEVICE
	echo "Done... Generating a recovery key for $DEVICE"
	sudo systemd-cryptenroll --recovery-key $DEVICE
done
