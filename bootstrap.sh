#!/bin/sh

# Install base
apk update
apk add openrc
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot
rc-update add networking default
rc-update add local default

# Install TTY
apk add agetty

# Setting up shell
apk add shadow
apk add bash bash-completion
chsh -s /bin/bash
echo -e "luckfox\nluckfox" | passwd
apk del -r shadow

# Install SSH
apk add openssh
rc-update add sshd default
chown 0:0 /var/empty

# Extra stuff
apk add mtd-utils-ubi
apk add bottom
#apk add neofetch
apk add e2fsprogs-extra

# Install iptables-legacy
apk add iptables-legacy
rc-update add iptables-legacy
ln -s /usr/sbin/iptables-legacy /usr/sbin/iptables

# Install tailscale
apk add tailscale
rc-update add tailscale default 

# install wireguard
apk add wireguard-tools

# Install Chrony
apk add chrony
rc-update add chrony default 

# install curl
apk add curl

# install nano
apk add nano

# install ca-certificates
apk add ca-certificates
update-ca-certificates

# install staticroute
rc-update add staticroute

# install ethtool
apk add ehtool

# Clear apk cache
rm -rf /var/cache/apk/*

# Packaging rootfs
for d in bin etc lib sbin usr var; do tar c "$d" | tar x -C /extrootfs; done
for dir in dev proc root run sys oem userdata; do mkdir /extrootfs/${dir}; done
