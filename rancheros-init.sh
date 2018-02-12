#!/bin/bash

clear

if blkid | grep RANCHER_STATE; then
	# don't re-format
	echo "DONE"
	exit
else
  echo "[ RancherOS ] Install Proceeding"
fi

INSTALL_DISK="/dev/vda"
if ! fdisk -l $INSTALL_DISK > /dev/null 2>&1; then
	INSTALL_DISK="/dev/sda"
  echo "[ RancherOS ] Installdisk - /dev/sda"
else
  echo "[ RancherOS ] Installdisk - /dev/vda"
fi


V4_PRIVATE_IP='wget -q -O - http://169.254.169.254/current/meta-data/local-ipv4'
HOSTNAME='wget -q -O - http://169.254.169.254/current/meta-data/hostname'






cat > "cloud-config.yaml" <<EOF
#cloud-config
hostname: $HOSTNAME
ssh_authorized_keys:
  - ssh-rsa ...
write_files:
  - path: /etc/ssh/sshd_config
    permissions: "0600"
    owner: root:root
    content: |
      AuthorizedKeysFile .ssh/authorized_keys
      ClientAliveInterval 180
      Subsystem	sftp /usr/libexec/sftp-server
      UseDNS no
      PermitRootLogin no
      ServerKeyBits 2048
      AllowGroups docker
rancher:
  network:
    dns:
      nameserver:
        - 8.8.8.8
        - 8.8.4.4
    interfaces:
      eth0:
        dhcp: true
      eth1:
        address: $V4_PRIVATE_IP/16
        mtu: 1450
  state:
   fstype: auto
   dev: LABEL=RANCHER_STATE
   autoformat:
     - /dev/vda
EOF
