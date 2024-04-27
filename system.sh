#!/bin/bash

BOARDCONFIG="BoardConfig-SPI_NAND-Buildroot-RV1103_Luckfox_Pico_Mini_B-IPC.mk"
ROOTFS_NAME="rootfs-alpine.tar.gz"

pushd sdk || exit

rm -rf sysdrv/custom_rootfs
mkdir -p sysdrv/custom_rootfs

pushd tools/linux/toolchain/arm-rockchip830-linux-uclibcgnueabihf/ || exit
source env_install_toolchain.sh
popd || exit

rm -rf .BoardConfig.mk
cp "project/cfg/BoardConfig_IPC/$BOARDCONFIG" .BoardConfig.mk
echo "export RK_CUSTOM_ROOTFS=../sysdrv/custom_rootfs/$ROOTFS_NAME" >> .BoardConfig.mk

./build.sh

popd || exit
