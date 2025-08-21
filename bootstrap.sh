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
apk add shadow bash bash-completion --no-cache
chsh -s /bin/bash
echo -e "luckfox\nluckfox" | passwd
apk del -r shadow

# Install SSH
apk add dropbear mtd-utils-ubi bottom fastfetch unudhcpd --no-cache
rc-update add dropbear default

# Clear apk cache
rm -rf /var/cache/apk/*

# Packaging rootfs
for d in bin etc lib sbin usr; do tar c "$d" | tar x -C /extrootfs; done
for dir in dev proc root run sys var oem userdata; do mkdir /extrootfs/${dir}; done
