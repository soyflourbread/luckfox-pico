#!/bin/sh

# Install base
apk update
apk add openrc
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot
rc-update add networking default
rc-update add local default

# Install SSH
apk add openssh
rc-update add sshd default

# Extra stuff
apk add bottom

# Clear apk cache
rm -rf /var/cache/apk/*

