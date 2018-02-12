#!/bin/bash

if blkid | grep RANCHER_STATE; then
	# don't re-format
	echo "DONE"
	exit
else
  echo "RancherOS not found"
fi

INSTALL_DISK="/dev/vda"
if ! fdisk -l $INSTALL_DISK > /dev/null 2/&1; then
	INSTALL_DISK="/dev/sda"
  echo "RancherOS Installdisk - /dev/sda"
else
  echo "RancherOS Installdisk - /dev/vda"
fi
